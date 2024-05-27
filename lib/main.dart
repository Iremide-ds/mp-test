import 'package:flutter/material.dart';
import 'package:moniepoint/parent.dart';
import 'package:moniepoint/util/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        useMaterial3: true,
        fontFamily: 'Euclid',
      ),
      home: const AppDashboardPage(),
    );
  }
}
