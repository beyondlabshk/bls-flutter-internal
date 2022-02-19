import 'dart:collection';
import 'package:dartx/dartx.dart';

class Jsonb {
  const Jsonb({this.map, this.stringList, this.listOfMap});

  factory Jsonb.fromDynamic(dynamic data) {
    if (data is Map || data is LinkedHashMap) {
      return Jsonb(
        map: Map<String, dynamic>.from(data),
      );
    } else if (data is List) {
      if (data.firstOrNull is Map) {
        return Jsonb(
          listOfMap: data.map((e) => Map<String, dynamic>.from(e)).toList(),
        );
      }
      return Jsonb(
        stringList: List<String>.from(data),
      );
    }
    return const Jsonb();
  }

  final List<String>? stringList;
  final Map<String, dynamic>? map;
  final List<Map<String, dynamic>>? listOfMap;

  String? get firstOrNull => stringList?.firstOrNull;
}
