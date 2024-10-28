import 'package:amiibo_api/component/language_constant.dart';
import 'package:amiibo_api/logic/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  LanguageConstant text;
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
        title: Text(text.aboutUs, style: TextStyle(
          color: setTextColor,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(themeIndex == 0 ? "images/light_logo.png" : "images/dark_logo.png", width: 200,height: 200,),
          Text(
            text.whatAboutUs,
            style: TextStyle(
              fontFamily: "Oswald",
              fontSize: 20,
              color: setTextColor),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              textAlign: TextAlign.center,
                text.aboutUsDes
                ,style: TextStyle(
                  color: setTextColor
                ),),),
            Text(text.groupMember, 
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: setTextColor,
            )),
            Text(
              textAlign: TextAlign.center,
              text.memberName, style: TextStyle(
                fontSize: 16,
                color: setTextColor
              ),)
        ],
      ),
    );
  }
}
