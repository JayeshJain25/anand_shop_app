import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/screen/account_dashboard/account_screen.dart';
import 'package:anand_shop_app/screen/account_dashboard/profile_screen.dart';
import 'package:anand_shop_app/screen/auth/login_screen.dart';
import 'package:anand_shop_app/screen/auth/select_user_screen.dart';
import 'package:anand_shop_app/screen/auth/sign_up_screen.dart';
import 'package:anand_shop_app/screen/home_screen.dart';
import 'package:anand_shop_app/screen/product_detail_screen.dart';
import 'package:anand_shop_app/screen/product_list.dart';
import 'package:anand_shop_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteName.selectUser:
        return MaterialPageRoute(
          builder: (_) => const SelectUserScreen(),
        );
      case RouteName.signIn:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouteName.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteName.bottomNavigation:
        return MaterialPageRoute(
          builder: (_) => const AppBottomNavigationBar(),
        );
      case RouteName.accountScreen:
        return MaterialPageRoute(
          builder: (_) => const AccountScreen(),
        );
      case RouteName.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case RouteName.productListScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductListScreen(),
        );
      case RouteName.productDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailScreen(),
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
