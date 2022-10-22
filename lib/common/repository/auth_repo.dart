import 'dart:convert';

import 'package:price_tracker/common/repository/base_repo.dart';

class AuthRepo extends BaseRepo {
  Future<dynamic> checkAPIToken(String apiToken) async {
    return callAndWaitForData(
      "authorize",
      jsonEncode({"authorize": apiToken}),
    );
  }
}
