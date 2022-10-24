import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:price_tracker/common/repository/base_repo.dart';

class AuthRepo extends BaseRepo {
  final storage = FlutterSecureStorage();

  Future<String?> getTokenFromStorage() async {
    return storage.read(key: "api_token");
  }

  Future<void> saveTokenToStorage(String token) async {
    return storage.write(key: "api_token", value: token);
  }

  Future<dynamic> checkAPIToken(String apiToken) async {
    return callAndWaitForData(
      "authorize",
      jsonEncode({"authorize": apiToken}),
    );
  }
}
