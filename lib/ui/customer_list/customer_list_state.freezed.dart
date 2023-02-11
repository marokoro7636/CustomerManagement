// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerListState {
  List<Customer> get customers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerListStateCopyWith<CustomerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerListStateCopyWith<$Res> {
  factory $CustomerListStateCopyWith(
          CustomerListState value, $Res Function(CustomerListState) then) =
      _$CustomerListStateCopyWithImpl<$Res, CustomerListState>;
  @useResult
  $Res call({List<Customer> customers});
}

/// @nodoc
class _$CustomerListStateCopyWithImpl<$Res, $Val extends CustomerListState>
    implements $CustomerListStateCopyWith<$Res> {
  _$CustomerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
  }) {
    return _then(_value.copyWith(
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerListStateCopyWith<$Res>
    implements $CustomerListStateCopyWith<$Res> {
  factory _$$_CustomerListStateCopyWith(_$_CustomerListState value,
          $Res Function(_$_CustomerListState) then) =
      __$$_CustomerListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Customer> customers});
}

/// @nodoc
class __$$_CustomerListStateCopyWithImpl<$Res>
    extends _$CustomerListStateCopyWithImpl<$Res, _$_CustomerListState>
    implements _$$_CustomerListStateCopyWith<$Res> {
  __$$_CustomerListStateCopyWithImpl(
      _$_CustomerListState _value, $Res Function(_$_CustomerListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
  }) {
    return _then(_$_CustomerListState(
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class _$_CustomerListState implements _CustomerListState {
  const _$_CustomerListState({final List<Customer> customers = const []})
      : _customers = customers;

  final List<Customer> _customers;
  @override
  @JsonKey()
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  String toString() {
    return 'CustomerListState(customers: $customers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerListState &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_customers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerListStateCopyWith<_$_CustomerListState> get copyWith =>
      __$$_CustomerListStateCopyWithImpl<_$_CustomerListState>(
          this, _$identity);
}

abstract class _CustomerListState implements CustomerListState {
  const factory _CustomerListState({final List<Customer> customers}) =
      _$_CustomerListState;

  @override
  List<Customer> get customers;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerListStateCopyWith<_$_CustomerListState> get copyWith =>
      throw _privateConstructorUsedError;
}
