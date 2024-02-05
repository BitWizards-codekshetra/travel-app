import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'ask_ai_repository.dart';

part 'ask_ai_repository_impl.g.dart';

class AskAiRepositoryImpl extends AskAiRepository {
  // TODO add your methods here
}

@riverpod
 AskAiRepository askAiRepository(AskAiRepositoryRef ref) =>
    AskAiRepositoryImpl();

