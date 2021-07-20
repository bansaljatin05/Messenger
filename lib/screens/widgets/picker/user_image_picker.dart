import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);
  final Function(PickedFile pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final _picker = ImagePicker();
  final _picker2 = ImagePicker();

  PickedFile _pickedImage;
  void _pickImage() async {
    // final pickedImageFile = await _picker.getImage(
    //   source: ImageSource.gallery,
    //   imageQuality: 50,
    //   maxWidth: 150,
    //   maxHeight: 150,
    // );
    // setState(() {
    //   _pickedImage = pickedImageFile;
    // });
    // widget.imagePickFn(pickedImageFile);

    List resultList = await MultiImagePicker.pickImages(
      maxImages: 5,
      materialOptions: MaterialOptions(
        actionBarTitle: "Action bar",
        allViewTitle: "All view title",
        actionBarColor: "#aaaaaa",
        actionBarTitleColor: "#bbbbbb",
        lightStatusBar: false,
        statusBarColor: '#abcdef',
        startInAllView: true,
        selectCircleStrokeColor: "#000000",
        selectionLimitReachedText: "You can't select any more.",
      ),
    );
  }

  void _pickVideo() async {
    final _pickedVideo = _picker2.getVideo(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(File(_pickedImage.path)) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text(
            'ADD IMAGE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickVideo,
          icon: Icon(Icons.image),
          label: Text(
            'ADD VIDEO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
