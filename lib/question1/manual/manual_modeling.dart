import 'dart:convert';

import 'package:quiz1/core/utils/test1.dart';
import 'package:quiz1/core/utils/test2.dart';

class Company {
  int? isActive;
  String? name;
  Address? address;
  DateTime? established;
  List<Departments>? departments;

  Company({
    this.isActive,
    this.name,
    this.address,
    this.established,
    this.departments,
  });

  Company.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'] as int?;
    name = json['name'] as String?;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    established = json['established'] != null
        ? DateTime.parse(json['established'])
        : null;
    if (json['departments'] != null) {
      departments = <Departments>[];
      (json['departments'] as List).forEach((v) {
        departments!.add(Departments.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_active'] = isActive;
    data['name'] = name;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['established'] = established;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Company(isActive: $isActive, name: $name, address: $address, established: $established, departments: $departments)';
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? postalCode;

  Address({this.street, this.city, this.state, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] as String?;
    city = json['city'] as String?;
    state = json['state'] as String?;
    postalCode = json['postalCode'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    return data;
  }

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, postalCode: $postalCode)';
  }
}

class Departments {
  String? deptId;
  String? name;
  String? manager;
  double? budget;
  int? year;
  Availability? availability;
  String? meetingTime;

  Departments({
    this.deptId,
    this.name,
    this.manager,
    this.budget,
    this.year,
    this.availability,
    this.meetingTime,
  });

  Departments.fromJson(Map<String, dynamic> json) {
    deptId = json['deptId'] as String?;
    name = json['name'] as String?;
    manager = json['manager'] as String?;
    budget = json['budget'] as double?;
    year = json['year'] as int?;
    availability = json['availability'] != null
        ? Availability.fromJson(json['availability'] as Map<String, dynamic>)
        : null;
    meetingTime = json['meeting_time'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deptId'] = deptId;
    data['name'] = name;
    data['manager'] = manager;
    data['budget'] = budget;
    data['year'] = year;
    if (availability != null) {
      data['availability'] = availability!.toJson();
    }
    data['meeting_time'] = meetingTime;
    return data;
  }

  @override
  String toString() {
    return 'Departments(deptId: $deptId, name: $name, manager: $manager, budget: $budget, year: $year, availability: $availability, meetingTime: $meetingTime)';
  }
}

class Availability {
  bool? online;
  bool? inStore;

  Availability({this.online, this.inStore});

  Availability.fromJson(Map<String, dynamic> json) {
    online = json['online'] as bool?;
    inStore = json['inStore'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['online'] = online;
    data['inStore'] = inStore;
    return data;
  }

  @override
  String toString() {
    return 'Availability(online: $online, inStore: $inStore)';
  }
}

void main() {
  print('Manual model:');
  Map<String, dynamic> parsedJson = jsonDecode(test1);
  var company = Company.fromJson(parsedJson["company"]);
  print(company);
}
