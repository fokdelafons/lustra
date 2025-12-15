import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renderuje dowolny widget do obrazu [Uint8List] o DOKŁADNIE zadanym rozmiarze.
Future<Uint8List?> renderWidgetToImage(Widget widget, Size size) async {
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

  // Pobieramy aktualny widok, co jest nowym, wymaganym podejściem.
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalSize = size;
  final pixelRatio = view.devicePixelRatio;

  final RenderView renderView = RenderView(
    view: view, // <<< NAPRAWIA błąd z 'view' i 'window'
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: repaintBoundary,
    ),
    configuration: ViewConfiguration(
      // W nowym API przekazujemy BoxConstraints zamiast Size.
      logicalConstraints: BoxConstraints.tight(logicalSize), // <<< NAPRAWIA błąd z 'size'
      devicePixelRatio: pixelRatio,
    ),
  );

  final PipelineOwner pipelineOwner = PipelineOwner();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(size: size),
        child: widget,
      ),
    ),
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await repaintBoundary.toImage(pixelRatio: pixelRatio);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData?.buffer.asUint8List();
}