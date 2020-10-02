import 'package:demo_class_app/model/note.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateNote extends StatefulWidget {
  String title, description;
  final Function updateNote;

  UpdateNote(this.title, this.description, this.updateNote);

  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  void setController() {
    _titleController = new TextEditingController()..text = widget.title;
    _descriptionController = new TextEditingController()
      ..text = widget.description;
  }

  void updateNote(context) {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    setState(() {
      widget.updateNote(
          Note(widget.title, widget.description), Note(title, description));
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    setController();
    return Container(
      padding: EdgeInsets.all(10),
      height: 650,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: (_) {
                updateNote(context);
              },
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
              onFieldSubmitted: (_) {
                updateNote(context);
              },
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
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.green,
                onPressed: () {
                  updateNote(context);
                },
                child: Text(
                  "Update",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
