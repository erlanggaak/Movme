part of '_page.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;
  final _formKey = GlobalKey<FormState>();
  final List<String> _availableJurusan = ["Computer Science", "Information System"];
  String? _name;
  String? _jurusan;
  int? _angkatan;
  String? _email;
  String? _instagram;
  String? _about;
  final _nameController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _angkatanController = TextEditingController();
  final _emailController = TextEditingController();
  final _instagramController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
    _name = user.name;
    _jurusan = user.jurusan;
    _angkatan = user.angkatan;
    _email = user.email;
    _instagram = user.instagram;
    _about = user.about;

    _nameController.text = _name!;
    _jurusanController.text = _jurusan!;
    _angkatanController.text = _angkatan!.toString();
    _emailController.text = _email!;
    _instagramController.text = _instagram!;
    _aboutController.text = _about!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EditProfileAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker().getImage(source: ImageSource.gallery);
                    // return if no image selected
                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage = await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(imagePath: newImage.path));
                  },
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "e.g James Crawl",
                            labelText: "Name",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                              //user = user.copy(name: value);
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon isi nama!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: DropdownButtonFormField<String>(
                          value: _jurusan,
                          elevation: 16,
                          hint: const Text("Pilih Jenis"),
                          items: _availableJurusan.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _jurusan = value!;
                              //user = user.copy(jurusan: value);
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _jurusan = value!;
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon isi jurusan!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        // Using padding of 8 pixels
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: _angkatanController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            hintText: "e.g 2021",
                            labelText: "Angkatan",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _angkatan = int.parse(value!);
                              //user = user.copy(angkatan: int.parse(value));
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _angkatan = int.parse(value!);
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty || int.parse(value) < 1993 || int.parse(value) > 2100) {
                              return 'Mohon isi angkatan valid!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "awesomeemail@mail.com",
                            labelText: "Email",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _email = value!;
                              //user = user.copy(email: value);
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _email = value!;
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon isi email!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: _instagramController,
                          decoration: InputDecoration(
                            hintText: "instagram",
                            labelText: "Instagram",
                            prefix: const Text("@"),
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _instagram = value!;
                              //user = user.copy(instagram: value);
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _instagram = value!;
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon isi instagram!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: _aboutController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "your awesome story",
                            labelText: "About Me",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Added behavior when name is typed
                          onChanged: (String? value) {
                            setState(() {
                              _about = value!;
                              //user = user.copy(about: value);
                            });
                          },
                          // Added behavior when data is saved
                          onSaved: (String? value) {
                            setState(() {
                              _about = value!;
                            });
                          },
                          // Validator as form validation
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon isi kisah anda!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              User updatedUser = await user.copy(
                                name: _name,
                                jurusan: _jurusan,
                                angkatan: _angkatan,
                                email: _email,
                                instagram: _instagram,
                                about: _about,
                              );
                              UserPreferences.setUser(updatedUser);
                              Navigator.pop(context,);
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // CustomTextField(
              //   label: "Name",
              //   text: "e.g James Carter",
              //   onChanged: (name) {
              //     user = user.copy(name: name);
              // }),
              // CustomTextField(
              //   label: "Name",
              //   text: "e.g James Carter",
              //   onChanged: (name) {
              //     user = user.copy(name: name);
              // }),
            ]
          ),
        ),
      ),
    );
  }

}