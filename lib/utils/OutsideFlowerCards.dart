import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OutsideFlower.dart';

class OutsideFlowerCards {
  TextStyle myFontNormal = TextStyle(
      fontFamily: 'Nunito', fontSize: 18.0, fontWeight: FontWeight.normal);
  TextStyle myFontButton = TextStyle(
      fontFamily: 'Nunito', fontSize: 14.0, fontWeight: FontWeight.normal);
  TextStyle myFontTitle = TextStyle(
      fontFamily: 'Nunito', fontSize: 20.0, fontWeight: FontWeight.bold);
  TextStyle myFontSubTitle = TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);

  String regularName;
  String botanicName;
  String family;
  String season;
  String botanicSign;
  String location;
  String jpegName;

  List<Widget> cards = [];

  List<Widget> getOutsideFlowerCards(List<OutsideFlower> flowers, int length) {
    for (var i = 0; i < length; i++) {
      this.regularName = flowers.elementAt(i).regularName;
      this.botanicName = flowers.elementAt(i).botanicName;
      this.family = flowers.elementAt(i).family;
      this.season = flowers.elementAt(i).season;
      this.botanicSign = flowers.elementAt(i).sign;
      this.location = flowers.elementAt(i).location;
      this.jpegName =
          "images/Freilandblumen/" + flowers.elementAt(i).jpegName + ".JPG";

      cards.add(Positioned(
        left: 0,
        top: 0,
        child: Draggable(
          child: FlowerCard(
              jpegName: jpegName,
              myFontSubTitle: myFontSubTitle,
              regularName: regularName,
              myFontNormal: myFontNormal,
              botanicName: botanicName,
              family: family,
              season: season,
              botanicSign: botanicSign,
              location: location),
          feedback: FlowerCard(
              jpegName: jpegName,
              myFontSubTitle: myFontSubTitle,
              regularName: regularName,
              myFontNormal: myFontNormal,
              botanicName: botanicName,
              family: family,
              season: season,
              botanicSign: botanicSign,
              location: location),
          childWhenDragging: Container(),
        ),
      ));
    }

    return cards;
  }
}

class FlowerCard extends StatelessWidget {
  const FlowerCard({
    Key key,
    @required this.jpegName,
    @required this.myFontSubTitle,
    @required this.regularName,
    @required this.myFontNormal,
    @required this.botanicName,
    @required this.family,
    @required this.season,
    @required this.botanicSign,
    @required this.location,
  }) : super(key: key);

  final String jpegName;
  final TextStyle myFontSubTitle;
  final String regularName;
  final TextStyle myFontNormal;
  final String botanicName;
  final String family;
  final String season;
  final String botanicSign;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          height: 550.0,
          width: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage(jpegName),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Visibility(
          child: Column(children: [
            Container(
                // deutscher Name Key
                alignment: Alignment.center,
                child: Text(
                  'Handelsname',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // deutscher Name Wert
                alignment: Alignment.center,
                child: Text(
                  regularName,
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // botanischer Name Key
                alignment: Alignment.center,
                child: Text(
                  'Botanischer Name',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // botanischer Name Wert
                alignment: Alignment.center,
                child: Text(
                  '$botanicName',
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // Familie Key
                alignment: Alignment.center,
                child: Text(
                  'Familie',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // Familie Wert
                alignment: Alignment.center,
                child: Text(
                  '$family',
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // Saison Key
                alignment: Alignment.center,
                child: Text(
                  'Saison',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // Saison Wert
                alignment: Alignment.center,
                child: Text(
                  '$season',
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // Zeichen Key
                alignment: Alignment.center,
                child: Text(
                  'Botanische Zeichen',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // Zeichen Wert
                alignment: Alignment.center,
                child: Text(
                  '$botanicSign',
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // Saison Key
                alignment: Alignment.center,
                child: Text(
                  'Standort',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // Saison Wert
                alignment: Alignment.center,
                child: Text(
                  '$location',
                  style: myFontNormal,
                )),
            SizedBox(
              height: 10.0,
            ),
          ]),
          visible: true,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
        ),
      ]),
    );
  }
}

AssetImage _getImage(String jpegName) {
  return AssetImage(jpegName);
}
