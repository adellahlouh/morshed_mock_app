class StdModel {
  final int id;

  final String fullName;

  final String email;

  final String phoneNumber;

  final DateTime lastContacted;

  StdModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.lastContacted,
  });

  factory StdModel.fromJson(Map<String, dynamic> json) {
    return StdModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      lastContacted: json['lastContacted'],
    );
  }
}
