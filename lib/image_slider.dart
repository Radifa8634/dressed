import 'package:flutter/material.dart';




class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;
  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: ClampingScrollPhysics(),
              children: [
                Image.asset("images/slider (1).jpg", fit: BoxFit.cover),
                Image.asset("images/slider (2).jpg", fit: BoxFit.cover),
                Image.asset("images/slider (3).jpg", fit: BoxFit.cover),
                Image.asset("images/slider (4).jpg", fit: BoxFit.cover),
                Image.asset("images/slider 5.jpg", fit: BoxFit.cover),
                Image.asset("images/hat.jpeg", fit: BoxFit.cover),
                Image.asset("images/sweater.jpeg", fit: BoxFit.cover),
                Image.asset("images/bag.jpeg", fit: BoxFit.cover),
                Image.asset("images/watch1.jpeg", fit: BoxFit.cover),

                Image.asset("images/shirt.jpeg", fit: BoxFit.cover),


              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    color:
                    currentSlide == index
                        ? Colors.white
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}