import 'package:flutter/material.dart';
import 'package:pixabay/features/home/data/models/pixabay_response_model.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';

class ImageRow extends StatelessWidget {
  //final Photo photo;
  final Hits photo;
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
            child: Image.network(photo.webformatURL ?? "", fit: BoxFit.cover),
          ),
          Column(
            spacing: 10,
            children: [
              // title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(photo.user ?? "--", style: Theme.of(context).textTheme.bodySmall),
              ),

              // tags
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  photo.tags ?? "--",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
