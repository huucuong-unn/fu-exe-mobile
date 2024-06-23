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
      : id = json['account']['id'],
        name = json['name'],
        email = json['account']['email'],
        imageUrl = json['account']['avatarUrl'],
        studentCode = json['studentCode'],
        university = json['university']['name'],
        point = json['account']['point'];
}
