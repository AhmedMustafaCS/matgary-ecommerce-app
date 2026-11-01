import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/utils/app_colors.dart';
import 'package:matgary/view_models/product_details_cubit/product_details_cubit.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
      builder: (context, state) {
        if (state is ProdcutDetailsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        } else if (state is ProductDetailsLoaded) {
          final product = state.product;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text('Product Details'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                )
              ],
            ),
            body: Stack(
              children: [
                Container(
                  height: size.height * 0.52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grey200,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        height: size.height * 0.4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.47),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                        size: 25,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '${product.averageRate}',
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Something Went Wrong!'),
            ),
          );
        }
      },
    );
  }
}
