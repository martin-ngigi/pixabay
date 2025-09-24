import 'package:flutter/material.dart';
import 'package:pixabay/core/components/error_view.dart';
import 'package:pixabay/core/components/loading_view.dart';
import 'package:pixabay/core/utils/navigatorkey.dart';
import 'package:pixabay/features/home/presentation/controllers/home_controller.dart';
import 'package:pixabay/features/home/presentation/views/image_row.dart';
import 'package:pixabay/features/home/presentation/views/loading_row_skeletonizer.dart';
import 'package:pixabay/features/home/presentation/views/responsive_list_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Photo {
  final String title;
  final String imageUrl;
  Photo(this.title, this.imageUrl);
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late HomeController homeController;

  final List<Photo> photos = List.generate(
    20,
        (i) => Photo('Photo $i', 'https://picsum.photos/seed/$i/400/400'),
  );

  @override
  void initState() {
    super.initState();
    _initDashboard();
  }

  _initDashboard(){
    homeController = BlocProvider.of<HomeController>(NavigationService.navigatorKey.currentContext!);
    homeController.fetchHomeData("cars");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, int>(builder: (homeContext, index){
      if (homeController.isLoading){
        //return LoadingView(message: "Fetching your data...");
        return ResponsiveListGrid(
          items: photos,
          itemBuilder: (context, photo, index) {
            return LoadingRowSkeletonizer();
          },
        );
      }

      if (!homeController.isLoading && homeController.errorMessage.isNotEmpty){
        return ErrorView(
          title: "Error occurred.",
          message: homeController.errorMessage,
          onRetry: () {
            homeController.fetchHomeData("cars");
          },
        );
      }

      return Scaffold(
        body: Center(
          child: ResponsiveListGrid(
            items: homeController.hits,
            itemBuilder: (context, photo, index) {
              return ImageRow(
                photo: photo,
              );
            },
          ),
        ),
      );
    });
  }
}
