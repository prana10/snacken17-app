import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          items: [1, 2, 3, 4, 5]
              .map((e) => Container(
                    width: 400,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "text ke : $e",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            initialPage: 1,
            autoPlay: true,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            height: 500,
          ),
        ),
      ),
    );
  }
}
