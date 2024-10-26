import 'package:amiibo_api/splash_screen.dart';
import 'package:amiibo_api/state_module/language_constant.dart';
import 'package:amiibo_api/state_module/language_logic.dart';
import 'package:amiibo_api/state_module/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/about_screen.dart';
import 'screen/home_screen.dart';
import 'screen/search_screen.dart';

//main screen -> home screen || -> search screen || -> about us screen
//main screen is basically skeleton for the other screens
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //index to use in IndexedStack to navigate screen
  int _currentIndex = 0;
  int _themeIndex = 0;
  int _langIndex = 0;
  LanguageConstant _lang = Khmer();
  Color drawerColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    _lang = context.watch<LanguageLogic>().lang;
    drawerColor = _themeIndex == 0 ? Colors.black : Colors.white;

    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
      //theme for all screen
      // no system theme implementation (exclusion)
      themeMode: _themeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
          //bottomNavBar onclick color
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          //body background color
          scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent[700],
              unselectedItemColor: Colors.grey)),
      darkTheme: ThemeData(
          //bottomNavBar onclick color
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          //body background color
          scaffoldBackgroundColor: Color.fromARGB(244, 20, 20, 20),
          drawerTheme: DrawerThemeData(backgroundColor: Colors.black),
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

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        _themeIndex == 0 ? "images/light_logo.png" : "images/dark_logo.png",
        width: 50,
        height: 50,
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [HomeScreen(), SearchScreen()],
    );
  }

  Widget _buildDrawer() {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    return Drawer(
        width: 250,
        child: ListView(
          children: [
            DrawerHeader(
                child: Icon(Icons.tag_faces_sharp, color: drawerColor)),
            ListTile(
              leading: Icon(
                Icons.light_mode,
                color: drawerColor,
              ),
              title: Text(
                _lang.lightMode,
                style: TextStyle(color: drawerColor),
              ),
              onTap: () {
                context.read<ThemeLogic>().changeToLight();
              },
              trailing: themeIndex == 0
                  ? Icon(
                      Icons.check,
                      color: drawerColor,
                    )
                  : null,
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: drawerColor,
              ),
              title: Text(
                _lang.darkMode,
                style: TextStyle(color: drawerColor),
              ),
              onTap: () {
                context.read<ThemeLogic>().changeToDark();
              },
              trailing: themeIndex == 1
                  ? Icon(
                      Icons.check,
                      color: drawerColor,
                    )
                  : null,
            ),
            ExpansionTile(
              textColor: drawerColor,
              collapsedTextColor: drawerColor,
              iconColor: drawerColor,
              collapsedIconColor: drawerColor,
              // initiallyExpanded: true,
              title: Text(
                _lang.language,
              ),
              children: [
                ListTile(
                  title: Text(
                    _lang.toKhmer,
                    style: TextStyle(color: drawerColor),
                  ),
                  onTap: () {
                    context.read<LanguageLogic>().changeToKhmer();
                  },
                  trailing: Icon(
                    _langIndex == 0 ? Icons.check : null,
                    color: drawerColor,
                  ),
                ),
                ListTile(
                  title: Text(
                    _lang.toEnglish,
                    style: TextStyle(color: drawerColor),
                  ),
                  onTap: () {
                    context.read<LanguageLogic>().changeToEnglish();
                  },
                  trailing: Icon(
                    _langIndex == 1 ? Icons.check : null,
                    color: drawerColor,
                  ),
                ),
              ],
            ), ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen(text: _lang.aboutUs, themeIndex: _themeIndex))),
              leading: Icon(Icons.info, color: drawerColor,),
              title: Text(
                _lang.aboutUs,
                style: TextStyle(color: drawerColor),
              ),
            )
          ],
        ));
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, //could change to .shifting (preference)
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
              _currentIndex = index;
            }),
        items: [
          BottomNavigationBarItem(
              label: _lang.home, icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: _lang.search, icon: Icon(Icons.search_rounded))
        ]);
  }
}
