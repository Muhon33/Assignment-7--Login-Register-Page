import 'package:flutter/material.dart';
import 'course_item.dart';
import 'add_course_page.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> courses = [];

  void _addCourse() async {
    final newCourse = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddCoursePage()),
    );

    if (newCourse != null) {
      setState(() {
        courses.add(Map<String, String>.from(newCourse));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _addCourse),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              "Hey ${widget.userName}!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "What are you learning today?",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Course list
            Expanded(
              child:
                  courses.isEmpty
                      ? const Center(child: Text("No courses yet. Add one!"))
                      : ListView.builder(
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          return CourseItem(
                            title: courses[index]["title"]!,
                            youtubeUrl: courses[index]["youtubeUrl"]!,
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
