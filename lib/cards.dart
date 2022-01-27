import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perseus/api/OutsideFlowerApi.dart';
import 'package:perseus/icard.dart';
import 'package:perseus/utils/OutsideFlower.dart';

import 'utils/OutsideFlowerCards.dart';

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

class IndexCard extends StatefulWidget {
  @override
  _IndexCardState createState() => _IndexCardState();
}

class _IndexCardState extends State<IndexCard> {
  bool isVisible = false;

  int i = 0;
  Future<List<OutsideFlower>> flowerList;

  @override
  void initState() {
    super.initState();
    flowerList = OutsideFlowersApi.getOutsideFlowersLocally(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Freilandblumen',
            style: myFontTitle,
          ),
          centerTitle: true,
          backgroundColor: Colors.green[800],
          elevation: 0.0,
        ),
        body: FutureBuilder<List<OutsideFlower>>(
          future: flowerList,
          builder: (context, snapshot) {
            final outsideFlowers = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return buildOutsideFlower(outsideFlowers);
                }
            }
          },
        ));
  }

  Widget buildOutsideFlower(List<OutsideFlower> flowers) {
    //Class Attributes

    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        // Important to keep as a stack to have overlay of cards.
        child: Stack(
          children: new OutsideFlowerCards().getOutsideFlowerCards(flowers, 3),
        ));
  }
/*
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
                if (i > 0 && i <= flowers.length) {
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
    );
  }
  */
}
