import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingRowSkeletonizer extends StatelessWidget {
  const LoadingRowSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        effect: const ShimmerEffect(
          baseColor: Colors.grey, // Change the base color
          highlightColor: Colors.white70, // Change the highlight color
          // duration: Duration(seconds: 1),
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              AspectRatio(
                aspectRatio: 4 / 3,
                child: Skeleton.leaf(
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    ),
                    child: Container(color: Colors.grey[300]),
                  ),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("User's name here",
                        style: Theme.of(context).textTheme.bodySmall),
                  ),

                  Container(
                    height: 20,
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "cars, super cars, luxury cars, lamborghini, corvette, black car, white car, sports cars, exotic cars, daytime, parked cars, car row, black lamborghini, white lamborghini, black corvette, high-end vehicles, automobile, car collection, outdoor",
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
