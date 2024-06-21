class AccountMentee {
  String id;
  String name;
  String email;
  String imageUrl;
  String studentCode;
  String university;
  int point;

  AccountMentee({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.studentCode,
    required this.university,
    required this.point,
  });

  AccountMentee.fromJson(Map<String, dynamic> json)
      : id = json['student']['account']['id'],
        name = json['student']['name'],
        email = json['student']['account']['email'],
        imageUrl = json['student']['account']['avatarUrl'],
        studentCode = json['student']['studentCode'],
        university = json['student']['university']['name'],
        point = json['student']['account']['point'];
}
