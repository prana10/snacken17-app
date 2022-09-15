import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'presentations/presentations.dart';

class PkkApp extends StatelessWidget {
  const PkkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/form': (context) => const FormPage(),
      },
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
