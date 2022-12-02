import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/CategoryWidget.dart';
import 'package:halonodeviewer/api.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:halonodeviewer/node_entry.dart';

class HaloList extends StatefulWidget {
  bool showBackButton;
  String title;
  bool showSearch;
  int itemCount;
  Color titleBackground;
  String? footer;
  Widget Function(BuildContext, int) builder;
  String Function(int) searchBuilder;
  Color scaffoldBackground;
  Color titleColor;
  Color scaffoldTextColor;
  String? subdir;

  HaloList(this.showBackButton, this.itemCount, this.title, this.showSearch,
      this.builder,
      {this.footer,
        this.subdir,
      required this.searchBuilder,
      this.titleBackground = Colors.black,
      this.scaffoldBackground = Colors.white})
      : this.titleColor = titleBackground.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        this.scaffoldTextColor = scaffoldBackground.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white;

  _HaloList createState() => _HaloList();
}

class _HaloList extends State<HaloList> {
  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide:
          BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.zero);
  TextEditingController _searchController = TextEditingController();

  Future<void> buildSearchResults() async {
    String query = _searchController.text;
    List<CategoryModel> allCategory = await AppAPI.getAllNodes();
    allCategory.sort((a, b) =>
        b.getTotalSimilarity(query).compareTo(a.getTotalSimilarity(query)));
    List<Widget> widgets = [];
    for (CategoryModel categoryModel in allCategory) {
      widgets.add(CategoryWidget(categoryModel));
      List<dynamic> children = categoryModel.getSearchResults(query);
      var count = 0;
      for (dynamic child in children) {
        widgets.add(Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 25,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.black
                  ),
            ),
            Expanded(child: NodeEntry(child['body']))
          ],
        ));
        count++;
        if (count == 3) break;
      }
    }
    searchResults = widgets;
  }

  List<Widget> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldBackground,
      appBar: AppBar(
        toolbarHeight: 85,
        iconTheme: IconThemeData(color: widget.titleColor),
        backgroundColor: widget.titleBackground,
        automaticallyImplyLeading: widget.showBackButton,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: widget.titleColor, fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            if(widget.subdir != null)
              Container(height: 2),
            if(widget.subdir != null)
              Text(widget.subdir!, style: TextStyle(color: widget.titleColor.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.normal), textAlign: TextAlign.start,)
          ],
        ),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: widget.scaffoldTextColor),
        child: Column(
          children: [
            if (widget.showSearch)
              TextField(
                controller: _searchController,
                onChanged: (e) {
                  buildSearchResults().then((value) {
                    setState(() {});
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "Search...",
                    border: border,
                    enabledBorder: border,
                    disabledBorder: border,
                    errorBorder: border,
                    focusedBorder: border,
                    focusedErrorBorder: border),
              ),
            Expanded(
              child: _searchController.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, i) {
                        return searchResults[i];
                      })
                  : ListView.builder(
                      itemCount: widget.itemCount, itemBuilder: widget.builder),
            ),
            if (widget.footer != null)
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        widget.footer!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      )),
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
