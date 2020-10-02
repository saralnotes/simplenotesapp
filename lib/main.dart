import 'package:demo_class_app/model/note.dart';
import 'package:demo_class_app/screen/add_note_screen.dart';
import 'package:demo_class_app/screen/update_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteScreenView(),
    );
  }
}

class NoteScreenView extends StatefulWidget {
  @override
  _NoteScreenViewState createState() => _NoteScreenViewState();
}

class _NoteScreenViewState extends State<NoteScreenView> {
  NoteList notes = new NoteList();
  void addNewNote(Note newNote) {
    setState(() {
      notes.addNote(newNote);
    });
  }

  void updateNote(Note oldNote, Note newNote) {
    setState(() {
      notes.updateNote(oldNote, newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddNewNote(addNewNote);
                });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body: notes.isEmptyNote()
            ? Center(
                child: Text(
                  "No notes!",
                  style: TextStyle(fontSize: 24),
                ),
              )
            : ListView.builder(
                itemCount: notes.getLength(),
                itemBuilder: (context, index) => ListTile(
                  title: Text(notes.notes[index].title),
                  subtitle: Text(notes.notes[index].description),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return UpdateNote(
                                        notes.notes[index].title,
                                        notes.notes[index].description,
                                        updateNote);
                                  });
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                notes.deleteNote(notes.notes[index]);
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ));
  }
}
