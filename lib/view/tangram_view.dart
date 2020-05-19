import 'package:flt_tangram/entity/card_entity.dart';
import 'package:flt_tangram/view/sliver/widget/sliver_group_builder.dart';
import 'package:flutter/material.dart';
import 'package:flt_tangram/extensions/string_extension.dart';

class TangramView extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function configImageProvider;

  const TangramView({Key key, @required this.data, this.configImageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardListEntity cardListEntity = CardListEntity.fromJson(data);

    List<Widget> widgets = cardListEntity.cards.map((CardEntity card) {
      var cardStyle = card.style;
      var bgColor = (cardStyle.bgColor?.toString() ?? "").toColor();
      var margin = cardStyle.margin;
      if (margin.length != 4) margin = [0.0, 0.0, 0.0, 0.0];
      var padding = cardStyle.padding;
      if (padding.length != 4) padding = [0.0, 0.0, 0.0, 0.0];
      var bgImgUrl = cardStyle.bgImgUrl;

      if (card.type.isOneColumn) {
        return SliverGroupBuilder(
          decoration: BoxDecoration(
              color: bgColor,
              image: DecorationImage(
                  image: configImageProvider(bgImgUrl), fit: BoxFit.cover)),
          margin: EdgeInsets.only(
            top: margin[0],
            right: margin[1],
            bottom: margin[2],
            left: margin[3],
          ),
          padding: EdgeInsets.only(
            top: padding[0],
            right: padding[1],
            bottom: padding[2],
            left: padding[3],
          ),
          child: SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            var cell = card.items[index];
            var cellStyle = cell["style"];
            return Container(
              height: cellStyle["height"].toDouble(),
              color: (cellStyle["bgColor"]?.toString() ?? "").toColor(),
            );
          }, childCount: card.items.length)),
        );
      }
      if (card.type.isDoubleCloumn) {
        return generateNColumn(card: card, columnNum: 2);
      }
      if (card.type.isTripleColumn) {
        return generateNColumn(card: card, columnNum: 3);
      }
      if (card.type.isFourColumn) {
        return generateNColumn(card: card, columnNum: 4);
      }
      if (card.type.isFiveColumn) {
        return generateNColumn(card: card, columnNum: 5);
      }
      return Container(
        color: Colors.white,
      );
    }).toList();

    return CustomScrollView(
      slivers: widgets,
    );
  }

  SliverGroupBuilder generateNColumn(
      {@required CardEntity card, @required int columnNum}) {
    var cardStyle = card.style;
    var bgColor = (cardStyle.bgColor?.toString() ?? "").toColor();
    var margin = cardStyle.margin;
    if (margin.length != 4) margin = [0.0, 0.0, 0.0, 0.0];
    var padding = cardStyle.padding;
    if (padding.length != 4) padding = [0.0, 0.0, 0.0, 0.0];
    var bgImgUrl = cardStyle.bgImgUrl;

    var rowNum = card.items.length ~/ columnNum;
    var remainder = card.items.length % columnNum;
    //odd奇数 even偶数
    if (remainder != 0) {
      rowNum += 1;
    }
    var cols = cardStyle.cols ?? [];
    for (var i = cols.length; i < columnNum; i++) {
      cols.add(1);
    }

    var vGap = cardStyle.vGap;
    var hGap = cardStyle.hGap;

    return SliverGroupBuilder(
      decoration: BoxDecoration(
          color: bgColor,
          image: DecorationImage(
              image: configImageProvider(bgImgUrl), fit: BoxFit.cover)),
      margin: EdgeInsets.only(
        top: margin[0],
        right: margin[1],
        bottom: margin[2],
        left: margin[3],
      ),
      padding: EdgeInsets.only(
        top: padding[0],
        right: padding[1],
        bottom: padding[2],
        left: padding[3],
      ),
      child: SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        print("index：$index ");
        if (index.isOdd) {
          return SizedBox(
            height: vGap,
          );
        } else {
          List<Widget> rowChildren = [];
          //
          var rowIndex = index ~/ 2;
          var rowMaxCount = (rowIndex + 1) * columnNum; //当前行最大个数
          var rowMinCount = rowIndex * columnNum; //当前行最小个数
          print("rowIndex:$rowIndex ");
          for (var itemIndex = rowMinCount;
              itemIndex < rowMaxCount;
              itemIndex++) {
//            print("rowMinCount：$rowMinCount - rowMaxCount:$rowMaxCount");

            if (itemIndex >= card.items.length) {
              var widget = Expanded(
                flex: cols[itemIndex - rowMinCount],
                child: Container(),
              );
              rowChildren.add(widget);
            } else {
              var cell = card.items[itemIndex];
              var cellStyle = cell["style"];
              var widget = Expanded(
                flex: cols[itemIndex - rowMinCount],
                child: Container(
                  height: cellStyle["height"].toDouble(),
                  color: (cellStyle["bgColor"]?.toString() ?? "").toColor(),
                ),
              );

              rowChildren.add(widget);
            }
            //未达到最后一项时，插入横向间隔
            if (itemIndex + 1 < rowMaxCount) {
              rowChildren.add(SizedBox(
                width: hGap,
              ));
            }
          }
          return Row(
            children: rowChildren,
          );
        }
      }, childCount: rowNum * 2 - 1)),
    );
  }
}
