import 'package:flutter/material.dart';
import 'package:news_app/models/list/sliderModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomScrollIndicator extends StatelessWidget {
  const CustomScrollIndicator({
    super.key,
    required this.activeIndex,
    required this.sliders,
  });

  final int activeIndex;
  final List<SliderModel> sliders;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: const ScrollingDotsEffect(
          activeDotColor: Colors.white,
          dotColor: Colors.black26,
          dotHeight: 15,
          dotWidth: 10,
        ),
      ),
    );
  }
}