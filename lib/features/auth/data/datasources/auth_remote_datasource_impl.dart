import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data.dart';

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({required this.firestore, required this.auth});
  
  @override
  Future<void> createUserOnDatabase({required String id, required String name, required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCurrentUserData() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginWithEmailAndPassword({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({required String name, required String email, required String password}) {
    throw UnimplementedError();
  }
}