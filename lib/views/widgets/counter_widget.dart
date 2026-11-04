import 'package:flutter/material.dart';
import 'package:matgary/utils/app_colors.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const CounterWidget({super.key, required this.value, required this.onDecrement, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.remove,
                  size: 21,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: onDecrement,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.add,
                  size: 21,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: onIncrement,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
