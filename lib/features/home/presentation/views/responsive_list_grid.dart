import 'package:flutter/material.dart';

class ResponsiveListGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;

  final double targetItemWidth;

  final double smallScreenMaxWidth;

  final double spacing;

  const ResponsiveListGrid({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.targetItemWidth = 220,
    this.smallScreenMaxWidth = 600,
    this.spacing = 12,
  }) : super(key: key);

  int _calculateColumns(double maxWidth) {
    final int columns = (maxWidth / targetItemWidth).floor(); // Ensure at least 1 column.
    return columns.clamp(1, 12);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;

      final bool isSmall = maxWidth <= smallScreenMaxWidth;

      if (isSmall) {
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (_, __) => SizedBox(height: spacing),
          itemBuilder: (context, index) {
            return itemBuilder(context, items[index], index);
          },
        );
      }
      else {
        final columns = _calculateColumns(maxWidth);
        final double childAspectRatio = 1.0; // square-ish. use 0.8 or 1.2 if needed.

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return itemBuilder(context, items[index], index);
          },
        );
      }
    });
  }
}
