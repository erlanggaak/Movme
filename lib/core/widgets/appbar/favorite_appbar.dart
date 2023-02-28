import 'package:flutter/material.dart';
import 'package:movme/page/_page.dart';

class FavoriteAppBar extends StatefulWidget implements PreferredSizeWidget {
  FavoriteAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _FavoriteAppBarState createState() => _FavoriteAppBarState();
}

class _FavoriteAppBarState extends State<FavoriteAppBar>{

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
            "Favorite",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 55,
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