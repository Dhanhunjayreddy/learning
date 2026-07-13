import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/home/home_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ValueNotifier<XFile?> profilePath = ValueNotifier(XFile(""));
  String pick = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFEFEAFE),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ValueListenableBuilder(
                    builder: (context, profileFile, __) {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child:
                                  (profileFile?.path.isNotEmpty ?? false)
                                      ? Image.file(
                                        File(profileFile?.path ?? ""),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                      : Image.asset(
                                        "asset/images/place_holder.jpg",
                                        height: 100,
                                        width: 100,
                                      ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                    valueListenable: profilePath,
                  ),
                ),
                const SizedBox(height: 20),
                buildProfileField("Name", "Username"),
                buildProfileField("Mobile Number", "9999999999"),
                buildProfileField("Mail", "hello@example.com"),
                buildProfileField("Batch No", "3"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage(BuildContext context, String pick) async {
    final ImagePicker picker = ImagePicker();
    if (pick == "gallery") {
      // Pick an image.
      profilePath.value = await picker.pickImage(source: ImageSource.gallery);
    } else {
      // Capture a photo.
      profilePath.value = await picker.pickImage(source: ImageSource.camera);
    }

    return profilePath.value;
  }

  bottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            pick = "gallery";
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Gallery"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            pick = "camera";
                          });
                          // pickImage(context, "camera");
                          Navigator.pop(context);
                        },
                        child: Text("Camera"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    return pick;
  }

  Widget buildProfileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: Color.fromARGB(255, 77, 16, 230),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
