// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$authStateAtom =
      Atom(name: '_AuthStoreBase.authState', context: context);

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  late final _$signUpUserWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthStoreBase.signUpUserWithEmailAndPassword',
      context: context);

  @override
  Future<void> signUpUserWithEmailAndPassword(
      {required String name, required String email, required String password}) {
    return _$signUpUserWithEmailAndPasswordAsyncAction.run(() => super
        .signUpUserWithEmailAndPassword(
            name: name, email: email, password: password));
  }

  late final _$_performAuthActionAsyncAction =
      AsyncAction('_AuthStoreBase._performAuthAction', context: context);

  @override
  Future<void> _performAuthAction(
      Future<Either<Failure, UserEntity>> Function() action) {
    return _$_performAuthActionAsyncAction
        .run(() => super._performAuthAction(action));
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}
