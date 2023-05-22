import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/common_elevated_button.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/product_details/product_image_carousal.dart';
import '../widgets/product_stepper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Color(0xFF000000),
    Color(0xFF7B2828),
    Color(0xFF251497),
    Color(0xFF08781A),
    Color(0xFF7E0472),
  ];

  List<String> sizes = [
    'X',
    'XL',
    '2L',
    'XXL',
  ];

  Color _selectedColor = Color(0xFF000000);
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselWidget(),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apex casuel snekaers B90X3',
                                    style: titleTextStyle.copyWith(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: greyColor.withOpacity(0.8)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Reviews',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: primaryColor,
                                              fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ProductStepperWidget(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: greyColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: colors.map((color) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_selectedColor != color) {
                                      _selectedColor = color;
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: color,
                                    radius: 15,
                                    child: Visibility(
                                      visible: color == _selectedColor,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: greyColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: sizes.map((size) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_selectedSize != size) {
                                      _selectedSize = size;
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            size == _selectedSize ? primaryColor : null,
                                        borderRadius: BorderRadius.circular(300),
                                        border: Border.all(color: greyColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                            color: size == _selectedSize
                                                ? Colors.white
                                                : null,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: greyColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: softGreyColor),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              )

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6)
                      ),),
                      Text('\$1,000', style: TextStyle(fontSize: 18,color: primaryColor),),
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: CommonElevatedButton(
                      onTap: (){},
                      title: "Add to Cart",
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
