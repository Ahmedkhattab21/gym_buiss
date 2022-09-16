
import 'dart:convert';

Person welcomeFromJson(String str) => Person.fromJson(json.decode(str));

String welcomeToJson(Person data) => json.encode(data.toJson());

class Person {
  int id;
  String name;
  String date;
  double height;
  double weight;
  double age;
  int payed;
  int days;
  int type;
  Person({
    required this.id,
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
