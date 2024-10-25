// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../screen/home_screen.dart';
// import 'language_logic.dart';
// import 'theme_logic.dart';

// Widget stateAppWithProvider() {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (context) => ThemeLogic()),
//       ChangeNotifierProvider(create: (context) => LanguageLogic())
//     ],
//     child: StateApp(),
//   );
// }

// class StateApp extends StatelessWidget {
//   const StateApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int themeIndex = context.watch<ThemeLogic>().themeIndex;

//     return MaterialApp(
//       home: HomeScreen(),
//       themeMode: themeIndex == 0
//           ? ThemeMode.system
//           : themeIndex == 1
//               ? ThemeMode.dark
//               : ThemeMode.light,
//       theme: ThemeData(
//           brightness: Brightness.light,
//           appBarTheme: AppBarTheme(
//               backgroundColor: Colors.blue.shade200,
//               foregroundColor: Colors.white),
//           textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 18))),
//       darkTheme: ThemeData(
//           brightness: Brightness.dark,
//           appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade700),
//           textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 18))),
//     );
//   }
// }
