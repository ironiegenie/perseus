import 'package:meta/meta.dart';

class CutFlower {
  final String regularName;
  final String botanicName;
  final String family;
  final String season;
  //final AssetImage image;
  final String sign;

  //Constructor
  const CutFlower(
      {@required this.regularName,
      @required this.botanicName,
      @required this.family,
      @required this.season,
      @required this.sign});

  static CutFlower fromJSON(json) => CutFlower(
      regularName: json['TRADE_NAME'],
      botanicName: json['BOTANIC_NAME'],
      family: json['FAMILY'],
      season: json['SEASON'],
      sign: json['SIGN']);
}
