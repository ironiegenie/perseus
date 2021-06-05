import 'package:flutter/material.dart';

//Attributes
TextStyle myFontNormal = TextStyle(
    fontFamily: 'Nunito', fontSize: 19.0, fontWeight: FontWeight.normal);
TextStyle myFontButton = TextStyle(
    fontFamily: 'Nunito', fontSize: 14.0, fontWeight: FontWeight.normal);
TextStyle myFontTitle = TextStyle(
    fontFamily: 'Nunito', fontSize: 20.0, fontWeight: FontWeight.bold);

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perseus',
          style: myFontTitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        elevation: 0.0,
      ),
      body: Center(
        child: Material(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF193871),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.local_florist_sharp),
                    onPressed: clickFlowers,
                    color: Colors.white,
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF193871),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_tree_outlined),
                    onPressed: clickCode,
                    color: Colors.white,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

/*
 * Methods for what happens when certain buttons are pressed
*/
void clickFlowers() {
  print('you clicked on the flowers!'); //you will see that in the debug consol
}

void clickCode() {
  print('you clicked on the code!'); //you will see that in the debug consol
}
