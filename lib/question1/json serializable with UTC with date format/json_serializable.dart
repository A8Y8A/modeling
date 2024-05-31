import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:quiz1/core/utils/mixins/date_format_mixin.dart';
import 'package:quiz1/core/utils/test1.dart';
import 'package:quiz1/core/utils/test2.dart';

part 'json_serializable.g.dart';

@JsonSerializable()
class SerializableModel with DateFormatMixin {
  final Company? company;

  SerializableModel({this.company});

  factory SerializableModel.fromJson(Map<String, dynamic> json) =>
      _$SerializableModelFromJson(json);
  Map<String, dynamic> toJson() => _$SerializableModelToJson(this);

  @override
  String toString() {
    return '$company';
  }
}

@JsonSerializable()
class Company {
  @JsonKey(name: 'is_active')
  final int? isActive;
  final String? name;
  final Address? address;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? established;
  final List<Department>? departments;

  Company({
    this.isActive,
    this.name,
    this.address,
    this.established,
    this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  String toString() {
    return 'Company(isActive: $isActive, name: $name, address: $address, established: $established, departments: $departments)';
  }
}

@JsonSerializable()
class Address {
  final String? street;
  final String? city;
  final String? state;
  @JsonKey(name: 'postalCode')
  final String? postalCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, postalCode: $postalCode)';
  }
}

@JsonSerializable()
class Department {
  final String? deptId;
  final String? name;
  final String? manager;
  final double? budget;
  final int? year;
  final Availability? availability;
  @JsonKey(name: 'meeting_time')
  final String? meetingTime;

  Department({
    this.deptId,
    this.name,
    this.manager,
    this.budget,
    this.year,
    this.availability,
    this.meetingTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  @override
  String toString() {
    return 'Department(deptId: $deptId, name: $name, manager: $manager, budget: $budget, year: $year, availability: $availability, meetingTime: $meetingTime)';
  }
}

@JsonSerializable()
class Availability {
  final bool? online;
  final bool? inStore;

  Availability({
    this.online,
    this.inStore,
  });

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);

  @override
  String toString() {
    return 'Availability(online: $online, inStore: $inStore)';
  }
}

// Helper methods to convert date time to UTC
DateTime? _dateTimeFromJson(String? date) =>
    date != null ? DateTime.parse(date).toUtc() : null;
String? _dateTimeToJson(DateTime? date) => date!.toUtc().toIso8601String();

void main() {
  print('json serializable model:');
  Map<String, dynamic> parsedJson3 = jsonDecode(test2);
  SerializableModel serializableModel = SerializableModel.fromJson(parsedJson3);
  print(serializableModel);

  SerializableModel dateUtils = SerializableModel();

  String formattedEstablishedDate =
      dateUtils.formatDate(serializableModel.company!.established!);

  print('Formatted Established Date: $formattedEstablishedDate');

  // Get the current device date and time in UTC and format it
  DateTime currentUtcDate = DateTime.now().toUtc();
  String formattedCurrentUtcDate = dateUtils.formatDate(currentUtcDate);
  print('Current UTC Date: $currentUtcDate');

  print('Formatted Current UTC Date: $formattedCurrentUtcDate');
}
