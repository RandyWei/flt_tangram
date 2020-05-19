// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardListEntity _$CardListEntityFromJson(Map<String, dynamic> json) {
  return CardListEntity((json['cards'] as List)
      ?.map((e) =>
          e == null ? null : CardEntity.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CardListEntityToJson(CardListEntity instance) =>
    <String, dynamic>{'cards': instance.cards};

CardEntity _$CardEntityFromJson(Map<String, dynamic> json) {
  return CardEntity(
      json['type'] as String,
      json['items'] as List,
      json['style'] == null
          ? null
          : CardStyle.fromJson(json['style'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CardEntityToJson(CardEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'items': instance.items,
      'style': instance.style
    };

CardStyle _$CardStyleFromJson(Map<String, dynamic> json) {
  return CardStyle(
      json['bgColor'] as String,
      json['bgImgUrl'] as String,
      (json['margin'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
      (json['padding'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
      (json['vGap'] as num)?.toDouble(),
      (json['hGap'] as num)?.toDouble(),
      (json['cols'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$CardStyleToJson(CardStyle instance) => <String, dynamic>{
      'bgColor': instance.bgColor,
      'bgImgUrl': instance.bgImgUrl,
      'margin': instance.margin,
      'padding': instance.padding,
      'vGap': instance.vGap,
      'hGap': instance.hGap,
      'cols': instance.cols
    };
