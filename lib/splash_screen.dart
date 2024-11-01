import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/amiibo_logic.dart';
import 'logic/language_logic.dart';
import 'logic/theme_logic.dart';
import 'main_screen.dart';

//loading screen
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
    int _themeIndex = context.watch<ThemeLogic>().themeIndex;

    return FutureBuilder(
        future: context.read<AmiiboLogic>().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              home: MyApp());
          } else {
            return _buildLoading(_themeIndex);
          }
        });
  }

  Widget _buildLoading(int _themeIndex) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: _themeIndex == 0 ? Colors.white : Colors.black,
      body: Center(
          child: Image.asset(
        _themeIndex == 0 ? "images/light_logo.png" : "images/dark_logo.png",
        // "images/light_logo.png",
        width: 200,
        height: 200,
      )),
    ));
  }
}
