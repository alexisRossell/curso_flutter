import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileController with ChangeNotifier {

  String? profileImage;
  File? profileImageFile;

  void getImageFromSource(ImageSource imageSource) async {
    ImagePicker().pickImage(source: imageSource).then((pickedImage) {
      if (pickedImage != null) {
        profileImageFile = File(pickedImage.path);
        notifyListeners();
      }
    });
  }

}