import 'package:flutter/material.dart';

//Attributes
TextStyle myFontNormal = TextStyle(
    fontFamily: 'Nunito', fontSize: 19.0, fontWeight: FontWeight.normal);
TextStyle myFontButton = TextStyle(
    fontFamily: 'Nunito', fontSize: 14.0, fontWeight: FontWeight.normal);
TextStyle myFontTitle = TextStyle(
    fontFamily: 'Nunito', fontSize: 20.0, fontWeight: FontWeight.bold);

final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: myFontNormal, primary: Color(0xFF193871));

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
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.pushNamed(context, '/botanic');
                  },
                  child: const Text("Freilandblumen"),
                ),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.pushNamed(context, '/cut');
                  },
                  child: const Text("Schnittblumen"),
                ),
              ]),
        ),
      ),
    );
  }
}

/*
 * Placeholder methods
*/

void clickCode() {
  print('you clicked on the code!'); //you will see that in the debug consol
}
