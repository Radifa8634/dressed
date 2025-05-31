import 'package:flutter/material.dart';

class ItemsDetail extends StatelessWidget {
  final product;

  const ItemsDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),

                SizedBox(height: 10),
                //for ratting
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 15, color: Colors.white),
                          SizedBox(width: 3),
                          Text(
                            "\$${product.rate.toString()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      product.review,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: " Seller",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
