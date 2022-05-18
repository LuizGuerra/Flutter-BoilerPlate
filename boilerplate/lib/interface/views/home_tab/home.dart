import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../controller/filtered_content_controller.dart';
import '../../components/filterable_list_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final contentController = FilteredContentController<int>(content: <int>[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ]);
  final searchController = TextEditingController();
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
                placeholderStyle:
                    TextStyle(color: AppColors.white.withOpacity(0.8)),
                controller: searchController,
                onChanged: onChangeSearchBar,
              ),
            ),
            noMatchingFlagWidget(),
            Expanded(
                child: FilterableListWidget(
                    contentController: contentController)),
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

  void onChangeSearchBar(String input) {
    if (input.isEmpty) {
      contentController.reset();
    } else {
      noMatchingFlag =
          contentController.filter((e) => e.toString().contains(input));
    }
    setState(() {});
  }
}
