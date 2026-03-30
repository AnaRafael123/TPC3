import 'package:flutter/material.dart';

void main() {
  runApp(MentorApp());
}

class Mentor {
  final String name;
  final String department;
  final List<String> interests;

  Mentor(this.name, this.department, this.interests);
}

class MentorApp extends StatelessWidget {
  final List<Mentor> mentors = [
    Mentor("Alice", "Computer Science", ["AI", "ML"]),
    Mentor("Bob", "Design", ["UX"]),
    Mentor("Carlos", "Computer Science", ["Security"]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MentorPage(mentors: mentors),
    );
  }
}

class MentorPage extends StatefulWidget {
  final List<Mentor> mentors;

  MentorPage({required this.mentors});

  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  final deptController = TextEditingController();
  final interestsController = TextEditingController();
  List<Mentor> results = [];

  void search() {
    final dept = deptController.text;
    final interests = interestsController.text.split(",").map((e) => e.trim());

    setState(() {
      results = widget.mentors.where((m) =>
      m.department == dept &&
          m.interests.any((i) => interests.contains(i))
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mentor Suggestions")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: Key("deptField"),
              controller: deptController,
              decoration: InputDecoration(labelText: "Department"),
            ),
            TextField(
              key: Key("interestsField"),
              controller: interestsController,
              decoration: InputDecoration(labelText: "Interests (comma separated)"),
            ),
            ElevatedButton(
              key: Key("searchButton"),
              onPressed: search,
              child: Text("Get Suggestions"),
            ),
            Expanded(
              child: ListView(
                key: Key("resultsList"),
                children: results
                    .map((m) => ListTile(
                  title: Text(m.name),
                  subtitle: Text("${m.department} – ${m.interests.join(", ")}"),
                ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
