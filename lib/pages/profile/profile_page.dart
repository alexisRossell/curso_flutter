import 'package:curso/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileController(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.orange,
        ),
        child: Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.orange,
              child: Align(
                alignment: Alignment.center,
                child: Consumer<ProfileController>(
                  builder: (context, profileController, widget) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(80)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Widget galleryButton = TextButton(
                          onPressed: () => profileController
                              .getImageFromSource(ImageSource.gallery),
                          child: const Text(
                            "GALERIA",
                          ),
                        );

                        Widget cameraButton = TextButton(
                          onPressed: () => profileController
                              .getImageFromSource(ImageSource.camera),
                          child: const Text(
                            "CAMARA",
                          ),
                        );

                        AlertDialog alertDialog = AlertDialog(
                          title: const Text('Selecciona tu imagen'),
                          actions: [galleryButton, cameraButton],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertDialog;
                          },
                        );
                      },
                      child: profileController.profileImageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                profileController.profileImageFile!,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )
                          : profileController.profileImage != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      profileController.profileImage ?? ""),
                                  radius: 70,
                                )
                              : const CircleAvatar(
                                  radius: 70,
                                  child: Text("AA"),
                                ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
