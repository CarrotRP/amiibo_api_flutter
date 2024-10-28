import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/amiibo_model.dart';
import '../logic/amiibo_logic.dart';
import '../logic/theme_logic.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _themeIndex = 0;
  AmiiboModel item = AmiiboModel(amiibo: []); //non filter
  AmiiboModel searchResults = AmiiboModel(amiibo: []); //filter one

  @override
  Widget build(BuildContext context) {
    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    item = context.watch<AmiiboLogic>().item; //instantiate so that it can be use, if not its empty and cant search

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20
            ),
            child: TextField(
              onChanged: (value) => _search(value),
              decoration: InputDecoration(
                hintText: "Enter Character name, Ex:Mario"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              style: TextStyle(
                color: _themeIndex == 0 ? Colors.black : Colors.white
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }
  void _search(String name){
     AmiiboModel results = AmiiboModel(amiibo: []);
     if(!name.isEmpty){
      results = AmiiboModel(
      amiibo: item.amiibo
        .where((amiibo) => amiibo.character.toLowerCase().contains(name.toLowerCase()))
        .toList(),
    );
     }
     setState(() {
       searchResults  = results;
     });
  }
  Widget _buildBody() {

    return _buildGridView(searchResults.amiibo.isEmpty ? context.watch<AmiiboLogic>().item : searchResults);
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
                fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}