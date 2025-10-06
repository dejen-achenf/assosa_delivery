import "package:asosa_delivery/core/utils/helper.dart";
import "package:asosa_delivery/features/home/home_screen.dart";
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
      home: const NearMeScreen(),
    );
  }
}
