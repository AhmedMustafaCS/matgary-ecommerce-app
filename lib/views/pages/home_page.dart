import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:matgary/utils/app_assets.dart';
import 'package:matgary/utils/app_colors.dart';
import 'package:matgary/views/widgets/category_tab_view.dart';
import 'package:matgary/views/widgets/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tapController;
  @override
  void initState() {
    super.initState();
    _tapController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                          AppAssets.userAvatar,
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
                                  color: AppColors.grey,
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
              const SizedBox(height: 24.0),
              TabBar(
                controller: _tapController,
                unselectedLabelColor: AppColors.grey,
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 35),
                indicatorWeight: 2.2,
                labelColor: AppColors.black,
                tabs: const [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Category',
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: TabBarView(
                  controller: _tapController,
                  children: const [
                    HomeTabView(),
                    CategoryTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
