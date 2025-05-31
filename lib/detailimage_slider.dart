import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;

  const DetailImageSlider({super.key, required this.image, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        onPageChanged: onChange,
        // Use the length of the image list
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(
              image
            ),
          );
        },
      ),
    );
  }
}
