import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unote/screens/edit%20screen/edit_screen.dart';
import 'package:unote/screens/home/home_screen.dart';
import 'package:unote/screens/widgets/user_icon.dart';
import 'package:unote/utils/const.dart';
import 'package:unote/utils/emal_check.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, required this.noteId, required this.data});
  final String noteId;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.1),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(EditScreen(
                data: data,
              ));
            },
            icon: const Icon(
              Icons.edit,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            'Are You Sure?',
                            textScaleFactor: 2,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: primaryColor,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  await firestore
                                      .collection('users')
                                      .doc(uid)
                                      .collection('notes')
                                      .doc(data['id'])
                                      .delete();
                                  Get.to(() => HomeScreen());
                                },
                                color: primaryColor,
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.delete,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            'Collaborate with',
                            textScaleFactor: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await checkEmailExists(
                                  emailController.text.trim());
                              Navigator.of(context).pop();
                            },
                            color: primaryColor,
                            child: const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.share,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              data['title'],
              textScaleFactor: 2,
              style: const TextStyle(
                color: primaryColor,
              ),
            ),
            Text(data['body']),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            UserIcon(
              color: Colors.teal,
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            UserIcon(
              color: Colors.cyan,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
