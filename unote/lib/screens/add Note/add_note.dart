import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unote/utils/const.dart';
import 'package:uuid/uuid.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    if (isloading) {
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    } else {
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
          onPressed: () async {
            setState(() {
              isloading = true;
            });
            if (titleController.text.isEmpty && bodyController.text.isEmpty) {
              showEmptyTitleDialog(context);
              setState(() {
                isloading = false;
              });
            } else {
              try {
                final String uuid = const Uuid().v4();
                await firestore
                    .collection('users')
                    .doc(uid)
                    .collection('notes')
                    .doc(uuid)
                    .set({
                  'id': uuid,
                  'title': titleController.text,
                  'body': bodyController.text,
                  'dateTime': Timestamp.now(),
                });
              } catch (e) {
                print(e.toString());
              }
              Get.back();
              setState(() {
                isloading = false;
              });
            }
          },
          label: const Text('Save'),
          icon: const Icon(Icons.save),
        ),
      );
    }
  }
}
