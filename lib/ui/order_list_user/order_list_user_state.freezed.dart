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
  List<Order> get allOrders => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;
  bool get onlyNotSend => throw _privateConstructorUsedError;

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
  $Res call(
      {Customer customer,
      List<Order> allOrders,
      List<Order> orders,
      bool onlyNotSend});

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
    Object? allOrders = null,
    Object? orders = null,
    Object? onlyNotSend = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      allOrders: null == allOrders
          ? _value.allOrders
          : allOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      onlyNotSend: null == onlyNotSend
          ? _value.onlyNotSend
          : onlyNotSend // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_OrderListUserStateCopyWith<$Res>
    implements $OrderListUserStateCopyWith<$Res> {
  factory _$$_OrderListUserStateCopyWith(_$_OrderListUserState value,
          $Res Function(_$_OrderListUserState) then) =
      __$$_OrderListUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Customer customer,
      List<Order> allOrders,
      List<Order> orders,
      bool onlyNotSend});

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
    Object? allOrders = null,
    Object? orders = null,
    Object? onlyNotSend = null,
  }) {
    return _then(_$_OrderListUserState(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      allOrders: null == allOrders
          ? _value._allOrders
          : allOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      onlyNotSend: null == onlyNotSend
          ? _value.onlyNotSend
          : onlyNotSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderListUserState implements _OrderListUserState {
  const _$_OrderListUserState(
      {required this.customer,
      final List<Order> allOrders = const [],
      final List<Order> orders = const [],
      this.onlyNotSend = false})
      : _allOrders = allOrders,
        _orders = orders;

  @override
  final Customer customer;
  final List<Order> _allOrders;
  @override
  @JsonKey()
  List<Order> get allOrders {
    if (_allOrders is EqualUnmodifiableListView) return _allOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allOrders);
  }

  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final bool onlyNotSend;

  @override
  String toString() {
    return 'OrderListUserState(customer: $customer, allOrders: $allOrders, orders: $orders, onlyNotSend: $onlyNotSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderListUserState &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality()
                .equals(other._allOrders, _allOrders) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.onlyNotSend, onlyNotSend) ||
                other.onlyNotSend == onlyNotSend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      const DeepCollectionEquality().hash(_allOrders),
      const DeepCollectionEquality().hash(_orders),
      onlyNotSend);

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
      final List<Order> allOrders,
      final List<Order> orders,
      final bool onlyNotSend}) = _$_OrderListUserState;

  @override
  Customer get customer;
  @override
  List<Order> get allOrders;
  @override
  List<Order> get orders;
  @override
  bool get onlyNotSend;
  @override
  @JsonKey(ignore: true)
  _$$_OrderListUserStateCopyWith<_$_OrderListUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
