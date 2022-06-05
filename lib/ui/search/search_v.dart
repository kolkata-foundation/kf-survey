import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import 'search_vm.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: (model.isBusy)
            ? const LoadingScreen(opacity: 1.0)
            : ReactiveForm(
                formGroup: model.form,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveDropdownField(
                        formControlName: 'district',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("District"),
                        ),
                        items: [
                          ...model.districts
                              .map(
                                (district) => DropdownMenuItem(
                                  value: district.name,
                                  child: Text(district.name),
                                ),
                              )
                              .toList(),
                        ],
                        onChanged: model.onDistrictChange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveDropdownField(
                        formControlName: 'subdivision',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Subdivision"),
                        ),
                        items: [
                          ...model.subdivisions
                              .map(
                                (subdivision) => DropdownMenuItem(
                                  value: subdivision.name,
                                  child: Text(subdivision.name),
                                ),
                              )
                              .toList(),
                        ],
                        onChanged: model.onSubDivisionChange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveDropdownField(
                        formControlName: 'block',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Block"),
                        ),
                        items: [
                          ...model.blocks
                              .map(
                                (block) => DropdownMenuItem(
                                  value: block,
                                  child: Text(block),
                                ),
                              )
                              .toList(),
                        ],
                        onChanged: model.onBlockChange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<DocumentSnapshot<Family>>(
                        asyncItems: (filter) async {
                          print(filter);
                          return model.families
                              .where((element) {
                                Family? family = element.data();

                                // If no filter set, show all
                                if (filter.isEmpty) return true;

                                if (family == null) return false;

                                // If any substring matches
                                for (var filterSubstr in filter.split(' ')) {
                                  if (family.last_name.contains(filterSubstr)) {
                                    return true;
                                  }
                                  if (family.phone.contains(filterSubstr)) {
                                    return true;
                                  }
                                }

                                return false;
                              })
                              .where((element) => element.data() != null)
                              .toList();
                        },
                        compareFn: (a, b) => a.id == b.id,
                        popupProps: PopupProps.bottomSheet(
                          isFilterOnline: true,
                          showSearchBox: true,
                          itemBuilder: (context, familySnapshot, _) {
                            Family? family = familySnapshot.data();
                            if (family == null) return Container();
                            return ListTile(
                              title: Text(family.last_name),
                              subtitle: Text(
                                  family.members.map((e) => e.name).join(', ')),
                              trailing: Text(family.phone),
                              leading: const Icon(Icons.people),
                            );
                          },
                        ),
                        dropdownSearchDecoration: const InputDecoration(
                          label: Text("Search"),
                          border: OutlineInputBorder(),
                        ),
                        itemAsString: (document) => document.data()!.last_name,
                        onChanged: model.onFamilySelected,
                      ),
                    ),
                    if (model.selectedFamilyId.isNotEmpty)
                      Center(
                        child: ElevatedButton(
                            onPressed: model.onSubmit,
                            child: const Text("Go to family")),
                      ),
                  ],
                ),
              ),
      ),
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model) => model.initialise(),
    );
  }
}
