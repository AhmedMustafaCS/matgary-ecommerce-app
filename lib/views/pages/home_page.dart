import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/245307900?v=4',
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Ahmed Mustafa',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Let\'s go shopping!',
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.search_normal_1_copy),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.notification_copy),
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
    );
  }
}
