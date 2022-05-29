import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kf_survey/models/config.dart';

final familyCollection = FirebaseFirestore.instance.collection('family');
get currentUserUid => FirebaseAuth.instance.currentUser?.uid;

final configDocumentRef = FirebaseFirestore.instance
    .collection('config')
    .doc('Tt2JVi4SPH7GB7MA2UTK')
    .withConverter<Config>(
        fromFirestore: (snapshot, _) => Config.fromJson(snapshot.data()!),
        toFirestore: (config, _) => config.toJson());

final surveyCollection = FirebaseFirestore.instance.collection('survey');
