import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC0CB),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.indigo)
              : SingleChildScrollView(child: _buildRegisterForm()),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/img.png'),
        ),
        const SizedBox(height: 20),
        const Text("Clothique", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        const Text("Register", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        _buildTextField("First Name", controller: _firstNameController),
        const SizedBox(height: 12),
        _buildTextField("Last Name", controller: _lastNameController),
        const SizedBox(height: 12),
        _buildTextField("Email", controller: _emailController, keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 12),
        _buildTextField("Password", controller: _passwordController, obscure: true),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _handleRegister,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("REGISTER", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }

  Future<void> _handleRegister() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("Please fill all fields");
      return;
    }

    if (!email.contains("@") || password.length < 6) {
      _showMessage("Enter a valid email and password (min 6 characters)");
      return;
    }

    setState(() => isLoading = true);
    print("Attempting to register user: $email");

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("User registered successfully: ${userCredential.user?.uid}");

      _showMessage("Registration successful!");

      // Redirect after short delay
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');

    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = "This email is already in use.";
          break;
        case 'invalid-email':
          message = "Invalid email address.";
          break;
        case 'weak-password':
          message = "Password must be at least 6 characters.";
          break;
        default:
          message = "Registration failed: ${e.message}";
      }

      _showMessage(message);

    } catch (e) {
      print("Unexpected error: $e");
      _showMessage("An unexpected error occurred.");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildTextField(String hint,
      {bool obscure = false, TextEditingController? controller, TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
