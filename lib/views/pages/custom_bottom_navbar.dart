import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:matgary/views/pages/orders_page.dart';
import 'package:matgary/views/pages/favorites_page.dart';
import 'package:matgary/views/pages/home_page.dart';
import 'package:matgary/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            activeForegroundColor: Colors.indigo,
            inactiveIcon: const Icon(Iconsax.home_copy),
            icon: const Icon(
              Iconsax.home_2,
            ),
            title: 'Home',
          ),
        ),
        PersistentTabConfig(
          screen: OrdersPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.indigo,
            inactiveIcon: const Icon(Iconsax.truck_fast_copy),
            icon: const Icon(
              Iconsax.truck_fast,
            ),
            title: 'My Orders',
          ),
        ),
        PersistentTabConfig(
          screen: const FavoritesPage(),
          item: ItemConfig(
            activeForegroundColor: Colors.indigo,
            inactiveIcon: const Icon(Iconsax.heart_copy),
            icon: const Icon(
              Iconsax.heart,
            ),
            title: 'Favorites',
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            activeForegroundColor: Colors.indigo,
            inactiveIcon: const Icon(Iconsax.user_copy),
            icon: const Icon(Iconsax.user),
            title: 'My Profile',
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
