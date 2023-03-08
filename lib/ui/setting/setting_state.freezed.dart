// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleState {
  GoogleSignInAccount get currentUser => throw _privateConstructorUsedError;
  drive.FileList get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleStateCopyWith<GoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleStateCopyWith<$Res> {
  factory $GoogleStateCopyWith(
          GoogleState value, $Res Function(GoogleState) then) =
      _$GoogleStateCopyWithImpl<$Res, GoogleState>;
  @useResult
  $Res call({GoogleSignInAccount currentUser, drive.FileList list});
}

/// @nodoc
class _$GoogleStateCopyWithImpl<$Res, $Val extends GoogleState>
    implements $GoogleStateCopyWith<$Res> {
  _$GoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as drive.FileList,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleStateCopyWith<$Res>
    implements $GoogleStateCopyWith<$Res> {
  factory _$$_GoogleStateCopyWith(
          _$_GoogleState value, $Res Function(_$_GoogleState) then) =
      __$$_GoogleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GoogleSignInAccount currentUser, drive.FileList list});
}

/// @nodoc
class __$$_GoogleStateCopyWithImpl<$Res>
    extends _$GoogleStateCopyWithImpl<$Res, _$_GoogleState>
    implements _$$_GoogleStateCopyWith<$Res> {
  __$$_GoogleStateCopyWithImpl(
      _$_GoogleState _value, $Res Function(_$_GoogleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = null,
    Object? list = null,
  }) {
    return _then(_$_GoogleState(
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as drive.FileList,
    ));
  }
}

/// @nodoc

class _$_GoogleState implements _GoogleState {
  const _$_GoogleState({required this.currentUser, required this.list});

  @override
  final GoogleSignInAccount currentUser;
  @override
  final drive.FileList list;

  @override
  String toString() {
    return 'GoogleState(currentUser: $currentUser, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleState &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.list, list) || other.list == list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUser, list);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleStateCopyWith<_$_GoogleState> get copyWith =>
      __$$_GoogleStateCopyWithImpl<_$_GoogleState>(this, _$identity);
}

abstract class _GoogleState implements GoogleState {
  const factory _GoogleState(
      {required final GoogleSignInAccount currentUser,
      required final drive.FileList list}) = _$_GoogleState;

  @override
  GoogleSignInAccount get currentUser;
  @override
  drive.FileList get list;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleStateCopyWith<_$_GoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingState {
  AsyncValue<GoogleState>? get googleState =>
      throw _privateConstructorUsedError;
  LoadingType get loadingType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call({AsyncValue<GoogleState>? googleState, LoadingType loadingType});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleState = freezed,
    Object? loadingType = null,
  }) {
    return _then(_value.copyWith(
      googleState: freezed == googleState
          ? _value.googleState
          : googleState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<GoogleState>?,
      loadingType: null == loadingType
          ? _value.loadingType
          : loadingType // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$_SettingStateCopyWith(
          _$_SettingState value, $Res Function(_$_SettingState) then) =
      __$$_SettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<GoogleState>? googleState, LoadingType loadingType});
}

/// @nodoc
class __$$_SettingStateCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$_SettingState>
    implements _$$_SettingStateCopyWith<$Res> {
  __$$_SettingStateCopyWithImpl(
      _$_SettingState _value, $Res Function(_$_SettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleState = freezed,
    Object? loadingType = null,
  }) {
    return _then(_$_SettingState(
      googleState: freezed == googleState
          ? _value.googleState
          : googleState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<GoogleState>?,
      loadingType: null == loadingType
          ? _value.loadingType
          : loadingType // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState({this.googleState, required this.loadingType});

  @override
  final AsyncValue<GoogleState>? googleState;
  @override
  final LoadingType loadingType;

  @override
  String toString() {
    return 'SettingState(googleState: $googleState, loadingType: $loadingType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingState &&
            (identical(other.googleState, googleState) ||
                other.googleState == googleState) &&
            (identical(other.loadingType, loadingType) ||
                other.loadingType == loadingType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, googleState, loadingType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      __$$_SettingStateCopyWithImpl<_$_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {final AsyncValue<GoogleState>? googleState,
      required final LoadingType loadingType}) = _$_SettingState;

  @override
  AsyncValue<GoogleState>? get googleState;
  @override
  LoadingType get loadingType;
  @override
  @JsonKey(ignore: true)
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
