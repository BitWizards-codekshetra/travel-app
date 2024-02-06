import 'package:freezed_annotation/freezed_annotation.dart';

import 'place.dart';

part 'aski_ai_response.freezed.dart';
part 'aski_ai_response.g.dart';

@freezed
class AskiAiResponse with _$AskiAiResponse {
	factory AskiAiResponse({
		List<Place>? places,
	}) = _AskiAiResponse;

	factory AskiAiResponse.fromJson(Map<String, dynamic> json) => _$AskiAiResponseFromJson(json);
}