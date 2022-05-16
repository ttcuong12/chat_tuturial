class MessageEntity {
  MessageEntity({
    this.text,
    this.time,
    this.userName,
  });

  MessageEntity.fromJson(dynamic json) {
    text = json['text'];
    time = json['time'];
    time = json['user_name'];
  }
  String? text;
  String? userName;
  int? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['time'] = time;
    map['user_name'] = userName;
    return map;
  }
}
