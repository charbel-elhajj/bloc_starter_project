import 'package:dio/dio.dart';

class HttpClientService {
  final Dio httpClient;
  final String url;
  final String? userAgent;
  final String? jwt;
  String? locale;

  HttpClientService({
    required this.url,
    this.userAgent,
    this.jwt,
    this.locale,
    List<Interceptor> inteterceptors = const [],
  }) : httpClient = Dio(
          BaseOptions(
            baseUrl: url,
          ),
        )..interceptors.addAll(inteterceptors);

  Options _generateRequestionOptions(RequestOptions config) {
    if (jwt != null) {
      config.headers['Authorization'] = 'Bearer ${jwt!}';
    }

    if (userAgent != null) {
      config.headers['User-Agent'] = userAgent;
    }

    if (locale != null) {
      config.headers['Accept-Language'] = locale;
    }

    return Options(headers: config.headers);
  }

  Future<Response> post(RequestOptions config) {
    return httpClient.post(
      config.path,
      data: config.data,
      options: _generateRequestionOptions(config),
    );
  }

  Future<Response> patch(RequestOptions config) {
    return httpClient.patch(
      config.path,
      data: config.data,
      options: _generateRequestionOptions(config),
    );
  }

  Future<Response> put(RequestOptions config) {
    return httpClient.put(
      config.path,
      data: config.data,
      options: _generateRequestionOptions(config),
    );
  }

  Future<Response> get(RequestOptions config) {
    return httpClient.get(
      config.path,
      options: _generateRequestionOptions(config),
    );
  }

  Future<Response> delete(RequestOptions config) {
    return httpClient.delete(
      config.path,
      data: config.data,
      options: _generateRequestionOptions(config),
    );
  }
}
