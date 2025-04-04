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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: userFormList?.length,
        itemBuilder: (context, index) {
          var details = userFormList?[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdmissionFormPage(userFormData: details,)),
                );
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
