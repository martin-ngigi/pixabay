import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pixabay/core/routes/route_helper.dart';
import 'package:pixabay/features/dashboard/domain/entities/menu_item.dart';

class SideMenuView extends StatelessWidget {
  final String currentRoute;
  final List<MenuItem> menuItems;
  final ValueChanged<MenuItem> onTap;

  SideMenuView({super.key, required this.currentRoute, required this.menuItems, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          child: Text("Menu", style: TextStyle(fontSize: 24)),
        ),
        ...menuItems.map((item) {
          return ListTile(
            leading: Icon(item.icon),
            title: Text(item.title),
            selected: currentRoute == item.route,
            selectedTileColor: Colors.blue.shade100,
            onTap: () {
              onTap(item);
            },
          );
        }),
      ],
    );
  }
}
