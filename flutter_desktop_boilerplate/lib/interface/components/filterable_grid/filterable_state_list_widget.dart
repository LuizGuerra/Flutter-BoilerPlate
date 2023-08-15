import 'package:flutter/material.dart';

import '../../../controller/filtered_content_controller.dart';
import '../../../router/routes.dart';
import '../widget_reusable_button.dart';
import 'home_cell.dart';

// class FilterableGridWidget<T> extends StatelessWidget {
//   final FilteredContentController<T> filterController;
//   const FilterableGridWidget({required this.filterController, Key? key}) : super(key: key);
// }

class FilterableGridWidget<T> extends StatefulWidget {
  final FilteredContentController<T> filterController;
  const FilterableGridWidget({required this.filterController, Key? key})
      : super(key: key);

  @override
  State<FilterableGridWidget> createState() => _FilterableGridWidgetState();
}

class _FilterableGridWidgetState extends State<FilterableGridWidget> {
  @override
  Widget build(BuildContext context) {
    final list = widget.filterController.getList();
    final length = list.length;
    final haveContent = widget.filterController.haveContent();
    // Have downloaded content and have aplied filter
    if (length == 0 && haveContent) {
      return noMatchingFilter();
    }
    // Is downloading content
    if (length == 0 && !haveContent) {
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
      itemBuilder: (builder, index) => WidgetReusableButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(Routes.homeFollowUp, arguments: list[index]);
          },
          configuration: WidgetButtonConfigurations.grid(),
          child: HomeCell(content: list[index])),
    );
  }

  // foo() {
  //   TextButton(
  //     child: ,
  //   )
  // }

  Widget noMatchingFilter() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("No matching value found..."),
    );
  }
}
