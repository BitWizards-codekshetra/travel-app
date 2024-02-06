// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aski_ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AskiAiResponse _$$_AskiAiResponseFromJson(Map<String, dynamic> json) =>
    _$_AskiAiResponse(
      places: (json['places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AskiAiResponseToJson(_$_AskiAiResponse instance) =>
    <String, dynamic>{
      'places': instance.places,
    };
