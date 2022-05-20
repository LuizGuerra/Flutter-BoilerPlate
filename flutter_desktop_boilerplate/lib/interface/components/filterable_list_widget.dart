import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/components/widget_reusable_button.dart';

import '../../controller/filtered_content_controller.dart';
import '../../router/routes.dart';

class FilterableListWidget<T> extends StatefulWidget {
  final FilteredContentController<T> filterController;
  const FilterableListWidget({required this.filterController, Key? key})
      : super(key: key);
  @override
  State<FilterableListWidget> createState() => FilterableStateListWidget();
}

class FilterableStateListWidget extends State<FilterableListWidget> {
  static const double _betweenCellsPadding = 4;
  @override
  Widget build(BuildContext context) {
    final list = widget.filterController.getList();
    final length = list.length;
    if (length == 0) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length + 2,
      itemBuilder: (context, index) {
        if (index == 0 || index == length + 1) {
          return const SizedBox(height: _betweenCellsPadding*4);
        }
        final actualIndex = index - 1;
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: _betweenCellsPadding),
          child: WidgetReusableButton(
            configuration: WidgetButtonConfigurations.plainText(),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Routes.homeFollowUp, arguments: list[actualIndex]);
            },
            // child: HomeCell(content: list[actualIndex]),
            child: Container(), // TODO: change this later
          ),
        );
      },
    );
  }
}
