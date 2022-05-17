import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'family_add_vm.dart';

class FamilyAddView extends StatelessWidget {
  const FamilyAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FamilyAddViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => FamilyAddViewModel(),
    );
  }
}
