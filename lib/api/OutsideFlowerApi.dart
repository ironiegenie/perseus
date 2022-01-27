import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perseus/utils/OutsideFlower.dart';

class OutsideFlowersApi {
  static Future<List<OutsideFlower>> getOutsideFlowersLocally(
      BuildContext context) async {
    final assetbundle = DefaultAssetBundle.of(context);
    final data = await assetbundle.loadString('assets/outsideFlowers.json');
    final body = json.decode(data);

    return body.map<OutsideFlower>(OutsideFlower.fromJSON).toList();
  }
}
