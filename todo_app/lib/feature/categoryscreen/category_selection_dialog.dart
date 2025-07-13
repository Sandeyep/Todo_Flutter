import 'package:flutter/material.dart';
import 'create_category_screen.dart';
import 'category_model.dart';

class CategorySelectionDialog extends StatefulWidget {
  const CategorySelectionDialog({super.key});

  @override
  State<CategorySelectionDialog> createState() => _CategorySelectionDialogState();
}

class _CategorySelectionDialogState extends State<CategorySelectionDialog> {
  final List<_BuiltInCategory> builtInCategories = [
    _BuiltInCategory("Grocery", Icons.shopping_basket, Colors.lightGreen),
    _BuiltInCategory("Work", Icons.work, Colors.orange),
    _BuiltInCategory("Sport", Icons.fitness_center, Colors.cyan),
    _BuiltInCategory("Design", Icons.design_services, Colors.tealAccent),
    _BuiltInCategory("University", Icons.school, Colors.blueAccent),
    _BuiltInCategory("Social", Icons.group, Colors.pinkAccent),
    _BuiltInCategory("Music", Icons.music_note, Colors.purpleAccent),
    _BuiltInCategory("Health", Icons.favorite, Colors.greenAccent),
    _BuiltInCategory("Movie", Icons.movie, Colors.lightBlue),
    _BuiltInCategory("Home", Icons.home, Colors.deepOrangeAccent),
  ];

  final List<Category> userCategories = [];

  Future<void> _navigateToCreateCategory(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateCategoryScreen()),
    );

    if (result != null && result is Category) {
      setState(() {
        userCategories.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalItems = builtInCategories.length + userCategories.length + 1;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.white24),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: totalItems,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  // Built-in categories
                  if (index < builtInCategories.length) {
                    final category = builtInCategories[index];
                    return _buildIconTile(
                      category.color,
                      Icon(category.icon, color: Colors.black),
                      category.label,
                    );
                  }

                  // User-added categories
                  if (index < builtInCategories.length + userCategories.length) {
                    final category = userCategories[index - builtInCategories.length];
                    return _buildIconTile(
                      category.color,
                      Image.memory(category.iconBytes, width: 24, height: 24),
                      category.name,
                    );
                  }

                  // Create New
                  return GestureDetector(
                    onTap: () => _navigateToCreateCategory(context),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                        const SizedBox(height: 6),
                        const Text("Create New", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Add Category", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconTile(Color bgColor, Widget iconWidget, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: iconWidget,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _BuiltInCategory {
  final String label;
  final IconData icon;
  final Color color;

  _BuiltInCategory(this.label, this.icon, this.color);
}
