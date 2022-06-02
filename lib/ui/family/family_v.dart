import 'package:flutter/material.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:stacked/stacked.dart';

import 'family_vm.dart';

class FamilyView extends StatelessWidget {
  final String familyId;
  const FamilyView({required this.familyId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FamilyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Family"),
        ),
        body: (model.isBusy)
            ? const LoadingScreen(
                opacity: 1.0,
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(model.family?.last_name ?? ""),
                          subtitle: Text(
                            "${model.family?.block ?? ""} ${model.family?.phone ?? ""}",
                          ),
                          leading: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.people),
                          ),
                          tileColor: Colors.teal.shade100,
                          trailing: IconButton(
                            icon: const Icon(Icons.playlist_add),
                            onPressed: model.newFamilySurvey,
                          ),
                        ),
                      ),
                      if (model.family?.members.isNotEmpty ?? false)
                        for (final member
                            in model.family?.members ?? List<Member>.empty())
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(member.name),
                              subtitle: Text(
                                  "${member.age} ${member.gender} ${member.phone}"),
                              leading: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.person),
                              ),
                              tileColor: Colors.purple.shade100,
                              trailing: IconButton(
                                icon: const Icon(Icons.playlist_add),
                                onPressed: () => {
                                  model.newMemberSurvey(member),
                                },
                              ),
                            ),
                          ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Recent Surveys"),
                  ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: ListTile(
                  //         title: const Text(
                  //             "Survey 1 done on Family on 22/05/22 10:40 PM"),
                  //         tileColor: Colors.red.shade100,
                  //         dense: true,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: ListTile(
                  //         title: const Text(
                  //             "Survey 2 done on Ayush on 22/05/22 10:40 PM"),
                  //         tileColor: Colors.red.shade100,
                  //         dense: true,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: ListTile(
                  //         title: const Text(
                  //             "Survey 1 done on Family on 22/05/22 10:40 PM"),
                  //         tileColor: Colors.red.shade100,
                  //         dense: true,
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
      ),
      viewModelBuilder: () => FamilyViewModel(familyId: familyId),
      onModelReady: (model) => model.initialise(),
    );
  }
}
