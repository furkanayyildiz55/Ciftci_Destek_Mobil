import 'dart:io';

import 'package:ciftci_destek_mobil/services/price_model.dart';
import 'package:dio/dio.dart';

abstract class IPricesPostServices {
  Future<List<PriceModel>?> fetchPostItems();
  Future<List<PriceModel>?> fetchSearchPostItems();
}

class PricesPostServices implements IPricesPostServices {
  late final Dio _dio;
  PricesPostServices()
      : _dio = Dio(BaseOptions(baseUrl: "https://sleepy-inlet-79208.herokuapp.com/"));

  @override
  Future<List<PriceModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get(endUrl.search.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PriceModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<PriceModel>?> fetchSearchPostItems() async {
    try {
      final response = await _dio.get(endUrl.search.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PriceModel.fromJson(e)).toList();
        }
      }
    } catch (_) {}
  }
}

enum endUrl { search }
