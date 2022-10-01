import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imgUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReHLSKj3qzIZzrsWLMqFj5qi06SI4OENkpsl2RLjaTbg&s";
    return Drawer(
        child: Container(
      color: Colors.black,
      child: ListView(padding: EdgeInsets.zero, children: const [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Ankita Badhe"),
              accountEmail: Text("ankitabadhe340@gmail.com"),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
            )),
        ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text("HOME", style: TextStyle(color: Colors.white))),
        ListTile(
            leading: Icon(CupertinoIcons.person, color: Colors.white),
            title: Text("ABOUT", style: TextStyle(color: Colors.white))),
        ListTile(
            leading: Icon(CupertinoIcons.phone, color: Colors.white),
            title: Text("CONTACT", style: TextStyle(color: Colors.white)))
      ]),
    ));
  }
}
