class BaseApiResponse<T> {
  T? body;
  List<Errors>? errors;
  late String refId;

  BaseApiResponse({this.body, this.errors, required this.refId});

  BaseApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? bodyConvertor,
  }) {
    if (json['body'] != null) {
      body = bodyConvertor != null ? bodyConvertor(json['body']) : json['body'];
    }
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    refId = json['refId'];
  }

  Map<String, dynamic> toJson({
    Map<String, dynamic> Function(T)? bodyToJsonConvertor,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.body != null) {
      data['body'] = bodyToJsonConvertor != null
          ? bodyToJsonConvertor(this.body as T)
          : this.body;
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  bool get isSuccess => body != null && (errors == null || errors!.isEmpty);
}

class Errors {
  late String errorCode;
  late String errorMessage;

  Errors({required this.errorCode, required this.errorMessage});

  Errors.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
