import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  void getProductDetails(String id) {
    emit(ProdcutDetailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      emit(
        ProductDetailsLoaded(
          product: selectedProduct,
        ),
      );
    });
  }
}
