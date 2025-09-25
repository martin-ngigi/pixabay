import 'package:flutter/cupertino.dart';
import 'package:pixabay/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:pixabay/features/gallery/presentation/views/gallery_view.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:pixabay/features/profile/presentation/views/profile_view.dart';

class AppRoutes{
  static const SPLASH = "/";
  static const DASHBOARD = "/dashboard";
  static const HOME = "/home";
  static const GALLERY = "/gallery";
  static const PROFILE = "/profile";

  Map<String, WidgetBuilder> routes(){
    return {
      SPLASH: (context) => DashboardView(),
      DASHBOARD: (context) => DashboardView(),
      HOME: (context) => HomeView(),
      GALLERY: (context) => GalleryView(),
      PROFILE: (context) => ProfileView()
    };
  }
}