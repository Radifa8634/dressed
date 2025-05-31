import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "images/profilepic.jpeg",
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),

          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 350), // space below image
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Profile image + buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      children: [
                                        const CircleAvatar(
                                          radius: 42,
                                          backgroundImage: AssetImage("images/profilepic.jpeg"),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(255, 95, 225, 99),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: Colors.black54)),
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          child: const Text(
                                            "ADD FRIEND",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.pink,
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          child: const Text(
                                            "Follow",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Radifa Naveed",
                                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                                ),
                                const Text(
                                  "Flutter Developer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800, fontSize: 12, color: Colors.black45),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "A modern shopping app built with Flutter that delivers a smooth, responsive, and visually appealing experience. Browse categories like Shoes, Watches, Bags, and more, view product details, add to cart, and manage your profile — all in one sleek interface.",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Colors.black12),
                          SizedBox(
                            height: 65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                friendAndMore("FRIENDS", "2318"),
                                friendAndMore("FOLLOWING", "364"),
                                friendAndMore("FOLLOWER", "175"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static SizedBox friendAndMore(String title, String number) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black26,
            ),
          ),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
