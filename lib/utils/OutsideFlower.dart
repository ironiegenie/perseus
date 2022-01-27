import 'package:meta/meta.dart';

class OutsideFlower {
  final String regularName;
  final String botanicName;
  final String family;
  final String season;
  //final AssetImage image;
  final String sign;
  final String location;
  final String jpegName;

  //Constructor
  const OutsideFlower(
      {@required this.regularName,
      @required this.botanicName,
      @required this.family,
      @required this.season,
      @required this.sign,
      @required this.location,
      @required this.jpegName});

  static OutsideFlower fromJSON(json) => OutsideFlower(
      regularName: json['TRADE_NAME'],
      botanicName: json['BOTANIC_NAME'],
      family: json['FAMILY'],
      season: json['SEASON'],
      sign: json['BOTANIC_SIGN'],
      location: json['LOCATION'],
      jpegName: json['JPG_NAME']);
}
