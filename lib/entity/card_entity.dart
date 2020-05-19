import 'package:json_annotation/json_annotation.dart';

part 'card_entity.g.dart';

@JsonSerializable()
class CardListEntity {
  CardListEntity(this.cards);

  List<CardEntity> cards;

  factory CardListEntity.fromJson(Map<String, dynamic> json) =>
      _$CardListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CardListEntityToJson(this);
}

@JsonSerializable()
class CardEntity {
  CardEntity(this.type, this.items, this.style);

  String type;
  List items;
  CardStyle style;

  factory CardEntity.fromJson(Map<String, dynamic> json) =>
      _$CardEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CardEntityToJson(this);
}

@JsonSerializable()
class CardStyle {
  String bgColor;
  String bgImgUrl;
  List<double> margin;
  List<double> padding;
  double vGap;
  double hGap;
  List<int> cols;

  CardStyle(this.bgColor, this.bgImgUrl, this.margin, this.padding, this.vGap,
      this.hGap, this.cols);

  factory CardStyle.fromJson(Map<String, dynamic> json) =>
      _$CardStyleFromJson(json);

  Map<String, dynamic> toJson() => _$CardStyleToJson(this);
}
