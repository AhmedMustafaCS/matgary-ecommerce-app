import 'package:flutter/widgets.dart';
import 'package:matgary/models/add_to_cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;
  const CartItemWidget({super.key,required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ],
    );
  }
}
