import 'package:flutter/material.dart';
import 'package:matgary/utils/app_routes.dart';
import 'package:matgary/views/pages/custom_bottom_navbar.dart';
import 'package:matgary/views/pages/product_details_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
        final productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(productId : productId),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
