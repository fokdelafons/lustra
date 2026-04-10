import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

const double defaultScrollOffset = 1.0; 
const int defaultAnimationDuration = 400; 

class WebSmoothScroll extends StatefulWidget {
  final ScrollController controller;
  final Widget child;
  final double scrollSpeed;
  final int scrollAnimationLength;
  final Curve curve;

  const WebSmoothScroll({
    super.key,
    required this.controller,
    required this.child,
    this.scrollSpeed = defaultScrollOffset,
    this.scrollAnimationLength = defaultAnimationDuration,
    this.curve = Curves.easeOut,
  });

  @override
  State<WebSmoothScroll> createState() => _WebSmoothScrollState();
}

class _WebSmoothScrollState extends State<WebSmoothScroll> {
  double _scroll = 0;
  bool _isAnimating = false;
  double _targetScroll = 0;
  DateTime _lastScrollTime = DateTime.now();
  
  final FocusNode _focusNode = FocusNode();
  LogicalKeyboardKey? _heldKey;
  bool _isHoveringScrollbar = false; 

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(scrollListener);
    _targetScroll = widget.controller.initialScrollOffset;
    HardwareKeyboard.instance.addHandler(_handleGlobalKey);
  }

  @override
  void didUpdateWidget(covariant WebSmoothScroll oldWidget) {
    if (!widget.controller.hasClients) {
      widget.controller.addListener(scrollListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleGlobalKey);
    _focusNode.dispose();
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }

  void _smoothScrollTo(double delta) {
    final now = DateTime.now();
    final timeDiff = now.difference(_lastScrollTime).inMilliseconds;
    _lastScrollTime = now;

    _targetScroll += (delta * widget.scrollSpeed);

    if (_targetScroll > widget.controller.position.maxScrollExtent) {
      _targetScroll = widget.controller.position.maxScrollExtent;
    }
    if (_targetScroll < 0) {
      _targetScroll = 0;
    }

    int baseDuration = timeDiff < 80 
        ? widget.scrollAnimationLength ~/ 3 
        : widget.scrollAnimationLength;
        
    int animationDuration = (delta.abs() < 50) 
        ? 150 
        : baseDuration;

    if (_targetScroll == widget.controller.position.maxScrollExtent ||
        _targetScroll == 0) {
      animationDuration = widget.scrollAnimationLength ~/ 4;
    }

    widget.controller
        .animateTo(
      _targetScroll,
      duration: Duration(milliseconds: animationDuration),
      curve: widget.curve,
    )
        .then((_) {
      if (mounted) setState(() => _isAnimating = false);
    });

    if (mounted) setState(() => _isAnimating = true);
  }

  void scrollListener() {
    _scroll = widget.controller.offset;
    if (!_isAnimating || widget.controller.position.isScrollingNotifier.value) {
      _targetScroll = _scroll;
      if (widget.controller.position.isScrollingNotifier.value) {
        _isAnimating = false;
      }
    }
  }

  void _applyBrakes(bool isDown) {
    if (!widget.controller.hasClients) return;
    final double momentum = isDown ? 150.0 : -150.0;
    double newTarget = (widget.controller.offset + momentum).clamp(0.0, widget.controller.position.maxScrollExtent);
    
    _targetScroll = newTarget;
    _isAnimating = true;
    widget.controller.animateTo(
      newTarget,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    ).then((_) { if (mounted) setState(() => _isAnimating = false); });
  }

bool _handleGlobalKey(KeyEvent event) {
    final primaryFocus = FocusManager.instance.primaryFocus;
    if (primaryFocus != null && primaryFocus.context?.widget is EditableText) {
      return false; 
    }

    if (event.logicalKey == LogicalKeyboardKey.pageDown) {
      if (event is KeyDownEvent || event is KeyRepeatEvent) _smoothScrollTo(400);
      return true;
    }
    if (event.logicalKey == LogicalKeyboardKey.pageUp) {
      if (event is KeyDownEvent || event is KeyRepeatEvent) _smoothScrollTo(-400);
      return true;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowDown || event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (event is KeyDownEvent && _heldKey != event.logicalKey) {
        _heldKey = event.logicalKey;
        final isDown = event.logicalKey == LogicalKeyboardKey.arrowDown;
        final target = isDown ? widget.controller.position.maxScrollExtent : 0.0;
        final distance = (target - widget.controller.offset).abs();
        final durationMs = (distance / 1200.0 * 1000).toInt(); 
        
        if (distance > 0) {
          _targetScroll = target; 
          _isAnimating = true;
          widget.controller.animateTo(
            target, 
            duration: Duration(milliseconds: durationMs), 
            curve: Curves.linear,
          ).then((_) { if (mounted) setState(() => _isAnimating = false); });
        }
        return true;
      } else if (event is KeyUpEvent && _heldKey == event.logicalKey) {
        final isDown = _heldKey == LogicalKeyboardKey.arrowDown;
        _heldKey = null;
        _applyBrakes(isDown);
        return true;
      }
    }
    return false;
  }

  void onPointerSignal(PointerSignalEvent pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      if (pointerSignal.kind != PointerDeviceKind.trackpad) {
        _smoothScrollTo(pointerSignal.scrollDelta.dy);
      } else {
        final newOffset =
            (widget.controller.offset + pointerSignal.scrollDelta.dy)
                .clamp(0.0, widget.controller.position.maxScrollExtent);
        widget.controller.jumpTo(newOffset);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          physics: const AlwaysScrollableScrollPhysics(),
        ),
        child: MouseRegion(
          onHover: (event) {
            // TARCZA: Jeśli mysz jest w pasie 20px od prawej krawędzi, aktywujemy hover
            final isOver = event.localPosition.dx > constraints.maxWidth - 20;
            if (isOver != _isHoveringScrollbar) {
              setState(() => _isHoveringScrollbar = isOver);
            }
          },
          onExit: (_) => setState(() => _isHoveringScrollbar = false),
          child: RawScrollbar(
            controller: widget.controller,
            thickness: 14.0,
            radius: const Radius.circular(8.0),
            // TARCZA: Dynamiczny kolor - ciemniejszy (alpha 210) gdy hover
            thumbColor: Colors.grey.withAlpha(_isHoveringScrollbar ? 210 : 153),
            interactive: true,
            thumbVisibility: true,
            child: Focus(
          focusNode: _focusNode,
          autofocus: true,
          child: Listener(
            onPointerDown: (_) {
              Future.microtask(() {
                if (mounted && !_focusNode.hasFocus) {
                  _focusNode.requestFocus();
                }
              });
            },
            onPointerSignal: onPointerSignal,
            child: widget.child,
          ),
          ),
        ),
      ));
    });
  }
}

class SmoothScrollController extends ScrollController {
  SmoothScrollController({super.initialScrollOffset, super.keepScrollOffset, super.debugLabel});

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return SmoothScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
}

class SmoothScrollPosition extends ScrollPositionWithSingleContext {
  SmoothScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
  });

  @override
  void pointerScroll(double delta) {
  }
}