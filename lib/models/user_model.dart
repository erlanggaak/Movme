class User {
  final String imagePath;
  final String name;
  final String jurusan;
  final int angkatan;
  final String email;
  final String instagram;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.jurusan,
    required this.angkatan,
    required this.email,
    required this.instagram,
    required this.about,
  });

  User copy({
    String? imagePath,
    String? name,
    String? jurusan,
    int? angkatan,
    String? email,
    String? about,
    String? instagram,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        jurusan: jurusan ?? this.jurusan,
        angkatan: angkatan ?? this.angkatan,
        email: email ?? this.email,
        about: about ?? this.about,
        instagram: instagram ?? this.instagram,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    jurusan: json['jurusan'],
    angkatan: json['angkatan'],
    email: json['email'],
    about: json['about'],
    instagram: json['instagram'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'jurusan': jurusan,
    'angkatan': angkatan,
    'email': email,
    'about': about,
    'instagram': instagram,
  };
}