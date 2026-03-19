import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:go_router/go_router.dart';

class WebLink extends StatelessWidget {
  final String path;
  final Object? extra;
  final Widget Function(BuildContext context, VoidCallback onTap) builder;

  const WebLink({
    super.key,
    required this.path,
    required this.builder,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      final fullWebUrl = Uri.parse('${Uri.base.origin}/#$path');
      return Link(
        uri: fullWebUrl,
        target: LinkTarget.self,
        builder: (context, followLink) => builder(context, () {
          context.go(path, extra: extra);
        }),
      );
    } else {
      return builder(context, () {
        context.push(path, extra: extra);
      });
    }
  }
}