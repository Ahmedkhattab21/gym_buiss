
import 'dart:convert';

Person PersonFromJson(String str) => Person.fromJson(json.decode(str));

String PersonToJson(Person data) => json.encode(data.toJson());

class Person {
  int?id;
  String? name;
  String? date;
  double? height;
  double? weight;
  double? age;
  int? payed;
  int? days;
  int? type;
  List<String> atten_day=[];
  Person({
      this.id,
    required this.name,
    required this.date,
    required this.height,
    required this.weight,
    required this.age,
    required this.payed,
    required this.days,
    required this.type,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    height: json["height"].toDouble(),
    weight: json["weight"].toDouble(),
    age: json["age"].toDouble(),
    payed: json["payed"],
    days: json["days"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": date,
    "height": height,
    "weight": weight,
    "age": age,
    "payed":payed,
    "days": days,
    "type": type,
  };
}


attendance attendanceFromJson(String str) => attendance.fromJson(json.decode(str));

String attendanceToJson(attendance data) => json.encode(data.toJson());

class attendance{
  int person_id;
  String atten_days;

  attendance({
    required this.person_id,
    required this.atten_days,
});

  factory attendance.fromJson(Map<String, dynamic> json) => attendance(
    person_id: json["person_id"],
    atten_days: json["atten_days"],
  );

  Map<String, dynamic> toJson() => {
    "person_id": person_id,
    "atten_days": atten_days,
  };
}
