import 'package:flutter/material.dart';

import '../../../model/entity/content.dart';
import '../../../resources/app_colors.dart';

class HomeCell extends StatelessWidget {
  final Content content;
  const HomeCell({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: AppColors.background2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Image.network(
                content.image,
                width: width,
                fit: BoxFit.cover,
                errorBuilder: (context, widget, chunk) => Container(
                    width: width,
                    color: AppColors.background2,
                    child: Icon(Icons.error_outline,
                        color: AppColors.red.withOpacity(0.8))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(content.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
