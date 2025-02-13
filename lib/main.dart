import 'package:assistance_app/Controller/YtController.dart';
import 'package:assistance_app/Views/HomeScreen.dart';
import 'package:assistance_app/Views/JobScreens/SearchJobScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Controller/JobController.dart';

void main() {
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobController()),
                ChangeNotifierProvider(create: (_) => Ytcontroller()),

      ],
      child: MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home:  Homescreen(),
    );
  }
}
