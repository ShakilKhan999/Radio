import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


class NewsImagePicker extends StatefulWidget {
  final String? imagePath;
  final ValueChanged<String> setImagePath;

  const NewsImagePicker(
      {super.key, required this.setImagePath, required this.imagePath});

  @override
  State<NewsImagePicker> createState() =>
      _NewsImagePickerState();
}

class _NewsImagePickerState extends State<NewsImagePicker> {
  String selectedImagePath = '';

/*  ImageProvider determineImage() {
    if (selectedImagePath != '') {
      return Image.file(File(selectedImagePath)).image;
    } else if (widget.imagePath != null) {
      return NetworkImage(widget.imagePath!);
    } else {
      return AssetImage(AppImagePath.imageProfilepicture1);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.grey.shade900,
        child: Container(
          width: double.infinity,
          height: 200.0,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () async {
              selectedImagePath = await selectImageFromGallery();
              print('Image_Path:-');
              print(selectedImagePath);

              if (selectedImagePath != '') {
                widget.setImagePath(selectedImagePath);
              }
            },
            child: selectedImagePath!=''? Image.file(File(selectedImagePath)):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('images/upload.png'),
                  size: 30.0.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  'Upload thumbnail',
                  style: TextStyle(
                      color: Colors.grey.shade300, fontSize: 15.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
