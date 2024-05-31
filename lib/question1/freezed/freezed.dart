import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz1/core/utils/test1.dart';
import 'package:quiz1/core/utils/test2.dart';

part 'freezed.freezed.dart';
part 'freezed.g.dart';

@freezed
class FreezedModel with _$FreezedModel {
  const factory FreezedModel({
    Company? company,
  }) = _FreezedModel;

  factory FreezedModel.fromJson(Map<String, dynamic> json) =>
      _$FreezedModelFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'is_active') int? isActive,
    String? name,
    Address? address,
    String? established,
    List<Department>? departments,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? street,
    String? city,
    String? state,
    @JsonKey(name: 'postalCode') String? postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Department with _$Department {
  const factory Department({
    String? deptId,
    String? name,
    String? manager,
    double? budget,
    int? year,
    Availability? availability,
    @JsonKey(name: 'meeting_time') String? meetingTime,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@freezed
class Availability with _$Availability {
  const factory Availability({
    bool? online,
    bool? inStore,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}

void main() {
  print('Freezed model:');
  Map<String, dynamic> parsedJson4 = jsonDecode(test1);
  FreezedModel freezedModel = FreezedModel.fromJson(parsedJson4);
  print(freezedModel);
}
