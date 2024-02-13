import 'package:flutter/material.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:kf_survey/util/const.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import 'family_add_vm.dart';

class FamilyAddView extends StatelessWidget {
  const FamilyAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FamilyAddViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Add new family"),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                ReactiveForm(
                  formGroup: model.family_add_form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Add Family Details"),
                              ),
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
                                        ,
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
                                        ,
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
                                        ,
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReactiveTextField(
                                  formControlName: 'last_name',
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Last Name"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReactiveTextField(
                                  formControlName: 'phone',
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Phone"),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ReactiveFormArray(
                        formArrayName: 'members',
                        builder: (context, formArray, child) => Column(
                          children: [
                            for (final control in formArray.controls)
                              AddMemberCard(
                                form: control as FormGroup,
                                onPressed: () {
                                  formArray.remove(control);
                                },
                              ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: model.addMember,
                        child: const Text("Add Member"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: model.onReset,
                            child: const Text("Reset"),
                          ),
                          mediumPaddingHorizontal,
                          ReactiveFormConsumer(
                            builder: (context, form, child) => ElevatedButton(
                              onPressed: form.valid ? model.onSubmit : null,
                              child: const Text("Submit"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (model.isBusy) const LoadingScreen(),
          ],
        ),
      ),
      viewModelBuilder: () => FamilyAddViewModel(),
      onModelReady: (model) => model.initialise(),
    );
  }
}

class AddMemberCard extends StatelessWidget {
  final FormGroup form;
  final Function() onPressed;
  const AddMemberCard(
      {required this.form, required this.onPressed, super.key, required});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Add Member details"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                key: ObjectKey(form.control('name') as FormControl<String>),
                formControl: form.control('name') as FormControl<String>,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("First Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                key: ObjectKey(form.control('age') as FormControl<int>),
                formControl: form.control('age') as FormControl<int>,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Age"),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                key: ObjectKey(form.control('phone') as FormControl<String>),
                formControl: form.control('phone') as FormControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Phone"),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveDropdownField(
                key: ObjectKey(form.control('gender') as FormControl<String>),
                formControl: form.control('gender') as FormControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Gender"),
                ),
                items: [
                  ...genders.map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
