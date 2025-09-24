import 'package:flutter/material.dart';
import 'package:pixabay/features/home/presentation/views/image_row.dart';
import 'package:pixabay/features/home/presentation/views/responsive_list_grid.dart';

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

  final List<Photo> photos = List.generate(
    20,
        (i) => Photo('Photo $i', 'https://picsum.photos/seed/$i/400/400'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResponsiveListGrid(
          items: photos,
          itemBuilder: (context, photo, index) {
            return ImageRow(photo: photo);
          },
        ),
      ),
    );
  }
}
