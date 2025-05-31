import 'package:flutter/material.dart';
import 'home.dart';
import 'favourite.dart';
import 'cart_screen.dart';
import 'pageOne.dart';
import 'profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  final List<Widget> screens = const [
    Scaffold(),      // Grid
    Favourite(),    // Favourite
    pageOne(),     // Home
    CartScreen(),   // Cart
    Profile(),      // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.pink,
        child: const Icon(Icons.home, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => setState(() => currentIndex = 0),
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? Colors.pink : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => currentIndex = 1),
              icon: Icon(
                Icons.favorite_outline,
                size: 30,
                color: currentIndex == 1 ? Colors.pink : Colors.grey,
              ),
            ),
            const SizedBox(width: 15), // Space for FAB
            IconButton(
              onPressed: () => setState(() => currentIndex = 3),
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 3 ? Colors.pink : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => currentIndex = 4),
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 4 ? Colors.pink : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
