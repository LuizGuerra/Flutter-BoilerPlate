import 'package:boilerplate/interface/components/small_reusable_button.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';

import '../../controller/filtered_content_controller.dart';

class FilterableListWidget<T> extends StatefulWidget {
  final FilteredContentController<T> contentController;
  const FilterableListWidget({required this.contentController, Key? key})
      : super(key: key);
  @override
  State<FilterableListWidget> createState() => FilterableStateListWidget();
}

class FilterableStateListWidget extends State<FilterableListWidget> {
  static const double _betweenCellsPadding = 4;
  @override
  Widget build(BuildContext context) {
    final list = widget.contentController.getList();
    final length = list.length;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length + 2,
      itemBuilder: (context, index) {
        if (index == 0 || index == length + 1) {
          return const SizedBox(height: _betweenCellsPadding);
        }
        final actualIndex = index - 1;
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: _betweenCellsPadding),
          child: SmallReusableButton(
            configuration: SmallButtonConfigurations.plain(),
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.homeFollowUp, arguments: actualIndex);
            },
            child: Row(children: [Text("Item ${list[actualIndex]}"), const Spacer()]),
          ),
        );
      },
    );
  }
}
