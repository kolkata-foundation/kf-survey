import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'family_vm.dart';

class FamilyView extends StatelessWidget {
  const FamilyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FamilyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text("Family")),
      ),
      viewModelBuilder: () => FamilyViewModel(),
    );
  }
}
