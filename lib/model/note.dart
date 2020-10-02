class Note {
  String title, description;
  Note(this.title, this.description);
}

class NoteList {
  List<Note> notes = [];

  // add new Note
  void addNote(Note note) {
    notes.add(note);
  }

  //get number of Note present in notes
  int getLength() {
    return notes.length;
  }

  //get all notes
  List<Note> getNotes() {
    return [...notes];
  }

  //delete note
  void deleteNote(Note note) {
    notes.remove(note);
  }

  //Update current note
  void updateNote(Note oldNote, Note newNote) {
    final noteIndex = notes.indexWhere((note) =>
        note.title == oldNote.title && note.description == oldNote.description);
    notes[noteIndex] = newNote;
  }

  //find if note is empty
  bool isEmptyNote() {
    // return notes.length < 1 ? true : false;
    if (notes.length < 1) {
      return true;
    } else {
      return false;
    }
  }
}
