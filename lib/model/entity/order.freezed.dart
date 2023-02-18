// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  String get goodsName => throw _privateConstructorUsedError;
  int get goodsPrice => throw _privateConstructorUsedError;
  int get goodsAmount => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get orderDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get sendDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int id,
      int customerId,
      String goodsName,
      int goodsPrice,
      int goodsAmount,
      @DateTimeConverter() DateTime? orderDate,
      @DateTimeConverter() DateTime? sendDate});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? goodsName = null,
    Object? goodsPrice = null,
    Object? goodsAmount = null,
    Object? orderDate = freezed,
    Object? sendDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      goodsName: null == goodsName
          ? _value.goodsName
          : goodsName // ignore: cast_nullable_to_non_nullable
              as String,
      goodsPrice: null == goodsPrice
          ? _value.goodsPrice
          : goodsPrice // ignore: cast_nullable_to_non_nullable
              as int,
      goodsAmount: null == goodsAmount
          ? _value.goodsAmount
          : goodsAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sendDate: freezed == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int customerId,
      String goodsName,
      int goodsPrice,
      int goodsAmount,
      @DateTimeConverter() DateTime? orderDate,
      @DateTimeConverter() DateTime? sendDate});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? goodsName = null,
    Object? goodsPrice = null,
    Object? goodsAmount = null,
    Object? orderDate = freezed,
    Object? sendDate = freezed,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      goodsName: null == goodsName
          ? _value.goodsName
          : goodsName // ignore: cast_nullable_to_non_nullable
              as String,
      goodsPrice: null == goodsPrice
          ? _value.goodsPrice
          : goodsPrice // ignore: cast_nullable_to_non_nullable
              as int,
      goodsAmount: null == goodsAmount
          ? _value.goodsAmount
          : goodsAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sendDate: freezed == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  const _$_Order(
      {this.id = 0,
      this.customerId = 0,
      this.goodsName = '',
      this.goodsPrice = 0,
      this.goodsAmount = 0,
      @DateTimeConverter() this.orderDate,
      @DateTimeConverter() this.sendDate});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int customerId;
  @override
  @JsonKey()
  final String goodsName;
  @override
  @JsonKey()
  final int goodsPrice;
  @override
  @JsonKey()
  final int goodsAmount;
  @override
  @DateTimeConverter()
  final DateTime? orderDate;
  @override
  @DateTimeConverter()
  final DateTime? sendDate;

  @override
  String toString() {
    return 'Order(id: $id, customerId: $customerId, goodsName: $goodsName, goodsPrice: $goodsPrice, goodsAmount: $goodsAmount, orderDate: $orderDate, sendDate: $sendDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.goodsName, goodsName) ||
                other.goodsName == goodsName) &&
            (identical(other.goodsPrice, goodsPrice) ||
                other.goodsPrice == goodsPrice) &&
            (identical(other.goodsAmount, goodsAmount) ||
                other.goodsAmount == goodsAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.sendDate, sendDate) ||
                other.sendDate == sendDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, customerId, goodsName,
      goodsPrice, goodsAmount, orderDate, sendDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {final int id,
      final int customerId,
      final String goodsName,
      final int goodsPrice,
      final int goodsAmount,
      @DateTimeConverter() final DateTime? orderDate,
      @DateTimeConverter() final DateTime? sendDate}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int get id;
  @override
  int get customerId;
  @override
  String get goodsName;
  @override
  int get goodsPrice;
  @override
  int get goodsAmount;
  @override
  @DateTimeConverter()
  DateTime? get orderDate;
  @override
  @DateTimeConverter()
  DateTime? get sendDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
