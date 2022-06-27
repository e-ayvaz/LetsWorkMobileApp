import 'package:work/components/coustom_bottom_nav_bar.dart';
import 'package:work/enums.dart';
import 'package:flutter/material.dart';
import 'package:work/screens/messages.dart';

class viewMessageIcon extends StatelessWidget {
  const viewMessageIcon({Key? key}) : super(key: key);
  static String routeName = "/Messages";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
      ),
       // ignore: prefer_const_constructors
       body:ChatScreen(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
