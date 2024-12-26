import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  final PageController pageController;
  final List<String> images;

  const Carousel({
    required this.pageController,
    required this.images,
  });

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Auto-slide carousel every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (widget.pageController.hasClients) {
        final nextPage =
            (widget.pageController.page?.toInt() ?? 0) + 1; // Current + 1
        widget.pageController.animateToPage(
          nextPage % widget.images.length, // Loop back to the start
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Transform(
            transform: Matrix4.skewX(-0.2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 27, 49),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SmoothPageIndicator(
                controller: widget.pageController,
                count: widget.images.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
