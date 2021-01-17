// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vanue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vanue _$VanueFromJson(Map<String, dynamic> json) {
  return Vanue(
    venue_id: json['venue_id'] as int,
    name: json['name'] as String,
    location: json['location'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$VanueToJson(Vanue instance) => <String, dynamic>{
      'venue_id': instance.venue_id,
      'name': instance.name,
      'location': instance.location,
      'timezone': instance.timezone,
    };
