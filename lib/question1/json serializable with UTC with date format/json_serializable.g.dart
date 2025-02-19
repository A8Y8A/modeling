// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableModel _$SerializableModelFromJson(Map<String, dynamic> json) =>
    SerializableModel(
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerializableModelToJson(SerializableModel instance) =>
    <String, dynamic>{
      'company': instance.company,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      isActive: (json['is_active'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      established: _dateTimeFromJson(json['established'] as String?),
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'is_active': instance.isActive,
      'name': instance.name,
      'address': instance.address,
      'established': _dateTimeToJson(instance.established),
      'departments': instance.departments,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      deptId: json['deptId'] as String?,
      name: json['name'] as String?,
      manager: json['manager'] as String?,
      budget: (json['budget'] as num?)?.toDouble(),
      year: (json['year'] as num?)?.toInt(),
      availability: json['availability'] == null
          ? null
          : Availability.fromJson(json['availability'] as Map<String, dynamic>),
      meetingTime: json['meeting_time'] as String?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'deptId': instance.deptId,
      'name': instance.name,
      'manager': instance.manager,
      'budget': instance.budget,
      'year': instance.year,
      'availability': instance.availability,
      'meeting_time': instance.meetingTime,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      online: json['online'] as bool?,
      inStore: json['inStore'] as bool?,
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'online': instance.online,
      'inStore': instance.inStore,
    };
