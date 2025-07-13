
import 'package:flutter/material.dart';
import 'package:todo_app/feature/categoryscreen/category_selection_dialog.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _openCategoryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>  CategorySelectionDialog(),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          onPressed: () => _openCategoryDialog(context),
          child: const Text("Add Category"),
        ),
      ),
    );
  }
}
