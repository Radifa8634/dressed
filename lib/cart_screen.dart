import 'package:dressed/check_out.dart';
import 'package:dressed/products.dart';
import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'nav_bar_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    //for quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index);
          });
        },
        child: Icon(icon,size: 15,),
      );
    }

    return Scaffold(
      // for total and check out
      bottomSheet: CheckOutBox(),


      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black,),

                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItems = finalList[index];

                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Image.asset(cartItems.image),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    cartItems.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "\$${cartItems.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(children: [
                                SizedBox(width: 10,),
                                productQuantity(Icons.add, index),
                  SizedBox(width: 10,),
                                Text(
                                  cartItems.quantity.toString(),
                                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                productQuantity(Icons.remove, index),
                                SizedBox(width: 10,),

                                  ],
                  ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
