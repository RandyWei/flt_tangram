import 'package:flt_tangram/view/sliver/render/render_sliver_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliverContainer extends SingleChildRenderObjectWidget {
  const SliverContainer({
    Key key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.decorationWidget,
    this.sliver,
  })  : assert(padding != null),
        super(key: key, child: sliver);

  /// The amount of space by which to inset the child sliver.
  final EdgeInsetsGeometry padding;

  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final Widget decorationWidget;
  final Widget sliver;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverContainer(
        margin: this.margin, borderRadius: this.borderRadius);
  }


  @override
  void updateRenderObject(
      BuildContext context, RenderSliverContainer renderObject) {
    renderObject
      ..margin = margin
      ..borderRadius = borderRadius;
  }
}

