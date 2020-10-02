import 'package:demo_class_app/model/note.dart';
import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  final Function addNote;

  AddNewNote(this.addNote);

  @override
  _AddNewNoteState createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  void addNewNote() {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    setState(() {
      Navigator.pop(context);
      widget.addNote(Note(title, description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 650,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: "title",
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  hintText: "description",
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.green,
                onPressed: () {
                  addNewNote();
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
