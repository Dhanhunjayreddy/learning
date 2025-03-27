import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ValueNotifier<XFile?> profilePath = ValueNotifier(XFile(""));
  String pick = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ValueListenableBuilder(
              builder: (context, profileFile, __) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    // decoration:
                    //     BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                    child:
                        (profileFile?.path.isNotEmpty ?? false)
                            ? Image.file(
                              File(profileFile?.path ?? ""),
                              height: 100,
                              width: 100,
                            )
                            : Image.asset(
                              "asset/images/place_holder.jpg",
                              height: 100,
                              width: 100,
                            ),
                  ),
                );
              },
              valueListenable: profilePath,
            ),
            ElevatedButton(
              onPressed: () async {
                String pick = await bottomSheet(context);
                pickImage(context, pick);
              },
              child: const Text("PickImage"),
            ),
          ],
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
              child: Container(
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
}
