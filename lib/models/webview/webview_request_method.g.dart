// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_request_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebviewRequestMethod _$quitApp = const WebviewRequestMethod._('quitApp');
const WebviewRequestMethod _$createAccount =
    const WebviewRequestMethod._('createAccount');
const WebviewRequestMethod _$qrCode = const WebviewRequestMethod._('qrCode');
const WebviewRequestMethod _$signTransaction =
    const WebviewRequestMethod._('signTransaction');
const WebviewRequestMethod _$sendTransaction =
    const WebviewRequestMethod._('sendTransaction');
const WebviewRequestMethod _$getRootKey =
    const WebviewRequestMethod._('getRootKey');
const WebviewRequestMethod _$setStatusBarMode =
    const WebviewRequestMethod._('setStatusBarMode');
const WebviewRequestMethod _$setStatusBarBackgroundColor =
    const WebviewRequestMethod._('setStatusBarBackgroundColor');
const WebviewRequestMethod _$peekAccount =
    const WebviewRequestMethod._('peekAccount');
const WebviewRequestMethod _$getAccounts =
    const WebviewRequestMethod._('getAccounts');
const WebviewRequestMethod _$getAccountById =
    const WebviewRequestMethod._('getAccountById');
const WebviewRequestMethod _$getAccountByIds =
    const WebviewRequestMethod._('getAccountByIds');
const WebviewRequestMethod _$validatePin =
    const WebviewRequestMethod._('validatePin');

WebviewRequestMethod _$valueOf(String name) {
  switch (name) {
    case 'quitApp':
      return _$quitApp;
    case 'createAccount':
      return _$createAccount;
    case 'qrCode':
      return _$qrCode;
    case 'signTransaction':
      return _$signTransaction;
    case 'sendTransaction':
      return _$sendTransaction;
    case 'getRootKey':
      return _$getRootKey;
    case 'setStatusBarMode':
      return _$setStatusBarMode;
    case 'setStatusBarBackgroundColor':
      return _$setStatusBarBackgroundColor;
    case 'peekAccount':
      return _$peekAccount;
    case 'getAccounts':
      return _$getAccounts;
    case 'getAccountById':
      return _$getAccountById;
    case 'getAccountByIds':
      return _$getAccountByIds;
    case 'validatePin':
      return _$validatePin;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WebviewRequestMethod> _$values =
    new BuiltSet<WebviewRequestMethod>(const <WebviewRequestMethod>[
  _$quitApp,
  _$createAccount,
  _$qrCode,
  _$signTransaction,
  _$sendTransaction,
  _$getRootKey,
  _$setStatusBarMode,
  _$setStatusBarBackgroundColor,
  _$peekAccount,
  _$getAccounts,
  _$getAccountById,
  _$getAccountByIds,
  _$validatePin,
]);

Serializer<WebviewRequestMethod> _$webviewRequestMethodSerializer =
    new _$WebviewRequestMethodSerializer();

class _$WebviewRequestMethodSerializer
    implements PrimitiveSerializer<WebviewRequestMethod> {
  @override
  final Iterable<Type> types = const <Type>[WebviewRequestMethod];
  @override
  final String wireName = 'WebviewRequestMethod';

  @override
  Object serialize(Serializers serializers, WebviewRequestMethod object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WebviewRequestMethod deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WebviewRequestMethod.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
