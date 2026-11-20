import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:matgary/models/add_to_cart_model.dart';
import 'package:matgary/utils/app_colors.dart';
import 'package:matgary/view_models/cart_cubit/cart_cubit.dart';
import 'package:matgary/views/widgets/counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.imgUrl,
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Size:',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: cartItem.size.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      bloc: cubit,
                      buildWhen: (previous, current) => current is QuantityCounterLoaded || current is CartLoaded,
                      builder: (context, counterState) {
                        final currentValue = (counterState is QuantityCounterLoaded) ? counterState.value : cartItem.quantity;

                        return CounterWidget(value: currentValue, onDecrement: () => cubit.decrementCounter(cartItem.product.id), onIncrement: () => cubit.incrementCounter(cartItem.product.id));
                      },
                    ),
                    Text(
                      '\$${cartItem.product.price}',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
