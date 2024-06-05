class ServiceCategory {
  String? id;
  String? name;
  String? identifier;
  String? description;
  String? logoUrl;

  ServiceCategory({
    this.id,
    this.name,
    this.identifier,
    this.description,
    this.logoUrl,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['_id'],
      name: json['name'],
      identifier: json['identifier'],
      description: json['description'],
      logoUrl: json['logoUrl'],
    );
  }
}

class ServiceCategoryProduct {
  final String validity;
  final String bundleCode;
  final String amount;
  final bool isAmountFixed;

  ServiceCategoryProduct({
    required this.validity,
    required this.bundleCode,
    required this.amount,
    required this.isAmountFixed,
  });

  factory ServiceCategoryProduct.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryProduct(
      validity: json['validity'] ?? '',
      bundleCode: json['bundleCode'] ?? '',
      amount: json['amount'] ?? '',
      isAmountFixed: json['isAmountFixed'] ?? false,
    );
  }
}

class CableServiceCategory {
  final String id;
  final String name;
  final String identifier;
  final String service;
  final String vendor;
  final bool isFixedAmount;
  final String description;
  final String logoUrl;
  final String createdAt;
  final String updatedAt;
  final int v;

  CableServiceCategory({
    required this.id,
    required this.name,
    required this.identifier,
    required this.service,
    required this.vendor,
    required this.isFixedAmount,
    required this.description,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CableServiceCategory.fromJson(Map<String, dynamic> json) {
    return CableServiceCategory(
      id: json['_id'],
      name: json['name'],
      identifier: json['identifier'],
      service: json['service'],
      vendor: json['vendor'],
      isFixedAmount: json['isFixedAmount'],
      description: json['description'],
      logoUrl: json['logoUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class CableServiceCategoryProduct {
  final String name;
  final String bundleCode;
  final int? amount;
  final bool isAmountFixed;

  CableServiceCategoryProduct({
    required this.name,
    required this.bundleCode,
    this.amount,
    required this.isAmountFixed,
  });

  factory CableServiceCategoryProduct.fromJson(Map<String, dynamic> json) {
    return CableServiceCategoryProduct(
      name: json['name'],
      bundleCode: json['bundleCode'],
      amount: json['amount'],
      isAmountFixed: json['isAmountFixed'],
    );
  }
}

class PowerServiceCategory {
  final String id;
  final String name;
  final String identifier;
  final String service;
  final String vendor;
  final bool isFixedAmount;
  final String description;
  final String logoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  PowerServiceCategory({
    required this.id,
    required this.name,
    required this.identifier,
    required this.service,
    required this.vendor,
    required this.isFixedAmount,
    required this.description,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PowerServiceCategory.fromJson(Map<String, dynamic> json) {
    return PowerServiceCategory(
      id: json['_id'],
      name: json['name'],
      identifier: json['identifier'],
      service: json['service'],
      vendor: json['vendor'],
      isFixedAmount: json['isFixedAmount'],
      description: json['description'],
      logoUrl: json['logoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
