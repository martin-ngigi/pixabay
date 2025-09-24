import 'package:flutter/material.dart';
import 'package:pixabay/core/routes/route_helper.dart';
import 'package:pixabay/features/dashboard/domain/entities/menu_item.dart';
import 'package:pixabay/features/dashboard/presentation/views/side_menu.dart';
import 'package:pixabay/features/gallery/presentation/views/gallery_view.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:pixabay/features/profile/presentation/views/profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late MenuItem currentMenuItem;

  @override
  void initState() {
    super.initState();
    currentMenuItem = MenuItem(
      title: "Home",
      icon: Icons.home,
      route: AppRoutes.HOME,
    ); // default selection
  }

  Widget _getPage(String route) {
    switch (route) {
      case AppRoutes.HOME:
        return HomeView();
      case AppRoutes.GALLERY:
        return GalleryView();
      case AppRoutes.PROFILE:
        return ProfileView();
      default:
        return const Center(child: Text("Page not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){

          bool isLargeScreen = constraints.maxWidth >= 800;

          final List<MenuItem> menuItems = [
            MenuItem(title: "Home", icon: Icons.home, route: AppRoutes.HOME),
            MenuItem(title: "Gallery", icon: Icons.photo, route: AppRoutes.GALLERY),
            MenuItem(title: "Profile", icon: Icons.person, route: AppRoutes.PROFILE),
          ];

          // Show permanent side menu for large screens
          if (isLargeScreen) {
            return Scaffold(
              body: Row(
                children: [
                  SizedBox(
                    width: 250,
                      child: SideMenuView(
                        currentRoute: currentMenuItem.route,
                        menuItems: menuItems,
                        onTap: (MenuItem item) {
                          setState(() {
                            currentMenuItem = item;
                          });
                        },
                      ),
                  ),

                  //const VerticalDivider(width: 1),

                  Expanded(
                    child: _getPage(currentMenuItem.route),
                  )
                ],
              ),
            );
          }
          else { // Show Drawer (hamburger menu)
            return Scaffold(
              appBar: AppBar(
                title: const Text("Main content"),
              ),
              drawer: Drawer(
                child: SideMenuView(
                  currentRoute: currentMenuItem.route,
                  menuItems: menuItems,
                  onTap: (MenuItem item) {
                    setState(() {
                      currentMenuItem = item;
                    });
                    Navigator.pop(context); // close drawer
                  },
                ),
              ),
              body: _getPage(currentMenuItem.route)
            );
          }
        }
    );
  }
}
