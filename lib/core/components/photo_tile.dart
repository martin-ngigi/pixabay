import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PhotoTile extends StatelessWidget {
  final String imageUrl;

  const PhotoTile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,

      // Skeleton while loading
      placeholder: (context, url) => Skeletonizer(
        effect: const ShimmerEffect(
          baseColor: Colors.grey, // Change the base color
          highlightColor: Colors.white70, // Change the highlight color
          // duration: Duration(seconds: 1),
        ),
        enabled: true,
        child: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
        ),
      ),

      // Show error icon if load fails
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 40,
      ),
    );
  }
}
