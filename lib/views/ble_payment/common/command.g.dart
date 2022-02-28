// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CommandType _$getPubKey = const CommandType._('getPubKey');
const CommandType _$setPubKey = const CommandType._('setPubKey');
const CommandType _$setAesKey = const CommandType._('setAesKey');
const CommandType _$setAesOk = const CommandType._('setAesOk');
const CommandType _$getTxInfo = const CommandType._('getTxInfo');
const CommandType _$setTxInfo = const CommandType._('setTxInfo');
const CommandType _$setDcep = const CommandType._('setDcep');
const CommandType _$setDcepFail = const CommandType._('setDcepFail');
const CommandType _$setDcepOk = const CommandType._('setDcepOk');
const CommandType _$setRawTx = const CommandType._('setRawTx');
const CommandType _$setRawTxOk = const CommandType._('setRawTxOk');
const CommandType _$setRawTxFail = const CommandType._('setRawTxFail');

CommandType _$valueOf(String name) {
  switch (name) {
    case 'getPubKey':
      return _$getPubKey;
    case 'setPubKey':
      return _$setPubKey;
    case 'setAesKey':
      return _$setAesKey;
    case 'setAesOk':
      return _$setAesOk;
    case 'getTxInfo':
      return _$getTxInfo;
    case 'setTxInfo':
      return _$setTxInfo;
    case 'setDcep':
      return _$setDcep;
    case 'setDcepFail':
      return _$setDcepFail;
    case 'setDcepOk':
      return _$setDcepOk;
    case 'setRawTx':
      return _$setRawTx;
    case 'setRawTxOk':
      return _$setRawTxOk;
    case 'setRawTxFail':
      return _$setRawTxFail;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CommandType> _$values =
    new BuiltSet<CommandType>(const <CommandType>[
  _$getPubKey,
  _$setPubKey,
  _$setAesKey,
  _$setAesOk,
  _$getTxInfo,
  _$setTxInfo,
  _$setDcep,
  _$setDcepFail,
  _$setDcepOk,
  _$setRawTx,
  _$setRawTxOk,
  _$setRawTxFail,
]);

Serializer<CommandType> _$commandTypeSerializer = new _$CommandTypeSerializer();
Serializer<Command> _$commandSerializer = new _$CommandSerializer();

class _$CommandTypeSerializer implements PrimitiveSerializer<CommandType> {
  @override
  final Iterable<Type> types = const <Type>[CommandType];
  @override
  final String wireName = 'CommandType';

  @override
  Object serialize(Serializers serializers, CommandType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CommandType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CommandType.valueOf(serialized as String);
}

class _$CommandSerializer implements StructuredSerializer<Command> {
  @override
  final Iterable<Type> types = const [Command, _$Command];
  @override
  final String wireName = 'Command';

  @override
  Iterable<Object?> serialize(Serializers serializers, Command object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(CommandType)),
    ];
    Object? value;
    value = object.param;
    if (value != null) {
      result
        ..add('param')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Command deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommandBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(CommandType)) as CommandType;
          break;
        case 'param':
          result.param = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Command extends Command {
  @override
  final CommandType type;
  @override
  final String? param;

  factory _$Command([void Function(CommandBuilder)? updates]) =>
      (new CommandBuilder()..update(updates)).build();

  _$Command._({required this.type, this.param}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'Command', 'type');
  }

  @override
  Command rebuild(void Function(CommandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommandBuilder toBuilder() => new CommandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Command && type == other.type && param == other.param;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), param.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Command')
          ..add('type', type)
          ..add('param', param))
        .toString();
  }
}

class CommandBuilder implements Builder<Command, CommandBuilder> {
  _$Command? _$v;

  CommandType? _type;
  CommandType? get type => _$this._type;
  set type(CommandType? type) => _$this._type = type;

  String? _param;
  String? get param => _$this._param;
  set param(String? param) => _$this._param = param;

  CommandBuilder();

  CommandBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _param = $v.param;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Command other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Command;
  }

  @override
  void update(void Function(CommandBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Command build() {
    final _$result = _$v ??
        new _$Command._(
            type:
                BuiltValueNullFieldError.checkNotNull(type, 'Command', 'type'),
            param: param);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
