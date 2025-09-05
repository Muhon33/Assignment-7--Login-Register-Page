import 'package:flutter/material.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _titleController = TextEditingController();
  final _linkController = TextEditingController();

  void _submitCourse() {
    final title = _titleController.text.trim();
    final link = _linkController.text.trim();

    if (title.isEmpty || link.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    Navigator.pop(context, {"title": title, "youtubeUrl": link});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Course")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Course Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _linkController,
              decoration: const InputDecoration(
                labelText: "YouTube Link",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _submitCourse,
              icon: const Icon(Icons.check),
              label: const Text("Add Course"),
            ),
          ],
        ),
      ),
    );
  }
}
