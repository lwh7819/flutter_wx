class NetworkServiceResponse<T> {
  T data;
  int code;
  String message;

  NetworkServiceResponse({this.data, this.code, this.message});
}

class MappedNetworkServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, this.networkServiceResponse});
}
