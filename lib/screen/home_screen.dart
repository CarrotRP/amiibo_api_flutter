import 'package:amiibo_api/component/amiibo_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/amiibo_model.dart';
import '../state_module/language_constant.dart';
import '../state_module/language_logic.dart';
import '../state_module/theme_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LanguageConstant _lang = Khmer();
  int _themeIndex = 0;
  Color drawerColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    _lang = context.watch<LanguageLogic>().lang;
    drawerColor = _themeIndex == 0 ? Colors.black : Colors.white;

    return _buildBody();
  }

  Widget _buildBody() {
    bool loading = context.watch<AmiiboLogic>().loading;
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    AmiiboModel item = context.watch<AmiiboLogic>().item;

    return _buildListView(item);
  }

  Widget _buildListView(AmiiboModel item) {
    return RefreshIndicator(
        onRefresh: () async {
          context.read<AmiiboLogic>().read();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            physics: BouncingScrollPhysics(),
            // scrollDirection: Axis.vertical,
            itemCount: item.amiibo.length,
            itemBuilder: (context, index) {
              return _buildItem(item.amiibo[index]);
            },
          ),
        ));
  }

  Widget _buildItem(Amiibo item) {
    return Card(
      color: _themeIndex == 0 ? Colors.white : Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            item.image,
            width: 150,
            height: 150,
          ),
          Text(
            item.character,
            style: TextStyle(
              color: drawerColor,
              fontSize: 18),
          ),
        ],
      ),
    );
  }

  
}
