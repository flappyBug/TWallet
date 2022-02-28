// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decentralized_identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DecentralizedIdentity> _$decentralizedIdentitySerializer =
    new _$DecentralizedIdentitySerializer();

class _$DecentralizedIdentitySerializer
    implements StructuredSerializer<DecentralizedIdentity> {
  @override
  final Iterable<Type> types = const [
    DecentralizedIdentity,
    _$DecentralizedIdentity
  ];
  @override
  final String wireName = 'DecentralizedIdentity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DecentralizedIdentity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'dappId',
      serializers.serialize(object.dappId,
          specifiedType: const FullType(String)),
      'profileInfo',
      serializers.serialize(object.profileInfo,
          specifiedType: const FullType(ProfileInfo)),
      'accountInfo',
      serializers.serialize(object.accountInfo,
          specifiedType: const FullType(AccountInfo)),
      'healthInfo',
      serializers.serialize(object.healthInfo,
          specifiedType: const FullType(HealthInfo)),
    ];
    Object? value;
    value = object.extra;
    if (value != null) {
      result
        ..add('extra')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DecentralizedIdentity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DecentralizedIdentityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dappId':
          result.dappId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profileInfo':
          result.profileInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileInfo))! as ProfileInfo);
          break;
        case 'accountInfo':
          result.accountInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccountInfo))! as AccountInfo);
          break;
        case 'healthInfo':
          result.healthInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(HealthInfo))! as HealthInfo);
          break;
        case 'extra':
          result.extra = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DecentralizedIdentity extends DecentralizedIdentity {
  @override
  final String id;
  @override
  final String dappId;
  @override
  final ProfileInfo profileInfo;
  @override
  final AccountInfo accountInfo;
  @override
  final HealthInfo healthInfo;
  @override
  final String? extra;
  String? __address;
  DID? __did;

  factory _$DecentralizedIdentity(
          [void Function(DecentralizedIdentityBuilder)? updates]) =>
      (new DecentralizedIdentityBuilder()..update(updates)).build();

  _$DecentralizedIdentity._(
      {required this.id,
      required this.dappId,
      required this.profileInfo,
      required this.accountInfo,
      required this.healthInfo,
      this.extra})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'DecentralizedIdentity', 'id');
    BuiltValueNullFieldError.checkNotNull(
        dappId, 'DecentralizedIdentity', 'dappId');
    BuiltValueNullFieldError.checkNotNull(
        profileInfo, 'DecentralizedIdentity', 'profileInfo');
    BuiltValueNullFieldError.checkNotNull(
        accountInfo, 'DecentralizedIdentity', 'accountInfo');
    BuiltValueNullFieldError.checkNotNull(
        healthInfo, 'DecentralizedIdentity', 'healthInfo');
  }

  @override
  String get address => __address ??= super.address;

  @override
  DID get did => __did ??= super.did;

  @override
  DecentralizedIdentity rebuild(
          void Function(DecentralizedIdentityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DecentralizedIdentityBuilder toBuilder() =>
      new DecentralizedIdentityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DecentralizedIdentity &&
        id == other.id &&
        dappId == other.dappId &&
        profileInfo == other.profileInfo &&
        accountInfo == other.accountInfo &&
        healthInfo == other.healthInfo &&
        extra == other.extra;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), dappId.hashCode),
                    profileInfo.hashCode),
                accountInfo.hashCode),
            healthInfo.hashCode),
        extra.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DecentralizedIdentity')
          ..add('id', id)
          ..add('dappId', dappId)
          ..add('profileInfo', profileInfo)
          ..add('accountInfo', accountInfo)
          ..add('healthInfo', healthInfo)
          ..add('extra', extra))
        .toString();
  }
}

class DecentralizedIdentityBuilder
    implements Builder<DecentralizedIdentity, DecentralizedIdentityBuilder> {
  _$DecentralizedIdentity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _dappId;
  String? get dappId => _$this._dappId;
  set dappId(String? dappId) => _$this._dappId = dappId;

  ProfileInfoBuilder? _profileInfo;
  ProfileInfoBuilder get profileInfo =>
      _$this._profileInfo ??= new ProfileInfoBuilder();
  set profileInfo(ProfileInfoBuilder? profileInfo) =>
      _$this._profileInfo = profileInfo;

  AccountInfoBuilder? _accountInfo;
  AccountInfoBuilder get accountInfo =>
      _$this._accountInfo ??= new AccountInfoBuilder();
  set accountInfo(AccountInfoBuilder? accountInfo) =>
      _$this._accountInfo = accountInfo;

  HealthInfoBuilder? _healthInfo;
  HealthInfoBuilder get healthInfo =>
      _$this._healthInfo ??= new HealthInfoBuilder();
  set healthInfo(HealthInfoBuilder? healthInfo) =>
      _$this._healthInfo = healthInfo;

  String? _extra;
  String? get extra => _$this._extra;
  set extra(String? extra) => _$this._extra = extra;

  DecentralizedIdentityBuilder();

  DecentralizedIdentityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _dappId = $v.dappId;
      _profileInfo = $v.profileInfo.toBuilder();
      _accountInfo = $v.accountInfo.toBuilder();
      _healthInfo = $v.healthInfo.toBuilder();
      _extra = $v.extra;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DecentralizedIdentity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DecentralizedIdentity;
  }

  @override
  void update(void Function(DecentralizedIdentityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DecentralizedIdentity build() {
    _$DecentralizedIdentity _$result;
    try {
      _$result = _$v ??
          new _$DecentralizedIdentity._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'DecentralizedIdentity', 'id'),
              dappId: BuiltValueNullFieldError.checkNotNull(
                  dappId, 'DecentralizedIdentity', 'dappId'),
              profileInfo: profileInfo.build(),
              accountInfo: accountInfo.build(),
              healthInfo: healthInfo.build(),
              extra: extra);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'profileInfo';
        profileInfo.build();
        _$failedField = 'accountInfo';
        accountInfo.build();
        _$failedField = 'healthInfo';
        healthInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DecentralizedIdentity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
