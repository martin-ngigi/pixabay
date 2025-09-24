import 'package:flutter/material.dart';
import 'package:pixabay/core/routes/route_helper.dart';
import 'package:pixabay/core/utils/navigatorkey.dart';
import 'package:pixabay/features/dashboard/domain/entities/menu_item.dart';
import 'package:pixabay/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:pixabay/features/dashboard/presentation/views/side_menu.dart';
import 'package:pixabay/features/gallery/presentation/views/gallery_view.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:pixabay/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late DashboardController dashboardController;

  @override
  void initState() {
    super.initState();
    _initDashboard();
  }

  _initDashboard(){
    dashboardController = BlocProvider.of<DashboardController>(NavigationService.navigatorKey.currentContext!);
    dashboardController.updateCurrentMenuItem(
        MenuItem(
          title: "Home",
          icon: Icons.home,
          route: AppRoutes.HOME,
        )
    );
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
    return BlocBuilder<DashboardController, int>(builder: (dashboardContext, index){
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
                        currentRoute: dashboardController.currentMenuItem.route,
                        menuItems: menuItems,
                        onTap: (MenuItem item) {
                          dashboardController.updateCurrentMenuItem(item);
                        },
                      ),
                    ),

                    //const VerticalDivider(width: 1),

                    Expanded(
                      child: _getPage(dashboardController.currentMenuItem.route),
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
                      currentRoute: dashboardController.currentMenuItem.route,
                      menuItems: menuItems,
                      onTap: (MenuItem item) {
                        dashboardController.updateCurrentMenuItem(item);
                        Navigator.pop(context); // close drawer
                      },
                    ),
                  ),
                  body: _getPage(dashboardController.currentMenuItem.route)
              );
            }
          }
      );
    });
  }
}
