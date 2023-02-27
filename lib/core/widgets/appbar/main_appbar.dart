import 'package:flutter/material.dart';
import 'package:movme/core/widgets/profile_icon.dart';
import 'package:movme/page/_page.dart';
import 'package:movme/core/utils/user_preference.dart';

import 'dart:io';

class MainPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainPageAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainPageAppBarState createState() => _MainPageAppBarState();
}

class _MainPageAppBarState extends State<MainPageAppBar>{

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: user.imagePath == '' ? Image.asset(
                          'lib/assets/static/images/profile_placeholder.png',
                          fit: BoxFit.cover,).image
                            : Image.file(File(user.imagePath)).image,)
                    )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user.jurusan} ',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              user.angkatan.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const CartPage()),
              // );
            },
            icon: const Icon(
              Icons.favorite,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}