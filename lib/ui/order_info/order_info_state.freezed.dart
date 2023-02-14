// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderInfoState {
  Customer get customer => throw _privateConstructorUsedError;
  Order get order => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderInfoStateCopyWith<OrderInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInfoStateCopyWith<$Res> {
  factory $OrderInfoStateCopyWith(
          OrderInfoState value, $Res Function(OrderInfoState) then) =
      _$OrderInfoStateCopyWithImpl<$Res, OrderInfoState>;
  @useResult
  $Res call({Customer customer, Order order});

  $CustomerCopyWith<$Res> get customer;
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$OrderInfoStateCopyWithImpl<$Res, $Val extends OrderInfoState>
    implements $OrderInfoStateCopyWith<$Res> {
  _$OrderInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? order = null,
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
abstract class _$$_OrderInfoStateCopyWith<$Res>
    implements $OrderInfoStateCopyWith<$Res> {
  factory _$$_OrderInfoStateCopyWith(
          _$_OrderInfoState value, $Res Function(_$_OrderInfoState) then) =
      __$$_OrderInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, Order order});

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$_OrderInfoStateCopyWithImpl<$Res>
    extends _$OrderInfoStateCopyWithImpl<$Res, _$_OrderInfoState>
    implements _$$_OrderInfoStateCopyWith<$Res> {
  __$$_OrderInfoStateCopyWithImpl(
      _$_OrderInfoState _value, $Res Function(_$_OrderInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? order = null,
  }) {
    return _then(_$_OrderInfoState(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$_OrderInfoState implements _OrderInfoState {
  const _$_OrderInfoState({required this.customer, required this.order});

  @override
  final Customer customer;
  @override
  final Order order;

  @override
  String toString() {
    return 'OrderInfoState(customer: $customer, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderInfoState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderInfoStateCopyWith<_$_OrderInfoState> get copyWith =>
      __$$_OrderInfoStateCopyWithImpl<_$_OrderInfoState>(this, _$identity);
}

abstract class _OrderInfoState implements OrderInfoState {
  const factory _OrderInfoState(
      {required final Customer customer,
      required final Order order}) = _$_OrderInfoState;

  @override
  Customer get customer;
  @override
  Order get order;
  @override
  @JsonKey(ignore: true)
  _$$_OrderInfoStateCopyWith<_$_OrderInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
