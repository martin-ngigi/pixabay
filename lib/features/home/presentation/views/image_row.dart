import 'package:flutter/material.dart';
import 'package:pixabay/core/components/photo_tile.dart';
import 'package:pixabay/features/home/data/models/pixabay_response_model.dart';
import 'package:pixabay/features/home/presentation/views/home_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            child: PhotoTile(imageUrl: photo.webformatURL ?? ""),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(photo.user ?? "--", style: Theme.of(context).textTheme.bodySmall),
              ),

              Container(
                height: 20,
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  photo.tags ?? "--",
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
