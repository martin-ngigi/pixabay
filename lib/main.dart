import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/core/routes/route_helper.dart';
import 'package:pixabay/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:pixabay/features/gallery/presentation/controllers/gallery_controller.dart';
import 'package:pixabay/features/home/presentation/controllers/home_controller.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:pixabay/features/profile/presentation/controllers/profile_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DashboardController>(
              create: (context) => DashboardController(0)
          ),
          BlocProvider<HomeController>(
              create: (context) => HomeController(0)
          ),
          BlocProvider<GalleryController>(
              create: (context) => GalleryController(0)
          ),
          BlocProvider<ProfileController>(
              create: (context) => ProfileController(0)
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pixabay web',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                primary: Colors.blue,
                secondary: Colors.blue.withAlpha(100)
            ),
          ),
          //home: HomeView(),
          initialRoute: AppRoutes.DASHBOARD,
          routes: AppRoutes().routes(),
        )
    );
  }
}

