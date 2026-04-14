import 'package:flutter/material.dart';
import 'package:test/views/editNoteView.dart';

class NotecontaenarWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String note;
  final String time;
  final Function() deleteNote;
  final Function() navigator;
  const NotecontaenarWidget({
    super.key,
    required this.color,
    required this.title,
    required this.note,
    required this.time,
    required this.deleteNote,
    required this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigator,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      note,

                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 10,
                      ),
                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: deleteNote,
                  icon: Icon(Icons.delete, size: 40, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    time,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
