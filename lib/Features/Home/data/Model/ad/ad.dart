import 'datum.dart';
import 'meta.dart';

class Ad {
  bool? status;
  String? message;
  List<Datum>? data;
  Meta? meta;

  Ad({this.status, this.message, this.data, this.meta});

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'meta': meta?.toJson(),
      };
}
