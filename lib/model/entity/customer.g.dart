// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Customer _$$_CustomerFromJson(Map<String, dynamic> json) => _$_Customer(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      nameKana: json['nameKana'] as String? ?? '',
      postCode: json['postCode'] as String? ?? '',
      address: json['address'] as String? ?? '',
      accountName: json['accountName'] as String? ?? '',
      accountId: json['accountId'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      isSend: json['isSend'] as bool? ?? true,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_CustomerToJson(_$_Customer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameKana': instance.nameKana,
      'postCode': instance.postCode,
      'address': instance.address,
      'accountName': instance.accountName,
      'accountId': instance.accountId,
      'notes': instance.notes,
      'isSend': instance.isSend,
    };
