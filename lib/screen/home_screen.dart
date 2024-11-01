import 'package:amiibo_api/logic/amiibo_logic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/amiibo_model.dart';
import '../logic/theme_logic.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _themeIndex = 0;

  @override
  Widget build(BuildContext context) {
    _themeIndex = context.watch<ThemeLogic>().themeIndex;

    return _buildBody();
  }

  Widget _buildBody() {
    bool loading = context.watch<AmiiboLogic>().loading;
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    String? error = context.watch<AmiiboLogic>().error;
    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Could not load\nCheck Your network and try again!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: _themeIndex == 0 ? Colors.black : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextButton(
                  onPressed: () {
                    context.read<AmiiboLogic>().read();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor:
                          _themeIndex == 0 ? Colors.white : Colors.black),
                  child: Text(
                    "Retry",
                    style: TextStyle(
                        color: _themeIndex == 0 ? Colors.black : Colors.white),
                  )),
            )
          ],
        ),
      );
    }

    AmiiboModel item = context.watch<AmiiboLogic>().item;

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
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(themeIndex: _themeIndex, amiibo: item))),
      child: Card(
        color: _themeIndex == 0 ? Colors.white : Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              width: 150,
              height: 150,
            ),
            Text(
              item.character,
              style: TextStyle(
                  color: _themeIndex == 0 ? Colors.black : Colors.white,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
