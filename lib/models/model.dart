// To parse this JSON data, do
//
//     final serviceLineDetailsModel = serviceLineDetailsModelFromJson(jsonString);

import 'dart:convert';

ServiceLineDetailsModel serviceLineDetailsModelFromJson(String str) =>
    ServiceLineDetailsModel.fromJson(json.decode(str));

String serviceLineDetailsModelToJson(ServiceLineDetailsModel data) =>
    json.encode(data.toJson());

class ServiceLineDetailsModel {
  ServiceLineDetailsModel({
    required this.statusCode,
    required this.statusDescription,
    required this.serviceLineDetails,
  });

  String? statusCode;
  String? statusDescription;
  List<ServiceLineDetail>? serviceLineDetails;

  factory ServiceLineDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceLineDetailsModel(
        statusCode: json["StatusCode"],
        statusDescription: json["StatusDescription"],
        serviceLineDetails: List<ServiceLineDetail>.from(
            json["ServiceLineDetails"]
                .map((x) => ServiceLineDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "StatusDescription": statusDescription,
        "ServiceLineDetails":
            List<dynamic>.from(serviceLineDetails!.map((x) => x.toJson())),
      };
}

class ServiceLineDetail {
  ServiceLineDetail({
    required this.servicelineCode,
    required this.serviceLineDescription,
  });

  String? servicelineCode;
  String? serviceLineDescription;

  factory ServiceLineDetail.fromJson(Map<String, dynamic> json) =>
      ServiceLineDetail(
        servicelineCode: json["ServicelineCode"],
        serviceLineDescription: json["ServiceLineDescription"],
      );

  Map<String, dynamic> toJson() => {
        "ServicelineCode": servicelineCode,
        "ServiceLineDescription": serviceLineDescription,
      };
}
