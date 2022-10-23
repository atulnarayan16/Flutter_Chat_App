// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';

class FullImageView extends StatelessWidget {
  final String url;
  const FullImageView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageViewer(context, Image.network('url').image,
            swipeDismissible: false);
      },
      child: Container(
        height: 150,
        child: Image.asset(
          'url',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
