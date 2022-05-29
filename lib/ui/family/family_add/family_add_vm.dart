import 'package:firebase_auth/firebase_auth.dart';
import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.snackbar.dart';
import 'package:kf_survey/models/config.dart';
import 'package:kf_survey/util/const.dart';
import 'package:kf_survey/util/firebase_refs.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FamilyAddViewModel extends BaseViewModel {
  final _navigationService = locator.get<NavigationService>();
  final _snackbarService = locator.get<SnackbarService>();

  final family_add_form = FormGroup({
    'last_name': FormControl<String>(validators: [
      Validators.required,
    ]),
    'phone': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(10),
      Validators.maxLength(10),
      Validators.pattern(phoneRegex),
    ]),
    'district': FormControl<String>(validators: [
      Validators.required,
    ]),
    'subdivision': FormControl<String>(validators: [
      Validators.required,
    ]),
    'block': FormControl<String>(validators: [
      Validators.required,
    ]),
    'members': FormArray<Map<String, dynamic>>([]),
  });
  Config? config;
  List<District> districts = [];
  List<Subdivision> subdivisions = [];
  List<String> blocks = [];

  FormArray? get members => family_add_form.control('members') as FormArray;

  void initialise() async {
    setBusy(true);
    config = (await configDocumentRef.get()).data();
    districts = config?.districts ?? [];
    setBusy(false);
  }

  onDistrictChange(districtName) {
    subdivisions = districts
        .where((element) => element.name == districtName)
        .first
        .subdivisions;
    notifyListeners();
  }

  onSubDivisionChange(subDivisionName) {
    blocks = subdivisions
        .where((element) => element.name == subDivisionName)
        .first
        .blocks;
    notifyListeners();
  }

  void addMember() {
    members?.add(
      FormGroup({
        'name': FormControl<String>(validators: [
          Validators.required,
        ]),
        'age': FormControl<int>(validators: [
          Validators.required,
          Validators.number,
        ]),
        'phone': FormControl<String>(validators: [
          Validators.minLength(10),
          Validators.maxLength(10),
          Validators.pattern(phoneRegex),
        ]),
        'gender': FormControl<String>(validators: [
          Validators.required,
        ]),
      }),
    );
    notifyListeners();
  }

  void onSubmit() {
    setBusy(true);
    print({
      ...family_add_form.value,
      'created_by': FirebaseAuth.instance.currentUser?.uid,
    });
    try {
      familyCollection.add({
        ...family_add_form.value,
        'modified_by': [FirebaseAuth.instance.currentUser?.uid],
        'modified_on': DateTime.now().millisecondsSinceEpoch,
      });
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: "Family added successfully",
        variant: SnackbarType.success,
      );
      _navigationService.popRepeated(1);
    } catch (e) {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: "Could not add family. Please try again after some time",
        variant: SnackbarType.error,
      );
    }
  }

  void onReset() {
    family_add_form.reset();
  }
}
