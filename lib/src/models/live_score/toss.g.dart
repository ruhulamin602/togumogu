// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Toss _$TossFromJson(Map<String, dynamic> json) {
  return Toss(
    winner: json['winner'] as String,
    decision: json['decision'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$TossToJson(Toss instance) => <String, dynamic>{
      'text': instance.text,
      'winner': instance.winner,
      'decision': instance.decision,
    };
