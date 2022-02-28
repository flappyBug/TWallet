// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HealthCertificationStore on _HealthCertificationStore, Store {
  Computed<bool>? _$isBoundCertComputed;

  @override
  bool get isBoundCert =>
      (_$isBoundCertComputed ??= Computed<bool>(() => super.isBoundCert,
              name: '_HealthCertificationStore.isBoundCert'))
          .value;
  Computed<bool>? _$isHealthyComputed;

  @override
  bool get isHealthy =>
      (_$isHealthyComputed ??= Computed<bool>(() => super.isHealthy,
              name: '_HealthCertificationStore.isHealthy'))
          .value;

  final _$currentTokenAtom =
      Atom(name: '_HealthCertificationStore.currentToken');

  @override
  Optional<HealthCertificationToken> get currentToken {
    _$currentTokenAtom.reportRead();
    return super.currentToken;
  }

  @override
  set currentToken(Optional<HealthCertificationToken> value) {
    _$currentTokenAtom.reportWrite(value, super.currentToken, () {
      super.currentToken = value;
    });
  }

  final _$bindHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.bindHealthCert');

  @override
  Future<Optional<HealthCertificationToken>> bindHealthCert(String did,
      String phone, double temperature, String contact, String symptoms) {
    return _$bindHealthCertAsyncAction.run(
        () => super.bindHealthCert(did, phone, temperature, contact, symptoms));
  }

  final _$fetchHealthCertByDIDAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchHealthCertByDID');

  @override
  Future<dynamic> fetchHealthCertByDID(String did) {
    return _$fetchHealthCertByDIDAsyncAction
        .run(() => super.fetchHealthCertByDID(did));
  }

  final _$fetchLatestHealthCertAsyncAction =
      AsyncAction('_HealthCertificationStore.fetchLatestHealthCert');

  @override
  Future<Optional<HealthCertificationToken>> fetchLatestHealthCert(String did) {
    return _$fetchLatestHealthCertAsyncAction
        .run(() => super.fetchLatestHealthCert(did));
  }

  @override
  String toString() {
    return '''
currentToken: ${currentToken},
isBoundCert: ${isBoundCert},
isHealthy: ${isHealthy}
    ''';
  }
}
