class Member {
  String? key;
  MemberData? memberData;

  Member({this.key, this.memberData});
}

class MemberData {
  String? name;
  String? age;
  String? dial;

  MemberData({this.name, this.age, this.dial});

  MemberData.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    age = json["age"];
    dial = json["dial"];
  }
}
