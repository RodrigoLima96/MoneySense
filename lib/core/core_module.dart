import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    // store
    i.addLazySingleton(() => AppUserStore());

    // firebase
    i.addLazySingleton(() => FirebaseFirestore.instance);
    i.addLazySingleton(() => FirebaseAuth.instanceFor(app: Firebase.app()));

    // connection checker
    i.add(() => InternetConnection());
    i.add<IConnectionChecker>(
        () => ConnectionCheckerImpl(intertConnection: i()));
  }
}
