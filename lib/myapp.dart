import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/amiibo_logic.dart';
import 'screen/home_screen.dart';
import 'state_module/language_logic.dart';
import 'state_module/theme_logic.dart';

Widget stateAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => LanguageLogic()),
      ChangeNotifierProvider(create: (context) => AmiiboLogic()),
    ],
    child: SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<AmiiboLogic>().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          } else {
            return _buildLoading();
          }
        });
  }

  Widget _buildLoading() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 100,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent[700],
              unselectedItemColor: Colors.grey)),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(244, 20, 20, 20),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.blueAccent[700],
            unselectedItemColor: Colors.white,
          )),
    );
  }
}
