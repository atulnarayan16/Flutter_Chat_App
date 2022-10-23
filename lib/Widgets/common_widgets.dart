import 'package:flutter/material.dart';
import 'package:newchatapp/Constants/constants.dart';

Widget errorContainer() {
  return Container(
    clipBehavior: Clip.hardEdge,
    child: Image.asset(
      'assets/images/img_not_available.jpeg',
      height: 200,
      width: 200,
    ),
  );
}

Widget chatImage({required String imageSrc, required Function onTap}) {
  return OutlinedButton(
    onPressed: onTap(),
    child: Image.network(
      imageSrc,
      width: 200,
      height: 200,
      fit: BoxFit.cover,
      loadingBuilder:
          (BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 200,
          height: 200,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.red,
              value: loadingProgress.expectedTotalBytes != null &&
                      loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, object, stackTrace) => errorContainer(),
    ),
  );
}

Widget messageBubble(
    {required String chatContent,
    required EdgeInsetsGeometry? margin,
    Color? color,
    Color? textColor}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: margin,
    width: 200,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      chatContent,
      style: TextStyle(fontSize: 16, color: textColor),
    ),
  );
}
