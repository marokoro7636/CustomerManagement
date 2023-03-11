// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_sales_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnualSalesState _$AnnualSalesStateFromJson(Map<String, dynamic> json) {
  return _AnnualSalesState.fromJson(json);
}

/// @nodoc
mixin _$AnnualSalesState {
  List<GoodsSummary> get allSummaryList => throw _privateConstructorUsedError;
  List<GoodsSummary> get summaryList => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnualSalesStateCopyWith<AnnualSalesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualSalesStateCopyWith<$Res> {
  factory $AnnualSalesStateCopyWith(
          AnnualSalesState value, $Res Function(AnnualSalesState) then) =
      _$AnnualSalesStateCopyWithImpl<$Res, AnnualSalesState>;
  @useResult
  $Res call(
      {List<GoodsSummary> allSummaryList,
      List<GoodsSummary> summaryList,
      int year,
      String keyword});
}

/// @nodoc
class _$AnnualSalesStateCopyWithImpl<$Res, $Val extends AnnualSalesState>
    implements $AnnualSalesStateCopyWith<$Res> {
  _$AnnualSalesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSummaryList = null,
    Object? summaryList = null,
    Object? year = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      allSummaryList: null == allSummaryList
          ? _value.allSummaryList
          : allSummaryList // ignore: cast_nullable_to_non_nullable
              as List<GoodsSummary>,
      summaryList: null == summaryList
          ? _value.summaryList
          : summaryList // ignore: cast_nullable_to_non_nullable
              as List<GoodsSummary>,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnualSalesStateCopyWith<$Res>
    implements $AnnualSalesStateCopyWith<$Res> {
  factory _$$_AnnualSalesStateCopyWith(
          _$_AnnualSalesState value, $Res Function(_$_AnnualSalesState) then) =
      __$$_AnnualSalesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GoodsSummary> allSummaryList,
      List<GoodsSummary> summaryList,
      int year,
      String keyword});
}

/// @nodoc
class __$$_AnnualSalesStateCopyWithImpl<$Res>
    extends _$AnnualSalesStateCopyWithImpl<$Res, _$_AnnualSalesState>
    implements _$$_AnnualSalesStateCopyWith<$Res> {
  __$$_AnnualSalesStateCopyWithImpl(
      _$_AnnualSalesState _value, $Res Function(_$_AnnualSalesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSummaryList = null,
    Object? summaryList = null,
    Object? year = null,
    Object? keyword = null,
  }) {
    return _then(_$_AnnualSalesState(
      allSummaryList: null == allSummaryList
          ? _value._allSummaryList
          : allSummaryList // ignore: cast_nullable_to_non_nullable
              as List<GoodsSummary>,
      summaryList: null == summaryList
          ? _value._summaryList
          : summaryList // ignore: cast_nullable_to_non_nullable
              as List<GoodsSummary>,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnualSalesState implements _AnnualSalesState {
  const _$_AnnualSalesState(
      {final List<GoodsSummary> allSummaryList = const [],
      final List<GoodsSummary> summaryList = const [],
      this.year = 0,
      this.keyword = ''})
      : _allSummaryList = allSummaryList,
        _summaryList = summaryList;

  factory _$_AnnualSalesState.fromJson(Map<String, dynamic> json) =>
      _$$_AnnualSalesStateFromJson(json);

  final List<GoodsSummary> _allSummaryList;
  @override
  @JsonKey()
  List<GoodsSummary> get allSummaryList {
    if (_allSummaryList is EqualUnmodifiableListView) return _allSummaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSummaryList);
  }

  final List<GoodsSummary> _summaryList;
  @override
  @JsonKey()
  List<GoodsSummary> get summaryList {
    if (_summaryList is EqualUnmodifiableListView) return _summaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaryList);
  }

  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final String keyword;

  @override
  String toString() {
    return 'AnnualSalesState(allSummaryList: $allSummaryList, summaryList: $summaryList, year: $year, keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnualSalesState &&
            const DeepCollectionEquality()
                .equals(other._allSummaryList, _allSummaryList) &&
            const DeepCollectionEquality()
                .equals(other._summaryList, _summaryList) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allSummaryList),
      const DeepCollectionEquality().hash(_summaryList),
      year,
      keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnualSalesStateCopyWith<_$_AnnualSalesState> get copyWith =>
      __$$_AnnualSalesStateCopyWithImpl<_$_AnnualSalesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnualSalesStateToJson(
      this,
    );
  }
}

abstract class _AnnualSalesState implements AnnualSalesState {
  const factory _AnnualSalesState(
      {final List<GoodsSummary> allSummaryList,
      final List<GoodsSummary> summaryList,
      final int year,
      final String keyword}) = _$_AnnualSalesState;

  factory _AnnualSalesState.fromJson(Map<String, dynamic> json) =
      _$_AnnualSalesState.fromJson;

  @override
  List<GoodsSummary> get allSummaryList;
  @override
  List<GoodsSummary> get summaryList;
  @override
  int get year;
  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_AnnualSalesStateCopyWith<_$_AnnualSalesState> get copyWith =>
      throw _privateConstructorUsedError;
}
