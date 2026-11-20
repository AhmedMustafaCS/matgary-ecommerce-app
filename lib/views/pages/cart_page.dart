import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:matgary/utils/app_colors.dart';
import 'package:matgary/view_models/cart_cubit/cart_cubit.dart';
import 'package:matgary/views/widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: BlocProvider.of<CartCubit>(context),
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            if (cartItems.isEmpty) {
              return const Center(
                child: Text('No items in your cart!'),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return CartItemWidget(cartItem: cartItem);
                    },
                    separatorBuilder: (context, index) {
                      return  Divider(color: AppColors.grey200,);
                    },
                  ),
                  Divider(color: AppColors.grey200,),
                ],
              ),
            );
          } else if (state is CartError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
