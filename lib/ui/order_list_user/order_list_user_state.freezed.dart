// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderListUserState {
  Customer get customer => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderListUserStateCopyWith<OrderListUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListUserStateCopyWith<$Res> {
  factory $OrderListUserStateCopyWith(
          OrderListUserState value, $Res Function(OrderListUserState) then) =
      _$OrderListUserStateCopyWithImpl<$Res, OrderListUserState>;
  @useResult
  $Res call({Customer customer, List<Order> orders});

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$OrderListUserStateCopyWithImpl<$Res, $Val extends OrderListUserState>
    implements $OrderListUserStateCopyWith<$Res> {
  _$OrderListUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
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
abstract class _$$_OrderListUserStateCopyWith<$Res>
    implements $OrderListUserStateCopyWith<$Res> {
  factory _$$_OrderListUserStateCopyWith(_$_OrderListUserState value,
          $Res Function(_$_OrderListUserState) then) =
      __$$_OrderListUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, List<Order> orders});

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$_OrderListUserStateCopyWithImpl<$Res>
    extends _$OrderListUserStateCopyWithImpl<$Res, _$_OrderListUserState>
    implements _$$_OrderListUserStateCopyWith<$Res> {
  __$$_OrderListUserStateCopyWithImpl(
      _$_OrderListUserState _value, $Res Function(_$_OrderListUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? orders = null,
  }) {
    return _then(_$_OrderListUserState(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$_OrderListUserState implements _OrderListUserState {
  const _$_OrderListUserState(
      {required this.customer, final List<Order> orders = const []})
      : _orders = orders;

  @override
  final Customer customer;
  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrderListUserState(customer: $customer, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderListUserState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customer, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderListUserStateCopyWith<_$_OrderListUserState> get copyWith =>
      __$$_OrderListUserStateCopyWithImpl<_$_OrderListUserState>(
          this, _$identity);
}

abstract class _OrderListUserState implements OrderListUserState {
  const factory _OrderListUserState(
      {required final Customer customer,
      final List<Order> orders}) = _$_OrderListUserState;

  @override
  Customer get customer;
  @override
  List<Order> get orders;
  @override
  @JsonKey(ignore: true)
  _$$_OrderListUserStateCopyWith<_$_OrderListUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
