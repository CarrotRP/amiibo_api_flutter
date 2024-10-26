import 'package:amiibo_api/logic/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  String text;
  int themeIndex;

  AboutScreen({required this.text, required this.themeIndex});

  @override
  Widget build(BuildContext context) {
    Color setTextColor = themeIndex == 0 ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: themeIndex == 0 ? Colors.white : Colors.black,
      appBar: AppBar(
        foregroundColor: setTextColor,
        backgroundColor: themeIndex == 0 ? Colors.white : Colors.black,
        title: Text(text, style: TextStyle(
          color: setTextColor,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(themeIndex == 0 ? "images/light_logo.png" : "images/dark_logo.png", width: 200,height: 200,),
          Text(
            "What are amiibo?",
            style: TextStyle(
              fontFamily: "Oswald",
              fontSize: 20,
              color: setTextColor),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              textAlign: TextAlign.center,
                "amiibo are interactive figures and cards that work with your games.Tap an amiibo while playing compatible Nintendo Switch, Nintendo 3DS or Wii U software and you’ll uncover surprising new features! amiibo have different effects depending on the game: you might unlock new modes, weapons or character customisations, or even boost your amiibo’s abilities to turn it into your perfect partner – or a formidable foe!",
                style: TextStyle(
                  color: setTextColor
                ),),),
            Text("Group Member", 
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: setTextColor,
            )),
            Text(
              textAlign: TextAlign.center,
              "Tae Sivlong\nSok Chandarath\nLim Panharoth", style: TextStyle(
                fontSize: 16,
                color: setTextColor
              ),)
        ],
      ),
    );
  }
}
