import 'package:arudu_customer/pages/groupScreen.dart';
import 'package:arudu_customer/pages/muehle.dart';
import 'package:arudu_customer/pages/newsScreen.dart';
import 'package:arudu_customer/pages/tictactoe.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import "package:arudu_customer/pages/homeScreen.dart";
import "package:arudu_customer/pages/loginScreen.dart";
import "package:arudu_customer/pages/loadingScreen.dart";
import "package:arudu_customer/pages/cartScreen.dart";
import 'package:arudu_customer/pages/searchScreen.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(), //for Preview
  ));
}

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arudu Customer App',
      builder: DevicePreview.appBuilder, //for Preview
      useInheritedMediaQuery: true, //not hidden behind camera
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cart': (context) => CartScreen(),
        '/loading': (context) => LoadingScreen(),
        '/group': (context) => GroupScreen(),
        '/news': (context) => NewsScreen(),
        '/settings': (context) => SearchScreen(),
        '/tictactoe': (context) => TicTacToePage(),
        '/muehle': (context) => MuehlePage(),
      },
    );
  }
}
