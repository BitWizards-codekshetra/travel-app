import 'package:hackathon_proj/app/modules/ask_ai/model/aski_ai_response/aski_ai_response.dart';
import 'package:hackathon_proj/app/modules/ask_ai/repository/ask_ai_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ask_ai_providers.g.dart';

@riverpod
Future<AskiAiResponse> askAi(AskAiRef ref,
        {required String budget,
        required String place,
        required String travelOption}) =>
    ref.watch(askAiRepositoryProvider).getQuery(budget, place, travelOption);
