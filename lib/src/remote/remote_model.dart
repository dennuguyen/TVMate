import 'package:json_annotation/json_annotation.dart';

part 'remote_model.g.dart';

@JsonSerializable()
class RemoteModel {
  final String label;
  final String url;
  final String location;
  final Map<String, String> commands;

  RemoteModel(
      {required this.label,
      required this.url,
      required this.location,
      required this.commands});

  factory RemoteModel.fromJson(Map<String, Object?> json) =>
      _$RemoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteModelToJson(this);
}
