import 'package:flutter/material.dart';
import 'package:matgary/models/category_model.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          final bool isTextOnLeft = index.isEven;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {},
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      category.imagePath,
                    ),
                  ),
                  Positioned(
                    top: 22,
                    left: isTextOnLeft ? 22 : null,
                    right: isTextOnLeft ? null : 22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
                        ),
                        Text('${category.productsCount} products', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyCategories.length);
  }
}
