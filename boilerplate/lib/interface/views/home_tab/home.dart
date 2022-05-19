import 'package:boilerplate/controller/content_controller.dart';
import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../controller/filtered_content_controller.dart';
import '../../../model/entity/content.dart';
import '../../components/filterable_list_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            automaticallyImplyMiddle: true,
            middle: Text("Welcome back, Luiz",
                style: TextStyle(color: AppColors.white))),
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoSearchTextField(
                autocorrect: true,
                backgroundColor: AppColors.background2,
                itemColor: AppColors.white.withOpacity(0.8),
                placeholder: "Search by title",
                placeholderStyle:
                    TextStyle(color: AppColors.white.withOpacity(0.8)),
                controller: searchController,
                onChanged: onChangeSearchBar,
              ),
            ),
            noMatchingFlagWidget(),
            Expanded(
                child:
                    FilterableListWidget(filterController: filterController)),
          ],
        )));
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
      noMatchingFlag =
          filterController.filter((e) => e.title.contains(input));
    }
    setState(() {});
  }
}
