import 'package:flutter/material.dart';
import 'package:pixabay/core/components/app_search_bar.dart';
import 'package:pixabay/core/components/error_view.dart';
import 'package:pixabay/core/utils/navigatorkey.dart';
import 'package:pixabay/features/home/presentation/controllers/home_controller.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/home/presentation/views/image_row.dart';
import 'package:pixabay/features/home/presentation/views/loading_row_skeletonizer.dart';
import 'package:pixabay/features/home/presentation/views/responsive_list_grid.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {

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
    homeController.fetchHomeData("cats");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, int>(
      builder: (homeContext, index) {
        if (homeController.isLoading) {
          return Column(
            children: [

              const SizedBox(height: 16),

              AppSearchBar(
                hintText: "Search images...",
                onSearch: (query) {
                  homeController.fetchHomeData(query);
                },
              ),

              const SizedBox(height: 16),

              Expanded(
                child: ResponsiveListGrid(
                  items: photos,
                  itemBuilder: (context, photo, index) {
                    return LoadingRowSkeletonizer();
                  },
                ),
              ),

            ],
          );
        }

        if (!homeController.isLoading && homeController.errorMessage.isNotEmpty) {
          return Column(
            children: [

              const SizedBox(height: 16),

              AppSearchBar(
                hintText: "Search cars...",
                onSearch: (query) {
                  homeController.fetchHomeData(query);
                },
                onTextChange: (text) {
                  print("User typing: $text"); // live search suggestions
                },
                onClear: () {
                  print("Cleared search");
                },
              ),


              const SizedBox(height: 16),

              Expanded(
                child: ErrorView(
                  title: "Error occurred.",
                  message: homeController.errorMessage,
                  onRetry: () {
                    homeController.fetchHomeData("cars");
                  },
                ),
              ),

            ],
          );
        }

        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 16),
              AppSearchBar(
                hintText: "Search images...",
                onSearch: (query) {
                  homeController.fetchHomeData(query);
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ResponsiveListGrid(
                  items: homeController.hits,
                  itemBuilder: (context, photo, index) {
                    return ImageRow(photo: photo);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
