class User {
  final String imagePath;
  final String name;
  final String jurusan;
  final int angkatan;
  final String email;
  final String instagram;
  final String hobi;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.jurusan,
    required this.angkatan,
    required this.email,
    required this.instagram,
    required this.hobi,
    required this.about,
  });

  User copy({
    String? imagePath,
    String? name,
    String? jurusan,
    int? angkatan,
    String? email,
    String? instagram,
    String? hobi,
    String? about,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        jurusan: jurusan ?? this.jurusan,
        angkatan: angkatan ?? this.angkatan,
        email: email ?? this.email,
        instagram: instagram ?? this.instagram,
        hobi: hobi ?? this.hobi,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    jurusan: json['jurusan'],
    angkatan: json['angkatan'],
    email: json['email'],
    instagram: json['instagram'],
    hobi: json['hobi'],
    about: json['about'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'jurusan': jurusan,
    'angkatan': angkatan,
    'email': email,
    'instagram': instagram,
    'hobi': hobi,
    'about': about,
  };
}