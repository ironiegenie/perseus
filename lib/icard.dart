import 'package:flutter/cupertino.dart';

class ICard {
  String regularName = 'Pflanze XY';
  String botanicName = 'Pflanzus Platzhalterus';
  String family = 'Coole Pflanzen';
  String season = 'März-März';
  AssetImage sign = AssetImage('images/code.png');
  String location = 'sonnig-halbschattig';

  //Constructor
  ICard(String regularName, String botanicName, String family, String season,
      AssetImage sign, String loaction) {
    this.regularName = regularName;
    this.botanicName = botanicName;
    this.family = family;
    this.season = season;
    this.sign = sign;
    this.location = loaction;
  }

  //getter und setter
  String getRegularName() {
    return this.regularName;
  }

  String getBotanicName() {
    return this.botanicName;
  }

  String getFamily() {
    return this.family;
  }

  String getSeason() {
    return this.season;
  }

  AssetImage getSign() {
    return this.sign;
  }

  String getLocation() {
    return this.location;
  }
}
