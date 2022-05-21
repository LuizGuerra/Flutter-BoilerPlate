import 'package:flutter/material.dart';

import '../../../controller/filtered_content_controller.dart';
import 'home_cell.dart';

// class FilterableGridWidget<T> extends StatelessWidget {
//   final FilteredContentController<T> filterController;
//   const FilterableGridWidget({required this.filterController, Key? key}) : super(key: key);
// }

class FilterableGridWidget<T> extends StatefulWidget {
  final FilteredContentController<T> filterController;
  const FilterableGridWidget({required this.filterController, Key? key}) : super(key: key);

  @override
  State<FilterableGridWidget> createState() => _FilterableGridWidgetState();
}

class _FilterableGridWidgetState extends State<FilterableGridWidget> {
  @override
  Widget build(BuildContext context) {
    final list = widget.filterController.getList();
    final length = list.length;
    if (length == 0) {
      return const Center(child: CircularProgressIndicator());
    }
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1.35,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: length,
        itemBuilder: (builder, index) => HomeCell(content: list[index]));
  }
}