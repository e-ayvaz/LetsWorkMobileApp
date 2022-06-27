import 'package:flutter/material.dart';
import 'package:work/screens/login.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Profili Düzenle",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, "/profile"),
            },
          ),
          ProfileMenu(
            text: "Çıkış Yap",
            icon: "assets/icons/Log out.svg",
            press: () {
              
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
