import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  File? myImage ;
  Future<String> pickImageGallery() async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    print(file!.path);
    return file.path;
  }

  Future<String> pickImageCamera() async {
    XFile? file = await _picker.pickImage(source: ImageSource.camera);
    print(file!.path);
    return file.path;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera and Gallery"),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 300 ,
          backgroundImage: myImage != 1 ? FileImage(myImage!): null,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         showImagePickerDialog (context);
        },
        child: Icon(Icons.camera),
      ),
   
    );
    
  }

   void showImagePickerDialog(BuildContext context) {
        showCupertinoModalPopup(
          context: context ,
           builder:(BuildContext context) {
             return CupertinoActionSheet(
              title:  Text('Rasm tanlash'),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  onPressed:() {
                    pickImageCamera();
                  }, 
                  child: Text('Kamera'),
                  
                   ),
                   CupertinoActionSheetAction
                   (onPressed: () {
                      pickImageGallery() ;
                   },
                 
                    child: Text('Galareya'))
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: (){
                  Navigator.of(context).pop() ;
                },
                child: Text('Bekor qilish'),
              ),
             );
           }
        );
      }
    }