import 'package:flutter/material.dart';
import 'package:movme/page/_page.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  ProfileAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar>{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context,);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
              ),
            ],
          ),
          const Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.edit,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}