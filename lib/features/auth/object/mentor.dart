class Mentor {
  final String name;
  final String imageUrl;
  final String backgroundImageUrl;
  final String phoneNumber;
  final String companyName;

  Mentor({
    required this.name,
    required this.imageUrl,
    required this.backgroundImageUrl,
    required this.phoneNumber,
    required this.companyName,
  });

  Mentor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = json['imageUrl'],
        backgroundImageUrl = json['backgroundImageUrl'],
        phoneNumber = json['phoneNumber'],
        companyName = json['companyName'];
}
