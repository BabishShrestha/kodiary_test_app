// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
    final int id;
    final String name;
    final String code;
    final String category;
    final String email;
    final String domain;
    final String? logo;
    final String? phone;
    final String? logoUrl;
    final String status;
    final bool acceptHazardiousWaste;
    final String? statusRemarks;
    final String? details;
    final String? verifiedAt;
    final List<Service> services;

    Company({
        required this.id,
        required this.name,
        required this.code,
        required this.category,
        required this.email,
        required this.domain,
        this.logo,
        this.phone,
         this.logoUrl,
        required this.status,
        required this.acceptHazardiousWaste,
        this.statusRemarks,
        this.details,
        this.verifiedAt,
        required this.services,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        category: json["category"],
        email: json["email"],
        domain: json["domain"],
        logo: json["logo"],
        phone: json["phone"],
        logoUrl: json["logo_url"],
        status: json["status"],
        acceptHazardiousWaste: json["accept_hazardious_waste"],
        statusRemarks: json["status_remarks"],
        details: json["details"],
        verifiedAt: json["verified_at"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "category": category,
        "email": email,
        "domain": domain,
        "logo": logo,
        "phone": phone,
        "logo_url": logoUrl,
        "status": status,
        "accept_hazardious_waste": acceptHazardiousWaste,
        "status_remarks": statusRemarks,
        "details": details,
        "verified_at": verifiedAt,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    final int id;
    final String? name;
    final String? slug;
    final String? host;
    final String? statsApi;
    final String? description;
    final String? status;
    final String? statusRemarks;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int companyServiceId;

    Service({
        required this.id,
        required this.name,
        required this.slug,
        required this.host,
        required this.statsApi,
        required this.description,
        required this.status,
         this.statusRemarks,
        required this.createdAt,
        required this.updatedAt,
        required this.companyServiceId,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        host: json["host"],
        statsApi: json["stats_api"],
        description: json["description"],
        status: json["status"],
        statusRemarks: json["status_remarks"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyServiceId: json["company_service_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "host": host,
        "stats_api": statsApi,
        "description": description,
        "status": status,
        "status_remarks": statusRemarks,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_service_id": companyServiceId,
    };
}
