import 'package:flutter/material.dart';
import 'package:multi_images_picker/widgets/bottom_sheet_item_widget.dart';

Future takeImageMethodBottomSheet(
  context,
  Function() selectImageFromCamera,
  Function() selectMultiImagesFromGalley,
) {
  return showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetItemWidget(
                icon: Icons.camera_alt,
                itemTitle: 'Camera',
                onTap: selectImageFromCamera),
            const SizedBox(width: 32),
            BottomSheetItemWidget(
              icon: Icons.image,
              itemTitle: 'Gallery',
              onTap: selectMultiImagesFromGalley,
            ),
          ],
        ),
      );
    },
  );
}
