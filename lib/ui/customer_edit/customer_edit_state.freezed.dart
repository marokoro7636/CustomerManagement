// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerEditState {
  Customer get customer => throw _privateConstructorUsedError;
  bool get addMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerEditStateCopyWith<CustomerEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEditStateCopyWith<$Res> {
  factory $CustomerEditStateCopyWith(
          CustomerEditState value, $Res Function(CustomerEditState) then) =
      _$CustomerEditStateCopyWithImpl<$Res, CustomerEditState>;
  @useResult
  $Res call({Customer customer, bool addMode});

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$CustomerEditStateCopyWithImpl<$Res, $Val extends CustomerEditState>
    implements $CustomerEditStateCopyWith<$Res> {
  _$CustomerEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? addMode = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      addMode: null == addMode
          ? _value.addMode
          : addMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerEditStateCopyWith<$Res>
    implements $CustomerEditStateCopyWith<$Res> {
  factory _$$_CustomerEditStateCopyWith(_$_CustomerEditState value,
          $Res Function(_$_CustomerEditState) then) =
      __$$_CustomerEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, bool addMode});

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$_CustomerEditStateCopyWithImpl<$Res>
    extends _$CustomerEditStateCopyWithImpl<$Res, _$_CustomerEditState>
    implements _$$_CustomerEditStateCopyWith<$Res> {
  __$$_CustomerEditStateCopyWithImpl(
      _$_CustomerEditState _value, $Res Function(_$_CustomerEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? addMode = null,
  }) {
    return _then(_$_CustomerEditState(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      addMode: null == addMode
          ? _value.addMode
          : addMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CustomerEditState implements _CustomerEditState {
  const _$_CustomerEditState({required this.customer, required this.addMode});

  @override
  final Customer customer;
  @override
  final bool addMode;

  @override
  String toString() {
    return 'CustomerEditState(customer: $customer, addMode: $addMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerEditState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.addMode, addMode) || other.addMode == addMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer, addMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerEditStateCopyWith<_$_CustomerEditState> get copyWith =>
      __$$_CustomerEditStateCopyWithImpl<_$_CustomerEditState>(
          this, _$identity);
}

abstract class _CustomerEditState implements CustomerEditState {
  const factory _CustomerEditState(
      {required final Customer customer,
      required final bool addMode}) = _$_CustomerEditState;

  @override
  Customer get customer;
  @override
  bool get addMode;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerEditStateCopyWith<_$_CustomerEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
