import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/services/database.dart';
import 'package:unote/utils/const.dart';

class NewNote extends StatelessWidget {
  NewNote({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                  // labelText: 'Title',
                  hintText: "Start Writing here...",
                ),
                scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty && bodyController.text.isEmpty) {
            showEmptyTitleDialog(context);
          } else {
            Database().addNote(auth.currentUser!.uid, titleController.text,
                bodyController.text);
            Get.back();
          }
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

void showEmptyTitleDialog(BuildContext context) {
  print("in dialog ");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: Text(
          "Notes is empty!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'The content of the note cannot be empty to be saved.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
