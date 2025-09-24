import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/core/routes/route_helper.dart';
import 'package:pixabay/features/dashboard/controllers/dashboard_controller.dart';
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
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          //home: HomeView(),
          initialRoute: AppRoutes.DASHBOARD,
          routes: AppRoutes().routes(),
        )
    );
  }
}

