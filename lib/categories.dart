import 'package:flutter/material.dart';
import 'category.dart'; // Corrected import path

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });

          },
            child: Container(
            padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedIndex == index ? Colors.white : Colors.transparent,
          ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 5),
                Text(
                  categories[index].title, // Fixed typo here
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          );
        },

      ),
    );

  }
}
