import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/content_controller.dart';
import '../../../controller/filtered_content_controller.dart';
import '../../../model/entity/content.dart';
import '../../../resources/app_colors.dart';
import '../../../router/routes.dart';
import '../../components/filterable_grid/filterable_state_list_widget.dart';
import '../../components/left_navigation/left_navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ContentController contentController;
  late final FilteredContentController<Content> filterController;

  final TextEditingController searchController = TextEditingController();
  bool noMatchingFlag = false;
  bool iconButtonWasTapped = false;

  @override
  Widget build(BuildContext context) {
    return LeftNavigationScaffold(
        currentRoute: Routes.home,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            search(),
            noMatchingFlagWidget(),
            Expanded(child: FilterableGridWidget(filterController: filterController)),
            // gridView(),
          ],
        ));
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Row(
        children: [
          const Text("Home View Items",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Spacer(),
          IconButton(
            icon: Icon(
                iconButtonWasTapped
                    ? Icons.search_off_rounded
                    : Icons.search_rounded,
                size: 24),
            onPressed: () {
              setState(() {
                iconButtonWasTapped = !iconButtonWasTapped;
              });
            },
          )
        ],
      ),
    );
  }

  Widget search() {
    if (!iconButtonWasTapped) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: CupertinoSearchTextField(
        autocorrect: true,
        backgroundColor: AppColors.background2,
        itemColor: AppColors.white.withOpacity(0.8),
        placeholder: "Search by title",
        placeholderStyle: TextStyle(color: AppColors.white.withOpacity(0.8)),
        style: const TextStyle(color: AppColors.white),
        controller: searchController,
        onChanged: onChangeSearchBar,
      ),
    );
  }

  Widget noMatchingFlagWidget() {
    if (noMatchingFlag) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("No matching value found..."),
      );
    }
    return Container();
  }

  /// Receive and update data behavior
  @override
  void initState() {
    super.initState();
    filterController = FilteredContentController<Content>(content: []);
    contentController = ContentController(onReceive: onReceiveContent);
  }

  void onReceiveContent(List<Content> newContent) {
    setState(() {
      filterController.updateContent(newContent);
    });
  }

  void onChangeSearchBar(String input) {
    if (input.isEmpty) {
      filterController.reset();
    } else {
      noMatchingFlag = filterController.filter((e) => e.title.contains(input));
    }
    setState(() {});
  }
}
