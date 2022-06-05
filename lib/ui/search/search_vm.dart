import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/models/config.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/util/firebase_refs.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel {
  Config? config;
  List<District> districts = [];
  List<Subdivision> subdivisions = [];
  List<String> blocks = [];
  List<DocumentSnapshot<Family>> families = [];
  List<MemberDoc> members = [];
  String selectedFamilyId = '';
  FormGroup form = fb.group({
    'district': [''],
    'subdivision': [''],
    'block': [''],
    'selected_family': [''],
  });

  final _navigationService = locator.get<NavigationService>();

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

  onBlockChange(block) async {
    setBusy(true);
    families = (await familyCollection
            .where('block', isEqualTo: block)
            .withConverter<Family>(
              fromFirestore: (snapshot, _) => Family.fromJson(snapshot.data()!),
              toFirestore: (family, _) => family.toJson(),
            )
            .get())
        .docs;

    members = [];
    for (var doc in families.where((element) => element.data() != null)) {
      members.addAll(
          doc.data()!.members.map((member) => MemberDoc(member, doc.id)));
    }
    setBusy(false);
  }

  void onFamilySelected(DocumentSnapshot<Family>? selectedFamily) {
    if (selectedFamily != null) {
      selectedFamilyId = selectedFamily.id;
      notifyListeners();
    }
  }

  void onMemberSelected(MemberDoc? memberDoc) {
    if (memberDoc != null) {
      selectedFamilyId = memberDoc.familyId;
      notifyListeners();
    }
  }

  onSubmit() {
    _navigationService.replaceWith(
      Routes.familyView,
      arguments: FamilyViewArguments(familyId: selectedFamilyId),
    );
  }
}

class MemberDoc {
  final Member member;
  final String familyId;

  MemberDoc(this.member, this.familyId);
}
