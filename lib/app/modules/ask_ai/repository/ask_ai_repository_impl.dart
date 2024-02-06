import 'dart:convert';
import 'dart:developer';

import 'package:hackathon_proj/app/core/network/api_client.dart';
import 'package:hackathon_proj/app/core/network/endpoints.dart';
import 'package:hackathon_proj/app/modules/ask_ai/model/aski_ai_response/aski_ai_response.dart';
import 'package:hackathon_proj/app/modules/ask_ai/repository/ask_ai_repository.dart';

class AskAiRepositoryImpl extends AskAiRepository {
  @override
  Future<AskiAiResponse> getQuery(
      String budget, String place, String trvaelOption) async {
    var inputData = {
      "input":
          "I'm in Delhi, My budget is $budget INR, i love $place and i want to travel through $trvaelOption"
    };
    try {
      final dio = ApiClient().init();
      final response = await dio.post(Endpoints.openAiApi.url, data: inputData);
      final data = AskiAiResponse.fromJson(json.decode(response.data));

      log("My Data $data");

      return data;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
