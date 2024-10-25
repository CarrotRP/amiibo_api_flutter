import 'package:amiibo_api/component/amiibo_logic.dart';
import 'package:amiibo_api/state_module/language_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/amiibo_model.dart';
import '../state_module/language_constant.dart';
import '../state_module/theme_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LanguageConstant _lang = Khmer();
  int _langIndex = 0;
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: Image.asset(
        //   "images/logo.png",
        //   scale: 25,
        // ),
        title: Image.asset("images/light_logo.png", scale: 25,),
      ),
      body: _buildBody(),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBody(){
    bool loading = context.watch<AmiiboLogic>().loading;
    if(loading){
      return Center(child: CircularProgressIndicator(),);
    }

    AmiiboModel productList = context.watch<AmiiboLogic>().productList;
    return _buildListView(productList);

  }

  Widget _buildListView(AmiiboModel items) {
    return RefreshIndicator(
        onRefresh: () async {
          context.read<AmiiboLogic>().read();
        },
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            ),
          physics: BouncingScrollPhysics(),
          // scrollDirection: Axis.vertical,
          itemCount: items.amiibo.length,
          itemBuilder: (context, index) {
            return _buildItem(items.amiibo[index]);
          }, 
        ));
  }

  Widget _buildItem(Amiibo item) {
    // return Card(
    //   color: Colors.white,
    //   child: Container(
    //     child: Text(item.character),
    //     subtitle: Image.network(item.image, scale: 3,),
    //   ),
    // );
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(item.character, style: TextStyle(
            color: Colors.white
          ),),
          Image.network(item.image, scale: 5,),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_filled)),
      BottomNavigationBarItem(
          label: "Search", icon: Icon(Icons.search_rounded)),
      BottomNavigationBarItem(label: "About us", icon: Icon(Icons.info))
    ]);
  }

  Widget _buildDrawer() {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    return Drawer(
        // backgroundColor: _dark ? Colors.blueGrey : Colors.white,

        child: ListView(
      children: [
        DrawerHeader(child: Icon(Icons.face)),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(_lang.home),
        ),
        ExpansionTile(
          initiallyExpanded: true,
          title: Text(_lang.theme),
          children: [
            ListTile(
              leading: Icon(Icons.light_mode),
              title: Text(_lang.lightMode),
              onTap: () {
                context.read<ThemeLogic>().changeToLight();
              },
              trailing: themeIndex == 2 ? Icon(Icons.check) : null,
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text(_lang.darkMode),
              onTap: () {
                context.read<ThemeLogic>().changeToDark();
              },
              trailing: themeIndex == 1 ? Icon(Icons.check) : null,
            ),
            ListTile(
              leading: Icon(Icons.phone_iphone),
              title: Text(_lang.systemMode),
              onTap: () {
                context.read<ThemeLogic>().changeToSystem();
              },
              trailing: themeIndex == 0 ? Icon(Icons.check) : null,
            ),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          title: Text(_lang.language),
          children: [
            ListTile(
              title: Text(_lang.toKhmer),
              onTap: () {
                context.read<LanguageLogic>().changeToKhmer();
              },
            ),
            ListTile(
              title: Text(_lang.toEnglish),
              onTap: () {
                context.read<LanguageLogic>().changeToEnglish();
              },
            ),
          ],
        ),
      ],
    ));
  }
}
