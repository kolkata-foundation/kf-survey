import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final familyCollection = FirebaseFirestore.instance.collection('family');
get currentUserUid => FirebaseAuth.instance.currentUser?.uid;
