import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/screens/email_verification_screen.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigationBar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/category_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/home_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/popular_product_by_remark_controller.dart';
import '../state_managers/new_product_by_remark_controller.dart';
import '../state_managers/special_product_by_remark_controller.dart';
import '../widgets/home/appbar_icon_button.dart';
import '../widgets/home/category_card_widget.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remarks_title_widget.dart';
import '../widgets/home/search_text_field.dart';
import '../widgets/product_card_widget.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value) {
                  if (value) {
                    Get.to(const ProfileScreen());
                  } else {
                    Get.to(const EmailVerificationScreen());
                  }
                });
              },
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextField(),
              const SizedBox(height: 6),
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getSliderInProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeCarouselWidget(
                  homeSliderModel: homeController.homeSliderModel,
                );
              }),
              const SizedBox(height: 1),
              RemarksTitleWidget(
                remarksName: 'All Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              const SizedBox(height: 2),
              GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.categoryInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryController.categoryModel.categories!
                        .map((e) => CategoryCardWidget(
                              productName: e.categoryName.toString(),
                              imageUrl: e.categoryImg.toString(), id: e.id!,
                            ))
                        .toList(),
                  ),
                );
              }),
              const SizedBox(height: 12),
              RemarksTitleWidget(
                remarksName: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 4,
              ),
              GetBuilder<PopularProductByRemarkController>(
                  builder: (popularProductByRemarkController) {
                if (popularProductByRemarkController
                    .getPopularProductByRemarkInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: popularProductByRemarkController
                        .popularProductModel.products!
                        .map((products) => ProductCardWidget(
                      product: products,
                    ))
                        .toList(),
                  ),
                );
              }),
              const SizedBox(height: 16),
              RemarksTitleWidget(
                remarksName: 'Special',
                onTapSeeAll: () {},
              ),
              GetBuilder<SpecialProductByRemarkController>(
                  builder: (specialProductByRemarkController) {
                    if (specialProductByRemarkController
                        .getSpecialProductByRemarkInProgress) {
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: specialProductByRemarkController
                            .specialProductModel.products!
                            .map((products) => ProductCardWidget(
                          product: products,
                        ))
                            .toList(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [

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
              GetBuilder<NewProductByRemarkController>(
                  builder: (newProductByRemarkController) {
                    if (newProductByRemarkController
                        .getNewProductByRemarkInProgress) {
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: newProductByRemarkController
                            .newProductModel.products!
                            .map((products) => ProductCardWidget(
                          product: products,
                        ))
                            .toList(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
