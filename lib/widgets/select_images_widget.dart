import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_images_picker/widgets/image_item.dart';

class SelectImagesWidget extends StatefulWidget {
  List<XFile> images;
  final Function() selectImageFromCamera;
  final Function() selectMultiImages;
  SelectImagesWidget({
    Key? key,
    required this.images,
    required this.selectMultiImages,
    required this.selectImageFromCamera,
  }) : super(key: key);

  @override
  State<SelectImagesWidget> createState() => _SelectImagesWidgetState();
}

class _SelectImagesWidgetState extends State<SelectImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.images.reversed
          .map((image) =>
              image.path.isEmpty ? _imageItem() : _imageItem(image: image))
          .toList(),
    );
  }

  Widget _imageItem({XFile? image}) {
    return ImageItemWidget(
        image: image,
        images: widget.images,
        selectImageFromCamera: widget.selectImageFromCamera,
        selectMultiImages: widget.selectMultiImages,
        removeImage: () => _removeImage(image!));
  }

  void _removeImage(XFile image) {
    for (var element in widget.images) {
      if (element.path == image.path) {
        widget.images.remove(element);
        setState(() {});
      }
    }
  }
}
