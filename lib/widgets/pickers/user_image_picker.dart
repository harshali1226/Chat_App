import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePicker extends StatefulWidget {

  final void Function(File pickedImage) imagePickfn;
  UserImagePicker(this.imagePickfn);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _image;
  final picker = ImagePicker();
  Future<void> _pickedImage() async {
   final pickedImageFile = await picker.getImage(
     source: ImageSource.camera,
     imageQuality: 70,
     maxWidth: 150,
     );
   setState(() {
     _image = File(pickedImageFile.path);
   });
   widget.imagePickfn(_image);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         CircleAvatar(
           radius: 45,
           backgroundColor: Colors.grey,
           backgroundImage: _image != null ? FileImage(_image) :  null,
           ),
                  FlatButton.icon(
                    onPressed: _pickedImage,
                    icon: Icon(Icons.image),
                    label: Text('Add an image'),
                    textColor: Theme.of(context).accentColor,
                    ),
      ],
    );
  }
}