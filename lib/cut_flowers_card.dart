import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perseus/api/CutFlowersApi.dart';
import 'package:perseus/icard.dart';
import 'package:perseus/utils/CutFlower.dart';

/*
 * Klasse zum Erstellen des Karteikarten Screens für Freiland Blumen
 */

// Global Attributes
ICard card = ICard('NAME', 'Test latin', 'TestTestTest', 'Something Cool',
    'Giftpflanze, Staude, einjährig', 'draußen');

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

class CutFlowersCard extends StatefulWidget {
  @override
  _CutFlowersCardState createState() => _CutFlowersCardState();
}

class _CutFlowersCardState extends State<CutFlowersCard> {
  bool isVisible = false;

  int i = 0;
  Future<List<CutFlower>> flowerList;

  @override
  void initState() {
    super.initState();
    flowerList = CutFlowersApi.getCutFlowersLocally(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Schnittblumen',
            style: myFontTitle,
          ),
          centerTitle: true,
          backgroundColor: Colors.green[800],
          elevation: 0.0,
        ),
        body: FutureBuilder<List<CutFlower>>(
          future: flowerList,
          builder: (context, snapshot) {
            final cutFlowers = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return buildCutFlower(cutFlowers);
                }
            }
          },
        ));
  }

  Widget buildCutFlower(List<CutFlower> flowers) {
    //Class Attributes
    String regularName = flowers.elementAt(i).regularName;
    String botanicName = flowers.elementAt(i).botanicName;
    String family = flowers.elementAt(i).family;
    String season = flowers.elementAt(i).season;
    String botanicSign = flowers.elementAt(i).sign;

    return ListView(
      children: [
        Container(
          height: 190.0,
          width: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: card.getImage('images/flower_drawing.jpg'),
              fit: BoxFit.fill,
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
                  botanicName,
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
          ]),
          visible: isVisible,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFF24b576),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    isVisible = false;
                    if (i > 0) {
                      i = i - 1;
                    } else {
                      i = 0;
                    }
                  });
                },
                color: Colors.white,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Text("show / hide")),
            Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFF24b576),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    isVisible = false;
                    if (i < (flowers.length - 1)) {
                      i = i + 1;
                    } else {
                      i = i; //es soll nichts passieren, wenn wir über die Länge hinaus gehen
                    }
                  });
                },
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
      scrollDirection: Axis.vertical,
    );
  }
}
