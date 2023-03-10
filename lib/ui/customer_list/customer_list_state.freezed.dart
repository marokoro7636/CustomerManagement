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
  String get keyword => throw _privateConstructorUsedError;
  SearchType get searchType => throw _privateConstructorUsedError;
  List<Customer> get allCustomers => throw _privateConstructorUsedError;
  List<Customer> get customers => throw _privateConstructorUsedError;
  bool get onlyNotSend => throw _privateConstructorUsedError;

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
  $Res call(
      {String keyword,
      SearchType searchType,
      List<Customer> allCustomers,
      List<Customer> customers,
      bool onlyNotSend});
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
    Object? keyword = null,
    Object? searchType = null,
    Object? allCustomers = null,
    Object? customers = null,
    Object? onlyNotSend = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
      allCustomers: null == allCustomers
          ? _value.allCustomers
          : allCustomers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      onlyNotSend: null == onlyNotSend
          ? _value.onlyNotSend
          : onlyNotSend // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {String keyword,
      SearchType searchType,
      List<Customer> allCustomers,
      List<Customer> customers,
      bool onlyNotSend});
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
    Object? keyword = null,
    Object? searchType = null,
    Object? allCustomers = null,
    Object? customers = null,
    Object? onlyNotSend = null,
  }) {
    return _then(_$_CustomerListState(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
      allCustomers: null == allCustomers
          ? _value._allCustomers
          : allCustomers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      onlyNotSend: null == onlyNotSend
          ? _value.onlyNotSend
          : onlyNotSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CustomerListState implements _CustomerListState {
  const _$_CustomerListState(
      {this.keyword = '',
      this.searchType = SearchType.name,
      final List<Customer> allCustomers = const [],
      final List<Customer> customers = const [],
      this.onlyNotSend = false})
      : _allCustomers = allCustomers,
        _customers = customers;

  @override
  @JsonKey()
  final String keyword;
  @override
  @JsonKey()
  final SearchType searchType;
  final List<Customer> _allCustomers;
  @override
  @JsonKey()
  List<Customer> get allCustomers {
    if (_allCustomers is EqualUnmodifiableListView) return _allCustomers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCustomers);
  }

  final List<Customer> _customers;
  @override
  @JsonKey()
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  @JsonKey()
  final bool onlyNotSend;

  @override
  String toString() {
    return 'CustomerListState(keyword: $keyword, searchType: $searchType, allCustomers: $allCustomers, customers: $customers, onlyNotSend: $onlyNotSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerListState &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.searchType, searchType) ||
                other.searchType == searchType) &&
            const DeepCollectionEquality()
                .equals(other._allCustomers, _allCustomers) &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            (identical(other.onlyNotSend, onlyNotSend) ||
                other.onlyNotSend == onlyNotSend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      keyword,
      searchType,
      const DeepCollectionEquality().hash(_allCustomers),
      const DeepCollectionEquality().hash(_customers),
      onlyNotSend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerListStateCopyWith<_$_CustomerListState> get copyWith =>
      __$$_CustomerListStateCopyWithImpl<_$_CustomerListState>(
          this, _$identity);
}

abstract class _CustomerListState implements CustomerListState {
  const factory _CustomerListState(
      {final String keyword,
      final SearchType searchType,
      final List<Customer> allCustomers,
      final List<Customer> customers,
      final bool onlyNotSend}) = _$_CustomerListState;

  @override
  String get keyword;
  @override
  SearchType get searchType;
  @override
  List<Customer> get allCustomers;
  @override
  List<Customer> get customers;
  @override
  bool get onlyNotSend;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerListStateCopyWith<_$_CustomerListState> get copyWith =>
      throw _privateConstructorUsedError;
}
