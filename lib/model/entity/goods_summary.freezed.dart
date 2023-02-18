// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goods_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoodsSummary _$GoodsSummaryFromJson(Map<String, dynamic> json) {
  return _GoodsSummary.fromJson(json);
}

/// @nodoc
mixin _$GoodsSummary {
  String get goodsName => throw _privateConstructorUsedError;
  int get totalGoodsPrice => throw _privateConstructorUsedError;
  int get totalGoodsAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoodsSummaryCopyWith<GoodsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodsSummaryCopyWith<$Res> {
  factory $GoodsSummaryCopyWith(
          GoodsSummary value, $Res Function(GoodsSummary) then) =
      _$GoodsSummaryCopyWithImpl<$Res, GoodsSummary>;
  @useResult
  $Res call({String goodsName, int totalGoodsPrice, int totalGoodsAmount});
}

/// @nodoc
class _$GoodsSummaryCopyWithImpl<$Res, $Val extends GoodsSummary>
    implements $GoodsSummaryCopyWith<$Res> {
  _$GoodsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodsName = null,
    Object? totalGoodsPrice = null,
    Object? totalGoodsAmount = null,
  }) {
    return _then(_value.copyWith(
      goodsName: null == goodsName
          ? _value.goodsName
          : goodsName // ignore: cast_nullable_to_non_nullable
              as String,
      totalGoodsPrice: null == totalGoodsPrice
          ? _value.totalGoodsPrice
          : totalGoodsPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalGoodsAmount: null == totalGoodsAmount
          ? _value.totalGoodsAmount
          : totalGoodsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoodsSummaryCopyWith<$Res>
    implements $GoodsSummaryCopyWith<$Res> {
  factory _$$_GoodsSummaryCopyWith(
          _$_GoodsSummary value, $Res Function(_$_GoodsSummary) then) =
      __$$_GoodsSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String goodsName, int totalGoodsPrice, int totalGoodsAmount});
}

/// @nodoc
class __$$_GoodsSummaryCopyWithImpl<$Res>
    extends _$GoodsSummaryCopyWithImpl<$Res, _$_GoodsSummary>
    implements _$$_GoodsSummaryCopyWith<$Res> {
  __$$_GoodsSummaryCopyWithImpl(
      _$_GoodsSummary _value, $Res Function(_$_GoodsSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodsName = null,
    Object? totalGoodsPrice = null,
    Object? totalGoodsAmount = null,
  }) {
    return _then(_$_GoodsSummary(
      goodsName: null == goodsName
          ? _value.goodsName
          : goodsName // ignore: cast_nullable_to_non_nullable
              as String,
      totalGoodsPrice: null == totalGoodsPrice
          ? _value.totalGoodsPrice
          : totalGoodsPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalGoodsAmount: null == totalGoodsAmount
          ? _value.totalGoodsAmount
          : totalGoodsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoodsSummary implements _GoodsSummary {
  const _$_GoodsSummary(
      {this.goodsName = '',
      this.totalGoodsPrice = 0,
      this.totalGoodsAmount = 0});

  factory _$_GoodsSummary.fromJson(Map<String, dynamic> json) =>
      _$$_GoodsSummaryFromJson(json);

  @override
  @JsonKey()
  final String goodsName;
  @override
  @JsonKey()
  final int totalGoodsPrice;
  @override
  @JsonKey()
  final int totalGoodsAmount;

  @override
  String toString() {
    return 'GoodsSummary(goodsName: $goodsName, totalGoodsPrice: $totalGoodsPrice, totalGoodsAmount: $totalGoodsAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoodsSummary &&
            (identical(other.goodsName, goodsName) ||
                other.goodsName == goodsName) &&
            (identical(other.totalGoodsPrice, totalGoodsPrice) ||
                other.totalGoodsPrice == totalGoodsPrice) &&
            (identical(other.totalGoodsAmount, totalGoodsAmount) ||
                other.totalGoodsAmount == totalGoodsAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, goodsName, totalGoodsPrice, totalGoodsAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoodsSummaryCopyWith<_$_GoodsSummary> get copyWith =>
      __$$_GoodsSummaryCopyWithImpl<_$_GoodsSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoodsSummaryToJson(
      this,
    );
  }
}

abstract class _GoodsSummary implements GoodsSummary {
  const factory _GoodsSummary(
      {final String goodsName,
      final int totalGoodsPrice,
      final int totalGoodsAmount}) = _$_GoodsSummary;

  factory _GoodsSummary.fromJson(Map<String, dynamic> json) =
      _$_GoodsSummary.fromJson;

  @override
  String get goodsName;
  @override
  int get totalGoodsPrice;
  @override
  int get totalGoodsAmount;
  @override
  @JsonKey(ignore: true)
  _$$_GoodsSummaryCopyWith<_$_GoodsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
