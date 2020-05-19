import 'package:flt_tangram/constants/constants.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  bool get isOneColumn {
    return CardType.ContainerOneColumn.toLowerCase() == this?.toLowerCase();
  }

  bool get isDoubleCloumn {
    return CardType.ContainerTwoColumn.toLowerCase() == this?.toLowerCase() ||
        CardType.ContainerDoubleColumn.toLowerCase() == this?.toLowerCase();
  }

  bool get isTripleColumn {
    return CardType.ContainerThreeColumn.toLowerCase() == this?.toLowerCase() ||
        CardType.ContainerTripleColumn.toLowerCase() == this?.toLowerCase();
  }

  bool get isFourColumn {
    return CardType.ContainerFourColumn.toLowerCase() == this?.toLowerCase();
  }

  bool get isFiveColumn {
    return CardType.ContainerFiveColumn.toLowerCase() == this?.toLowerCase();
  }

  bool get isNColumn {
    return CardType.ContainerNColumn.toLowerCase() == this?.toLowerCase() ||
        CardType.ContainerFlowColumn.toLowerCase() == this?.toLowerCase();
  }

  Color toColor() {
    var colorStr = this;
    if (colorStr.toLowerCase().startsWith("0x")) {
      colorStr = colorStr.toLowerCase().replaceAll("0x", "");
    } else {
      colorStr = colorStr.replaceAll("#", "");
      if (colorStr.length == 3 || colorStr.length == 4) {
        List<String> colorArr = colorStr.split("").map((f) {
          return f + f;
        }).toList();
        colorStr = colorArr.join("");
      }
      if (colorStr.length == 6) {
        colorStr = "ff" + colorStr;
      }
      if (colorStr.length != 8) colorStr = "00000000";
    }
    return Color(int.parse(colorStr, radix: 16) + 0x00000000);
  }
}
