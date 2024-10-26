import 'package:amiibo_api/logic/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    int _themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20
            ),
            child: TextField(
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
          // ListView.builder(
          //   itemBuilder: (context, index){

          //   }),
        ],
      ),
    );
  }
}