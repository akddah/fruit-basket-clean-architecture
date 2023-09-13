import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../presentations/global/connectivity_screen.dart';
import 'package:restart_app/restart_app.dart';

import '../utils/restart_app.dart';

class ConnectivityService {
  static final i = ConnectivityService._();

  ConnectivityService._();
  init() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
      if (result == ConnectivityResult.mobile) {
        // Navigator.of(navigator.currentContext!).push(MaterialPageRoute(
        //   builder: (context) => const ConnectivityScreen(),
        // ));
        Restart.restartApp();
      } else if (result == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        Restart.restartApp();
      } else if (result == ConnectivityResult.ethernet) {
        // I am connected to a ethernet network.
        Restart.restartApp();
      } else if (result == ConnectivityResult.vpn) {
        // I am connected to a vpn network.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
        Restart.restartApp();
      } else if (result == ConnectivityResult.bluetooth) {
        // I am connected to a bluetooth.
        Restart.restartApp();
      } else if (result == ConnectivityResult.other) {
        // I am connected to a network which is not in the above mentioned networks.
        Restart.restartApp();
      } else if (result == ConnectivityResult.none) {
        Navigator.of(navigator.currentContext!).push(MaterialPageRoute(
          builder: (context) => const ConnectivityScreen(),
        ));
      }
    });
  }
}
