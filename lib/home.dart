import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/providers/bottom_nav_provider.dart'; // Import your bottom nav provider
import 'package:provider_tut/view/home_page.dart';
import 'package:provider_tut/view/settings_page.dart'; // Import your settings page widget

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, _) => Scaffold(
        body: IndexedStack(
          index: bottomNavProvider.selectedIndex,
          children: [
            const HomePage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: bottomNavProvider.selectedIndex,
          onTap: (index) {
            bottomNavProvider.setSelectedIndex(index);
          },
        ),
      ),
    );
  }
}
