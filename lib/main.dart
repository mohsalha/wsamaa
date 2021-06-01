import 'package:flutter/material.dart';
import 'package:wsamaa_project/models/add_essay.dart';
import 'package:wsamaa_project/screens/launch_screen.dart';
import 'package:wsamaa_project/screens/main_screen.dart';
import 'package:wsamaa_project/screens/more_screen/add_essay.dart';


main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backwardsCompatibility: false,
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'B',
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/main_screen': (context) => MainScreen(),
        '/add_essay': (context) => AddEsaayScreen(),
      },
    );
  }
}
