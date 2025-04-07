import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/user_form/user_form_screen.dart';

class UsersListFormScreen extends StatefulWidget {
  const UsersListFormScreen({super.key});

  @override
  State<UsersListFormScreen> createState() => _UsersListFormScreenState();
}

class _UsersListFormScreenState extends State<UsersListFormScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  QuerySnapshot? userFormQuerySnapshot;
  List? userFormList = [];

  gettingFireBaseData() async {
    userFormList?.clear();
    userFormQuerySnapshot = await _firestore.collection('userForm').get();

    userFormQuerySnapshot?.docs.map((doc) {
      return userFormList?.add(doc.data() as Map<String, dynamic>);
    }).toList();
    print("userFormList..$userFormList");
    setState(() {});
  }

  @override
  void initState() {
    gettingFireBaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              String result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdmissionFormPage()),
              );
              print("result...$result");
              if (result.toLowerCase() == "update") {
                gettingFireBaseData();
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userFormList?.length,
        itemBuilder: (context, index) {
          var details = userFormList?[index];
          String docId = userFormQuerySnapshot?.docs[index].id ?? "";
          return Card(
            child: ListTile(
              onTap: () async {
                String result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AdmissionFormPage(
                          userFormData: details,
                          docId: docId,
                        ),
                  ),
                );
                print("result...$result");
                if (result.toLowerCase() == "update") {
                  gettingFireBaseData();
                }
              },
              trailing: Icon(Icons.arrow_forward_ios_sharp),

              title: Text(details["StudentName"]),
            ),
          );
        },
      ),
    );
  }
}
