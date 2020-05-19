
import 'package:flt_tangram/view/sliver/render/render_sliver_group.dart';
import 'package:flutter/material.dart';

@immutable
class SliverGroup extends RenderObjectWidget {
  SliverGroup(
      {Key key,
      this.margin,
      this.borderRadius,
      this.decorationWidget,
      this.sliver})
      : super(key: key);

  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final Widget decorationWidget;
  final Widget sliver;

  @override
  RenderSliverGroup createRenderObject(BuildContext context) {
    return RenderSliverGroup(
        margin: this.margin, borderRadius: this.borderRadius);
  }

  @override
  _SliverGroupElement createElement() => _SliverGroupElement(this);

  @override
  void updateRenderObject(
      BuildContext context, RenderSliverGroup renderObject) {
    renderObject
      ..margin = margin
      ..borderRadius = borderRadius;
  }
}

class _SliverGroupElement extends RenderObjectElement {
  _SliverGroupElement(SliverGroup widget) : super(widget);

  Element _decoration;
  Element _sliver;

  @override
  SliverGroup get widget => super.widget;

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_decoration != null) visitor(_decoration);
    if (_sliver != null) visitor(_sliver);
  }

  @override
  void forgetChild(Element child) {
    if (child == _decoration) _decoration = null;
    if (child == _sliver) _sliver = null;
  }

  @override
  void mount(Element parent, newSlot) {
    super.mount(parent, newSlot);
    _decoration = updateChild(_decoration, widget.decorationWidget, 0);
    _sliver = updateChild(_sliver, widget.sliver, 1);
  }

  @override
  void update(RenderObjectWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _decoration = updateChild(_decoration, widget.decorationWidget, 0);
    _sliver = updateChild(_sliver, widget.sliver, 1);
  }

  @override
  void insertChildRenderObject(RenderObject child, int slot) {
    final RenderSliverGroup renderObject = this.renderObject;
    if (slot == 0) renderObject.decoration = child;
    if (slot == 1) renderObject.child = child;
    assert(renderObject == this.renderObject);
  }

  @override
  void moveChildRenderObject(RenderObject child, slot) {
    assert(false);
  }

  @override
  void removeChildRenderObject(RenderObject child) {
    final RenderSliverGroup renderObject = this.renderObject;
    if (renderObject.decoration == child) renderObject.decoration = null;
    if (renderObject.child == child) renderObject.child = null;
    assert(renderObject == this.renderObject);
  }
}
