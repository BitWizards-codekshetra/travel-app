import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
	factory Place({
		String? name,
		String? description,
		String? budget,
	}) = _Place;

	factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}