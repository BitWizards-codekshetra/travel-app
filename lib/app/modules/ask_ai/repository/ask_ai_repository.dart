import 'package:hackathon_proj/app/modules/ask_ai/model/aski_ai_response/aski_ai_response.dart';
import 'package:hackathon_proj/app/modules/ask_ai/repository/ask_ai_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ask_ai_repository.g.dart';

abstract class AskAiRepository {
  Future<AskiAiResponse> getQuery(
      String budget, String place, String trvaelOption);
}

@riverpod
AskAiRepository askAiRepository(AskAiRepositoryRef ref) =>
    AskAiRepositoryImpl();
