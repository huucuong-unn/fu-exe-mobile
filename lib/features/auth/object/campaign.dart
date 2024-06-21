class Campaign {
  final String name;
  final String image;

  Campaign({
    required this.name,
    required this.image,
  });

  Campaign.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];
}
