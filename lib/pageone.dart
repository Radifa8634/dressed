import 'package:dressed/image_slider.dart';//home_screen.dart
import 'package:dressed/search_bar.dart';
import 'package:flutter/material.dart';
import 'home_appbar.dart';
import 'categories.dart';
import 'products.dart';
import 'product_card.dart';
// import 'image_slider.dart';
import 'category.dart';



class pageOne extends StatefulWidget {
  const pageOne({super.key});

  @override
  State<pageOne> createState() => _PageOneState();
}

class _PageOneState extends State<pageOne> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories =[all,Shoes,Watches,Bags,Hats,Shirts,Sweaters,Headphone,MensWear];



    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomAppBar(),
              const SizedBox(height: 10),
              const MySearchBar(),
              const SizedBox(height: 10),

              /// Image slider with callback
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),

              const SizedBox(height: 10),
            SizedBox(
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
            ),



              const SizedBox(height: 10),

              /// Section title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Special For You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Product grid
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: selectedCategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(product: selectedCategories[selectedIndex] [index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
