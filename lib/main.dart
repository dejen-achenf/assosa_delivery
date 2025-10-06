import "package:asosa_delivery/features/home/home_screen.dart";
import "package:asosa_delivery/features/cart/cart_screen.dart";
import "package:asosa_delivery/features/profile/profile_screen.dart";
import "package:asosa_delivery/features/restaurant/restaurant_screen.dart";
import "package:flutter/material.dart";

void main() {
  return runApp(const AsosaDeliveryApp());
}

class AsosaDeliveryApp extends StatelessWidget {
  const AsosaDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color seed = Color(0xFF5E60CE);
    final ThemeData baseLight = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seed,
      brightness: Brightness.light,
    );
    final ThemeData baseDark = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seed,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: baseLight,
      darkTheme: baseDark,
      themeMode: ThemeMode.system,
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    Home(),
    CartScreen(),
    RestaurantDetailsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(Icons.shopping_cart),
              label: 'Cart'),
          NavigationDestination(
              icon: Icon(Icons.restaurant_menu_outlined),
              selectedIcon: Icon(Icons.restaurant_menu),
              label: 'Restaurant'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Account'),
        ],
      ),
    );
  }
}
