import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'category_model.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final TextEditingController _controller = TextEditingController();
  Uint8List? selectedImageBytes;
  Color? selectedColor;

  final List<Color> colorOptions = [
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.lightBlue,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];

  Future<void> _selectIconFromDevice() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        selectedImageBytes = result.files.single.bytes;
      });
    }
  }

  void _createCategory() {
    if (_controller.text.isNotEmpty &&
        selectedImageBytes != null &&
        selectedColor != null) {
      final newCategory = Category(
        name: _controller.text,
        iconBytes: selectedImageBytes!,
        color: selectedColor!,
      );
      Navigator.pop(context, newCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create new category"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Category name",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Category icon:", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _selectIconFromDevice,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: selectedColor ?? Colors.grey[800],
                    child: selectedImageBytes != null
                        ? ClipOval(
                            child: Image.memory(
                              selectedImageBytes!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          )
                        : const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Category color:", style: TextStyle(color: Colors.white)),
            ),
            Wrap(
              spacing: 10,
              children: colorOptions.map((color) {
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: color,
                    child: selectedColor == color
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel", style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: _createCategory,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  child: const Text("Add Category", style: TextStyle(color: Colors.white70)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
