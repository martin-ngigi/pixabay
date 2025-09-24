import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onSearch;
  final VoidCallback? onClear;
  final ValueChanged<String>? onTextChange;

  const AppSearchBar({
    super.key,
    this.hintText = "Search...",
    required this.onSearch,
    this.onClear,
    this.onTextChange,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onTextChange?.call(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSearch,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),

          // Border colors
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),

          // Left search button
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () => widget.onSearch(_controller.text.trim()),
          ),

          // ✅ Fixed suffix with clear + extra search button
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min, // important to avoid overflow
            children: [
              // Clear button (only visible if text exists)
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _controller,
                builder: (context, value, _) {
                  if (value.text.isEmpty) return const SizedBox.shrink();
                  return IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                      widget.onClear?.call();
                      setState(() {}); // refresh
                    },
                  );
                },
              ),

              // Extra search button
              Container(
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.search, color: colorScheme.primary),
                  onPressed: () => widget.onSearch(_controller.text.trim()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
