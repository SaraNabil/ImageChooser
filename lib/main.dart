import 'package:flutter/material.dart';
import 'package:multi_images_picker/select_images_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Chooser',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SelectImagesScreen(),
      // home: const MyHomePage(),
    );
  }
}
