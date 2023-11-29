import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _noteController = TextEditingController();
  String _note = '';

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _saveNote() {
    setState(() {
      _note = _noteController.text;
      _noteController.clear();
    });
    // Here, you can save the note to your data storage or perform any other actions
    // For example: saveNoteToDatabase(_note);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Add Note',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveNote,
            child: const Text('Save Note'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Note for the Student:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            _note,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}