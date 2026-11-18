import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/models/add_to_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartItems() {
    emit(CartLoading());
    emit(CartLoaded(cartItems: dummyCart));
  }
}
