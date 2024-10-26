import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  int themeIndex;
  String itemName;
  String itemImg;
  String itemGseries;
  String itemType;

  DetailScreen(
      {required this.themeIndex,
      required this.itemName,
      required this.itemImg,
      required this.itemGseries,
      required this.itemType});

  @override
  Widget build(BuildContext context) {
    Color setTextColor = themeIndex == 0 ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: setTextColor,
        backgroundColor: themeIndex == 0 ? Colors.white : Colors.black,
        title: Text(
          itemName,
          style: TextStyle(
            color: setTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              child: Image.network(itemImg),
              alignment: Alignment.center,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Game Series:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: setTextColor,
                              fontSize: 18),
                        ),
                        Text(
                          itemGseries,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: setTextColor, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Type:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: setTextColor,
                              fontSize: 18),
                        ),
                        Text(
                          itemType,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: setTextColor, fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
