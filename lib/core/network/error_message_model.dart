import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message, status;

  const ErrorMessageModel({required this.status, required this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) => ErrorMessageModel(
        message: json['message'] ?? "",
        status: json["status_code"] ?? "",
      );

  @override
  List<Object?> get props => [message, status];
}
