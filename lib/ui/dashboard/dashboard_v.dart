import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_vm.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              CircleAvatar(),
              ListTile(
                title: Text("Profile"),
                onTap: model.profileTap,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
