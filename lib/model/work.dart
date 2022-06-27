class Work {
  late String id;
  late String className;
  late String workName;
  late String university;
  late String department;
  late String date;
  late String time;
  late String place;
  late String description;
  late int v;
  Work({
    required this.id,
    required this.className,
    required this.workName,
    required this.university,
    required this.department,
    required this.date,
    required this.time,
    required this.place,
    required this.description,
    required this.v,
  });

  Work.fromJson(Map<String, dynamic> json) {
    id:
    json['_id'];
    className:
    json["className"];
    workName:
    json["workName"];
    university:
    json["university"];
    department:
    json["department"];
    date:
    json["date"];
    time:
    json["time"];
    place:
    json["place"];
    description:
    json["description"];
    v:
    json["__v"];
  }

  get count => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['className'] = this.className;
    data['workName'] = this.workName;
    data['university'] = this.university;
    data['department'] = this.department;
    data['date'] = this.date;
    data['time'] = this.time;
    data['place'] = this.place;
    data['description'] = this.description;
    data['__v'] = this.v;
    return data;
  }
  @override
  Work fromJson(Map<String, Object> json) =>
      Work.fromJson(json);

}
