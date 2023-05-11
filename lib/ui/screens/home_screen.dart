import 'package:flutter/material.dart';
import '../widgets/home/appbar_icon_button.dart';
import '../widgets/home/category_card_widget.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remarks_title_widget.dart';
import '../widgets/home/search_text_field.dart';
import '../widgets/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButtonWidget(
              iconData: Icons.person_outline_outlined,
              onTap: () {},
            ),
            AppBarIconButtonWidget(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButtonWidget(
              iconData: Icons.notifications_active,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(height: 6),
              HomeCarouselWidget(),
              const SizedBox(height: 1),
              RemarksTitleWidget(
                remarksName: 'All Categories',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 2),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCardWidget(
                      productName: 'Computer',
                    ),
                    CategoryCardWidget(
                      productName: 'Electronics',
                    ),
                    CategoryCardWidget(
                      productName: 'Clothes',
                    ),
                    CategoryCardWidget(
                      productName: 'Food',
                    ),
                    CategoryCardWidget(
                      productName: 'Computer',
                    ),
                    CategoryCardWidget(
                      productName: 'Computer',
                    ),
                    CategoryCardWidget(
                      productName: 'Computer',
                    ),
                    CategoryCardWidget(
                      productName: 'Computer',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              RemarksTitleWidget(
                remarksName: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 4,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
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

