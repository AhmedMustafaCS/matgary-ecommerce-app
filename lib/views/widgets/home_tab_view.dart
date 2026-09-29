import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:matgary/models/home_carousel_item_model.dart';
import 'package:matgary/models/product_item_model.dart';
import 'package:matgary/utils/app_colors.dart';
import 'package:matgary/views/widgets/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FlutterCarousel.builder(
            itemCount: dummyHomeCarouselItems.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl: dummyHomeCarouselItems[itemIndex].imgUrl,
                  width: 400,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
            options: FlutterCarouselOptions(
              height: 215,
              showIndicator: true,
              floatingIndicator: false,
              slideIndicator: CircularWaveSlideIndicator(
                slideIndicatorOptions: SlideIndicatorOptions(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                  indicatorRadius: 4.0,
                  itemSpacing: 14,
                  currentIndicatorColor: AppColors.primary,
                  indicatorBackgroundColor: AppColors.grey300,
                ),
              ),
              autoPlay: true,
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrivals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          GridView.builder(
            itemCount: dummyProducts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                productItem: dummyProducts[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
