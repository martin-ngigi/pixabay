import 'package:flutter/material.dart';
import 'package:pixabay/features/dashboard/domain/entities/menu_item.dart';

class SideMenuView extends StatelessWidget {
  final String currentRoute;
  final List<MenuItem> menuItems;
  final ValueChanged<MenuItem> onTap;

  const SideMenuView({
    super.key,
    required this.currentRoute,
    required this.menuItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: Column(
        children: [
          // Profile header
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/person.jpg",
              ),
            ),
            accountName: const Text(
              "Martin Wainaina",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("wainainamnw@gmail.com"),
          ),

          // Menu items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: menuItems.map((item) {
                final isSelected = currentRoute == item.route;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.shade50 : null,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: colorScheme.primary, width: 2)
                        : null,
                  ),
                  child: ListTile(
                    leading: Icon(item.icon,
                        color: isSelected ? colorScheme.primary : Colors.grey[700]),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? colorScheme.primary.withValues(alpha: 0.8) : Colors.black87,
                      ),
                    ),
                    onTap: () => onTap(item),
                  ),
                );
              }).toList(),
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Pixabay © 2025",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
