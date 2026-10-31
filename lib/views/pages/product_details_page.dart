import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        children: [],
      ),
    );
  }
}
