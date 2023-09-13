import 'package:flutter/material.dart';

import '../../main.dart';

class ResartApp extends StatefulWidget {
  final Widget child;

  const ResartApp({super.key, required this.child});
  static void restartApp(BuildContext context) {
    initServices();
    context.findAncestorStateOfType<_ResartAppState>()?.restartApp();
  }

  @override
  State<ResartApp> createState() => _ResartAppState();
}

class _ResartAppState extends State<ResartApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
