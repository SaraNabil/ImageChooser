import 'package:flutter/material.dart';

void openSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('You can\'t choose more than 5 images'),
    ),
  );
}
