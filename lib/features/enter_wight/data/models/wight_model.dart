import 'dart:convert';

class Wight {
  final String wight;
  final DateTime date;
  Wight({
    required this.wight,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'wight': wight,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Wight.fromMap(Map<String, dynamic> map) {
    return Wight(
      wight: map['wight'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wight.fromJson(String source) => Wight.fromMap(json.decode(source));
}
