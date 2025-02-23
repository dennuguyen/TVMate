// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteModel _$RemoteModelFromJson(Map<String, dynamic> json) => RemoteModel(
      label: json['label'] as String,
      url: json['url'] as String,
      location: json['location'] as String,
      commands: Map<String, String>.from(json['commands'] as Map),
    );

Map<String, dynamic> _$RemoteModelToJson(RemoteModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'url': instance.url,
      'location': instance.location,
      'commands': instance.commands,
    };
