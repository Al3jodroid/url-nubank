import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  ConnectivityProvider() {
    Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _isConnected = false;
      } else {
        _isConnected = true;
      }
      notifyListeners();
    });
  }
}
