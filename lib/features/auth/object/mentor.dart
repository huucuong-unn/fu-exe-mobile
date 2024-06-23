class Mentor {
  final String name;
  final String profilePicture;
  final String email;
  final String companyName;
  final String description;
  final String googleMeetUrl;

  Mentor({
    required this.name,
    required this.profilePicture,
    required this.companyName,
    required this.description,
    required this.email,
    required this.googleMeetUrl,
  });

  Mentor.fromJson(Map<String, dynamic> json)
      : name = json['mentorDTO']['fullName'],
        profilePicture = json['profilePicture'],
        companyName = json['mentorDTO']['company']['name'],
        description = json['description'],
        googleMeetUrl = json['googleMeetUrl'],
        email = json['mentorDTO']['account']['email'];
}
