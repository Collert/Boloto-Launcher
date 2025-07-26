import 'package:flutter/material.dart';
import 'package:lib_boloto_launcher/components/patch_note.dart';

class PatchNoteData {
  final String title;
  final String content;
  final String version;
  final String date;

  PatchNoteData({
    required this.title,
    required this.content,
    required this.version,
    required this.date,
  });
}

Future<List<PatchNoteData>> fetchPatchNotes() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));

  // Return dummy data
  return [
    PatchNoteData(
      title: "Version 1.0",
      content: "Initial release with lots of cool stuff.",
      version: "1.0",
      date: "2025-07-26",
    ),
    PatchNoteData(
      title: "Version 1.1",
      content: "Bug fixes and performance improvements.",
      version: "1.1",
      date: "2025-07-27",
    ),
  ];
}

class PatchNotesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PatchNoteData>>(
      future: fetchPatchNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No patch notes available.');
        }

        final patchNotes = snapshot.data!;

        return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              runSpacing: 16,
              children: patchNotes.map((note) {
                return Row(
                  // width: double.infinity,
                  children: [
                    PatchNote(
                      title: note.title,
                      content: note.content,
                      version: note.version,
                      date: note.date,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
