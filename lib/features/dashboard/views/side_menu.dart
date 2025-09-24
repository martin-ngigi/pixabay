import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SideMenuView extends StatefulWidget {
  const SideMenuView({super.key});

  @override
  State<SideMenuView> createState() => _SideMenuViewState();
}

class _SideMenuViewState extends State<SideMenuView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Text(
                "Menu",
            )
        ),
        
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),

        ListTile(
          leading: Icon(Icons.photo),
          title: Text("Gallery"),
        ),

        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
        ),
      ],
    );
  }
}
