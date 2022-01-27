import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perseus/utils/CutFlower.dart';

class CutFlowersApi {
  static Future<List<CutFlower>> getCutFlowersLocally(
      BuildContext context) async {
    final assetbundle = DefaultAssetBundle.of(context);
    final data = await assetbundle.loadString('assets/cutFlowers.json');
    final body = json.decode(data);

    return body.map<CutFlower>(CutFlower.fromJSON).toList();
  }
}
