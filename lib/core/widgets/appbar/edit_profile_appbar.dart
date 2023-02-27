import 'package:flutter/material.dart';
import 'package:movme/page/_page.dart';

class EditProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  EditProfileAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _EditProfileAppBarState createState() => _EditProfileAppBarState();
}

class _EditProfileAppBarState extends State<EditProfileAppBar>{

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
            "Edit Profile",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 50,
          )
          // IconButton(
          //   onPressed: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => EditProfilePage()),
          //     // );
          //   },
          //   icon: const Icon(
          //     Icons.done,
          //     size: 25,
          //   ),
          // ),
        ],
      ),
    );
  }
}