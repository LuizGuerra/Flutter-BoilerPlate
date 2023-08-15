import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/components/glass_view.dart';
import 'package:flutter_desktop_boilerplate/model/entity/content.dart';

import '../../../resources/app_colors.dart';

class HomeFollowUp extends StatelessWidget {
  final Content content;
  const HomeFollowUp({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(content.title),
    );
    double appBarHeight = appBar.preferredSize.height;

    final size = MediaQuery.of(context).size;
    final height = size.height - appBarHeight;
    final width = size.width;

    final smallScreen = size.width < 500;
    return Scaffold(
        appBar: appBar,
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: GlassedImageBackground(image: image(BoxFit.cover)),
            ),
            Column(
              children: [
                Expanded(
                  child: smallScreen
                      ? image(BoxFit.fitWidth)
                      : Container(
                          margin: const EdgeInsets.all(40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: image(BoxFit.contain),
                          ),
                        ),
                ),
                contentDescription(),
              ],
            ),
          ],
        ));
  }

  double spaceConstant(bool isSmall) => isSmall ? 20 : 40;

  Image image(BoxFit fit) {
    return Image.network(content.image,
        errorBuilder: (context, widget, chunk) => Container(
            color: AppColors.background2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Icon(Icons.error_outline,
                  color: AppColors.red.withOpacity(0.8)),
            )),
        fit: fit);
  }

  Widget contentDescription() {
    return GlassComponent(
      color: AppColors.background,
      insets: const EdgeInsets.all(20),
      radius: BorderRadius.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                content.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const Spacer(),
              const ToggleButton(
                  icon1: Icon(Icons.star_border, color: AppColors.opositeColor),
                  icon2: Icon(Icons.star, color: AppColors.opositeColor))
            ],
          ),
          const SizedBox(height: 16),
          Text(content.description),
        ],
      ),
    );
  }
}

class GlassedImageBackground extends StatelessWidget {
  final Image image;
  const GlassedImageBackground({required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(height: size.height, width: size.width, child: image),
        GlassComponent(
            color: AppColors.background,
            radius: BorderRadius.zero,
            child: Container()),
      ],
    );
  }
}

class ToggleButton extends StatefulWidget {
  final Icon icon1, icon2;
  const ToggleButton({required this.icon1, required this.icon2, Key? key})
      : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: state ? widget.icon1 : widget.icon2,
      onPressed: togle,
    );
  }

  void togle() {
    setState(() {
      state = !state;
    });
  }
}
