import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_images_picker/utils/open_snack_bar.dart';
import 'package:multi_images_picker/utils/take_image_method_bottom_sheet.dart';

class ImageItemWidget extends StatefulWidget {
  final XFile? image;
  final List<XFile> images;
  final Function() selectImageFromCamera;
  final Function() selectMultiImages;
  final Function() removeImage;
  ImageItemWidget({
    Key? key,
    this.image,
    required this.images,
    required this.selectImageFromCamera,
    required this.selectMultiImages,
    required this.removeImage,
  }) : super(key: key);

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.image != null
          ? () {}
          : () {
              if (widget.images.length <= 5) {
                takeImageMethodBottomSheet(context, () {
                  Navigator.pop(context);
                  widget.selectImageFromCamera();
                }, () {
                  Navigator.pop(context);
                  widget.selectMultiImages();
                });
              } else {
                openSnackBar(context);
              }
            },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: widget.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      File(widget.image!.path),
                      fit: BoxFit.fill,
                    ),
                  )
                : const Icon(Icons.add),
          ),
          Visibility(
            visible: widget.image != null,
            child: InkWell(
              onTap: () {
                widget.removeImage();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 13,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
