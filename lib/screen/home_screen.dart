import 'package:amiibo_api/logic/amiibo_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/amiibo_model.dart';
import '../component/language_constant.dart';
import '../logic/language_logic.dart';
import '../logic/theme_logic.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LanguageConstant _lang = Khmer();
  int _themeIndex = 0;

  @override
  Widget build(BuildContext context) {
    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    _lang = context.watch<LanguageLogic>().lang;

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
    print(item.amiibo);

    return _buildGridView(item);
  }

  Widget _buildGridView(AmiiboModel item) {
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
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => 
      DetailScreen(themeIndex: _themeIndex, itemName: item.name, itemImg: item.image, itemGseries: item.gameSeries, itemType: item.type,))),
      child: Card(
        color: _themeIndex == 0 ? Colors.white : Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(item.image, 
            width: 150,
            height: 150,),
            Text(
              item.character,
              style: TextStyle(
                color: _themeIndex == 0 ? Colors.black : Colors.white,
                fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  
}
