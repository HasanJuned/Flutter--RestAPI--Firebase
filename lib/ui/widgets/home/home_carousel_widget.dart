import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {

  ValueNotifier<int> currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 160.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, _) {
                currentCarouselIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/sneakers.jpg'),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: currentCarouselIndex,
          builder: (context, currentValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: currentValue == i ? primaryColor : null,
                        border: Border.all(color: greyColor.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
