import 'package:dressed/description.dart';
import 'package:dressed/detailimage_slider.dart';
import 'package:flutter/material.dart';
import 'products.dart';
import 'detail_app_bar.dart';
import 'items_detail.dart';
import 'addto_cart.dart';


class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //for add to cart,icon and quantity
      floatingActionButton: AddtoCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
    child: SingleChildScrollView(
        child: Column(
          children: [
             DetailAppBar(product: widget.product,),
            // Text(widget.product.title),
            // for detail image slider
            DetailImageSlider(
              image:
                  widget.product.image, // Use the images list from the product
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
            ),
            SizedBox(height: 10), // Removed const
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    color:
                        currentImage == index
                            ? Colors.white
                            : Colors.transparent,
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //for product
                  ItemsDetail(product: widget.product),
                  SizedBox(height: 20),
                  Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      widget.product.colors.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                currentColor == index
                                    ? Colors.white
                                    : widget.product.colors[index],
                            border:
                                currentColor == index
                                    ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                    : null,
                          ),
                          padding:
                              currentColor == index ? EdgeInsets.all(2) : null,
                          margin: EdgeInsets.only(right: 5),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //for description
                  Description(description: widget.product.description),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
