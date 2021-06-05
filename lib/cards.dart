import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perseus/icard.dart';

void main() => runApp(MaterialApp(
      home: IndexCard(),
    ));

/*
 * Klasse zum Erstellen des Karteikarten Screens
 */

// Global Attributes
ICard card = ICard('NAME', 'Test latin', 'TestTestTest', 'Something Cool',
    AssetImage('images/flower_drawing.jpg'), 'draußen');
TextStyle myFontNormal = TextStyle(
    fontFamily: 'Nunito', fontSize: 19.0, fontWeight: FontWeight.normal);
TextStyle myFontButton = TextStyle(
    fontFamily: 'Nunito', fontSize: 14.0, fontWeight: FontWeight.normal);
TextStyle myFontTitle = TextStyle(
    fontFamily: 'Nunito', fontSize: 20.0, fontWeight: FontWeight.bold);
TextStyle myFontSubTitle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic);

class IndexCard extends StatefulWidget {
  @override
  _IndexCardState createState() => _IndexCardState();
}

class _IndexCardState extends State<IndexCard> {
  @override
  Widget build(BuildContext context) {
    //Class Attributes
    String regularName = card.getRegularName();
    String botanicName = 'Pflanzus Platzhalterus';
    String family = 'Coole Pflanzen';
    String season = 'März-März';
    // hier Bild Variable für Zeichen einfügen
    String location = 'sonnig-halbschattig';

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Karteikarte',
            style: myFontTitle,
          ),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          elevation: 0.0,
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: card.sign,
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                // deutscher Name Key
                alignment: Alignment.center,
                child: Text(
                  'Deutscher Name / Handelsname',
                  style: myFontSubTitle,
                )),
            SizedBox(
              height: 5.0,
            ),
            Container(
                // deutscher Name Wert
                alignment: Alignment.center,
                child: Text(
                  '$regularName',
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
              width: 25.0,
              height: 25.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: card.sign,
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle),
            ),
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
          ],
        )));
  }
}

//vielleicht mit Array durch die verschiedenen Karten durchloopen
//und durch Knopf druck die Anzahl im Array erhöhen?
