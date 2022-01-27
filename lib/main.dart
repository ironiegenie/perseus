import 'package:flutter/material.dart';
import 'package:perseus/cut_flowers_card.dart';
import 'package:perseus/home.dart';
import 'package:perseus/cards.dart';

void main() => runApp(MaterialApp(initialRoute: '/home', routes: {
      '/home': (context) => Home(),
      '/botanic': (context) => IndexCard(),
      '/cut': (context) => CutFlowersCard(),
    }));
