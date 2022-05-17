import 'package:flutter/material.dart';
import 'package:kf_survey/util/colors.dart';
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
                onTap: model.onProfileTap,
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text("Add Family"),
                onTap: model.onAddFamilyTap,
                leading: const Icon(Icons.group_add),
                tileColor: blueBG,
                textColor: blueTC,
                iconColor: blueTC,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text("Find Family"),
                onTap: model.onFindFamilyTap,
                leading: const Icon(Icons.search),
                tileColor: redBG,
                textColor: redTC,
                iconColor: redTC,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text("Find Person"),
                onTap: model.onFindPersonTap,
                leading: const Icon(Icons.person_search),
                tileColor: greenBG,
                textColor: greenTC,
                iconColor: greenTC,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
