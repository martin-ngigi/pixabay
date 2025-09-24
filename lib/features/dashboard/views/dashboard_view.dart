import 'package:flutter/material.dart';
import 'package:pixabay/features/dashboard/views/side_menu.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          bool isLargeScreen = constraints.maxWidth >= 800;

          // Show permanent side menu for large screens
          if (isLargeScreen) {
            return Scaffold(
              body: Row(
                children: [

                  const SizedBox(
                    width: 250,
                    child: SideMenuView(),
                  ),

                  const VerticalDivider(width: 1),

                  Expanded(
                      child: Center(
                        child: Text(
                            "Main content",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),


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
              drawer: const Drawer(
                child: SideMenuView(),
              ),
              body: Center(
                child: Text(
                  "Main Content",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            );
          }

        }
    );
  }
}
