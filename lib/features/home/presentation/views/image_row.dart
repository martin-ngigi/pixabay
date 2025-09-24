import 'package:flutter/material.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';

class ImageRow extends StatelessWidget {
  final Photo photo;
  ImageRow({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // image
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(photo.imageUrl, fit: BoxFit.cover),
          ),
          // title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(photo.title, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
