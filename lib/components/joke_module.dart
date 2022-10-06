// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

Empty emptyFromJson(String str) => Empty.fromJson(json.decode(str));

String emptyToJson(Empty data) => json.encode(data.toJson());

class Empty {
  Empty({
    required this.greeting,
    required this.instructions,
  });

  String greeting;
  List<Instruction> instructions;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    greeting: json["greeting"],
    instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(instructions.map((x) => x.toJson())),
  };
}

class Instruction {
  Instruction({
    this.iconUrl,
    this.id,
    this.url,
    required this.value,
  });

  String? iconUrl;
  String? id;
  String? url;
  String value;

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    iconUrl: json["icon_url"],
    id: json["id"],
    url: json["url"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "icon_url": iconUrl,
    "id": id,
    "url": url,
    "value": value,
  };
}
