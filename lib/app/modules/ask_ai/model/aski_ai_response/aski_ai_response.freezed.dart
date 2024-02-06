// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aski_ai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AskiAiResponse _$AskiAiResponseFromJson(Map<String, dynamic> json) {
  return _AskiAiResponse.fromJson(json);
}

/// @nodoc
mixin _$AskiAiResponse {
  List<Place>? get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AskiAiResponseCopyWith<AskiAiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AskiAiResponseCopyWith<$Res> {
  factory $AskiAiResponseCopyWith(
          AskiAiResponse value, $Res Function(AskiAiResponse) then) =
      _$AskiAiResponseCopyWithImpl<$Res, AskiAiResponse>;
  @useResult
  $Res call({List<Place>? places});
}

/// @nodoc
class _$AskiAiResponseCopyWithImpl<$Res, $Val extends AskiAiResponse>
    implements $AskiAiResponseCopyWith<$Res> {
  _$AskiAiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_value.copyWith(
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AskiAiResponseCopyWith<$Res>
    implements $AskiAiResponseCopyWith<$Res> {
  factory _$$_AskiAiResponseCopyWith(
          _$_AskiAiResponse value, $Res Function(_$_AskiAiResponse) then) =
      __$$_AskiAiResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Place>? places});
}

/// @nodoc
class __$$_AskiAiResponseCopyWithImpl<$Res>
    extends _$AskiAiResponseCopyWithImpl<$Res, _$_AskiAiResponse>
    implements _$$_AskiAiResponseCopyWith<$Res> {
  __$$_AskiAiResponseCopyWithImpl(
      _$_AskiAiResponse _value, $Res Function(_$_AskiAiResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_$_AskiAiResponse(
      places: freezed == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AskiAiResponse implements _AskiAiResponse {
  _$_AskiAiResponse({final List<Place>? places}) : _places = places;

  factory _$_AskiAiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AskiAiResponseFromJson(json);

  final List<Place>? _places;
  @override
  List<Place>? get places {
    final value = _places;
    if (value == null) return null;
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AskiAiResponse(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AskiAiResponse &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AskiAiResponseCopyWith<_$_AskiAiResponse> get copyWith =>
      __$$_AskiAiResponseCopyWithImpl<_$_AskiAiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AskiAiResponseToJson(
      this,
    );
  }
}

abstract class _AskiAiResponse implements AskiAiResponse {
  factory _AskiAiResponse({final List<Place>? places}) = _$_AskiAiResponse;

  factory _AskiAiResponse.fromJson(Map<String, dynamic> json) =
      _$_AskiAiResponse.fromJson;

  @override
  List<Place>? get places;
  @override
  @JsonKey(ignore: true)
  _$$_AskiAiResponseCopyWith<_$_AskiAiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
