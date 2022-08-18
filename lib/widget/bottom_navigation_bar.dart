import 'package:anand_shop_app/screen/account_dashboard/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../provider/common_provider.dart';
import '../screen/home_screen.dart';
import '../utils/colors.dart';

class AppBottomNavigationBar extends ConsumerStatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState
    extends ConsumerState<AppBottomNavigationBar> {
  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    ref.read(bottomNavigationProvider.notifier).change(index);
  }

  @override
  Widget build(BuildContext context) {
    int indexValue = ref.watch(bottomNavigationProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[indexValue],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteSnowBgClr,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_2,
                color: indexValue == 0 ? primaryColor : blackShadeTextClr,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.user,
                color: indexValue == 1 ? primaryColor : blackShadeTextClr,
              ),
              label: 'My Account',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: indexValue,
          selectedItemColor: primaryColor,
          unselectedItemColor: blackShadeTextClr,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          iconSize: 24,
          onTap: _onItemTapped,
          elevation: 0),
    );
  }
}
