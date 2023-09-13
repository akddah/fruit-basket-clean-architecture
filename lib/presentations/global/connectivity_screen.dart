import 'package:flutter/material.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/utils/extension.dart';
import '../../gen/assets.gen.dart';
import 'custom_image.dart';

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({super.key});

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImage(Assets.svg.connectivityImage).center,
    );
  }
}
