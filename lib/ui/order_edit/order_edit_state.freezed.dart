// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderEditState {
  Customer get customer => throw _privateConstructorUsedError;
  Order get order => throw _privateConstructorUsedError;
  bool get addMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEditStateCopyWith<OrderEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEditStateCopyWith<$Res> {
  factory $OrderEditStateCopyWith(
          OrderEditState value, $Res Function(OrderEditState) then) =
      _$OrderEditStateCopyWithImpl<$Res, OrderEditState>;
  @useResult
  $Res call({Customer customer, Order order, bool addMode});

  $CustomerCopyWith<$Res> get customer;
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$OrderEditStateCopyWithImpl<$Res, $Val extends OrderEditState>
    implements $OrderEditStateCopyWith<$Res> {
  _$OrderEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? order = null,
    Object? addMode = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
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

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderEditStateCopyWith<$Res>
    implements $OrderEditStateCopyWith<$Res> {
  factory _$$_OrderEditStateCopyWith(
          _$_OrderEditState value, $Res Function(_$_OrderEditState) then) =
      __$$_OrderEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, Order order, bool addMode});

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$_OrderEditStateCopyWithImpl<$Res>
    extends _$OrderEditStateCopyWithImpl<$Res, _$_OrderEditState>
    implements _$$_OrderEditStateCopyWith<$Res> {
  __$$_OrderEditStateCopyWithImpl(
      _$_OrderEditState _value, $Res Function(_$_OrderEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? order = null,
    Object? addMode = null,
  }) {
    return _then(_$_OrderEditState(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      addMode: null == addMode
          ? _value.addMode
          : addMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderEditState implements _OrderEditState {
  const _$_OrderEditState(
      {required this.customer,
      this.order = const Order(),
      required this.addMode});

  @override
  final Customer customer;
  @override
  @JsonKey()
  final Order order;
  @override
  final bool addMode;

  @override
  String toString() {
    return 'OrderEditState(customer: $customer, order: $order, addMode: $addMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderEditState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.addMode, addMode) || other.addMode == addMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer, order, addMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderEditStateCopyWith<_$_OrderEditState> get copyWith =>
      __$$_OrderEditStateCopyWithImpl<_$_OrderEditState>(this, _$identity);
}

abstract class _OrderEditState implements OrderEditState {
  const factory _OrderEditState(
      {required final Customer customer,
      final Order order,
      required final bool addMode}) = _$_OrderEditState;

  @override
  Customer get customer;
  @override
  Order get order;
  @override
  bool get addMode;
  @override
  @JsonKey(ignore: true)
  _$$_OrderEditStateCopyWith<_$_OrderEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
