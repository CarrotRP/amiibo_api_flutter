import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../component/amiibo_model.dart';

class DetailScreen extends StatelessWidget {
  int themeIndex;
  Amiibo amiibo;

  DetailScreen(
      {required this.themeIndex,
      required this.amiibo});

  @override
  Widget build(BuildContext context) {
    Color setTextColor = themeIndex == 0 ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: setTextColor,
        backgroundColor: themeIndex == 0 ? Colors.white : Colors.black,
        title: Text(
          amiibo.character,
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
                child: CachedNetworkImage(
                  imageUrl: amiibo.image,
                  width: 300,
                  height: 300,
                  ),
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
                            "Amiibo Series:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: setTextColor,
                                fontSize: 18),
                          ),
                          Text(
                            amiibo.amiiboSeries,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: setTextColor, fontSize: 18),
                          ),
                        ],
                      ),
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
                            amiibo.gameSeries,
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
                            amiibo.type,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: setTextColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            amiibo.release.au != null ? 
                            "Release Date" : "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: setTextColor,
                                fontSize: 18),
                          ),
                          Text(
                            amiibo.release.au != null ? 
                            amiibo.release.au.toString().substring(0, 10) : "",
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
