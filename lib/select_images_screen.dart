import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_images_picker/utils/open_snack_bar.dart';
import 'package:multi_images_picker/widgets/select_images_widget.dart';

class SelectImagesScreen extends StatefulWidget {
  const SelectImagesScreen({Key? key}) : super(key: key);

  @override
  State<SelectImagesScreen> createState() => _SelectImagesScreenState();
}

class _SelectImagesScreenState extends State<SelectImagesScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> images = [XFile('')];

  Future<void> _selectMultiImages(context) async {
    try {
      final List<XFile> pickedFiles = await imagePicker.pickMultiImage();
      if (pickedFiles.length - 1 + images.length <= 5) {
        if (pickedFiles.isNotEmpty && images.length <= 5) {
          images.addAll(pickedFiles);
          setState(() {});
        } else {
          openSnackBar(context);
        }
      } else {
        openSnackBar(context);
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future<void> _selectImageFromCamera(context) async {
    try {
      final XFile? pickedFile =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null && images.length <= 5) {
        images.add(pickedFile);
        setState(() {});
      } else {
        openSnackBar(context);
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image Chooser'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              SelectImagesWidget(
                images: images,
                selectMultiImages: () => _selectMultiImages(context),
                selectImageFromCamera: () => _selectImageFromCamera(context),
              ),
            ],
          )),
    );
  }
}
