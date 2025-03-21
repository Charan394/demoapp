
class ApiResult<T> {
  T data;
  ApiStatus status;

ApiResult({required this.data, required this.status});


}

enum ApiStatus {
 success,
 failure
}

extension ApiResultModel on ApiResult{

  bool get isSuccess => status == ApiStatus.success;
  bool get isFailure => status == ApiStatus.failure;


}