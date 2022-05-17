import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_vm.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text("Search")),
      ),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
