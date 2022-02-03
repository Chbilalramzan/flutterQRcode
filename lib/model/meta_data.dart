class MetaData {
  String status;
  int responseCode;
  int numberOfRecords;
  String message;
  List errors;

  MetaData({
    required this.status,
    required this.responseCode,
    required this.numberOfRecords,
    required this.message,
    required this.errors,
  });

  MetaData copyWith({
    required String status,
    required int responseCode,
    required int numberOfRecords,
    required String message,
    required List errors,
  }) =>
      MetaData(
        status: this.status,
        errors: [],
        message: '',
        numberOfRecords: this.numberOfRecords,
        responseCode: this.responseCode,
      );

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
      status: json['status'],
      responseCode: json['response_code'],
      numberOfRecords: json['num_of_records'],
      message: json['message'],
      errors: json['errors']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "response_code": responseCode,
        "numberOfRecords": numberOfRecords,
        "message": message,
        "errors": errors
      };
}
