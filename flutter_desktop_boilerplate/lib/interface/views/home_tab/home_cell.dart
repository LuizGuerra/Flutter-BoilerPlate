import 'package:boilerplate/model/entity/content.dart';
import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

class HomeCell extends StatelessWidget {
  final Content content;
  const HomeCell({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            content.image,
            fit: BoxFit.cover,
            height: 48,
            width: 48,
            errorBuilder: (context, widget, chunk) => Container(
                width: 48,
                height: 48,
                color: AppColors.background2,
                child: Icon(CupertinoIcons.exclamationmark_circle,
                    color: AppColors.red.withOpacity(0.8))),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(content.description,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        const SizedBox(width: 16)
      ],
    );
  }
}
