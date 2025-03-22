import 'package:flutter/material.dart';

class ScaffoldService extends ChangeNotifier {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  void registerScaffoldKey(GlobalKey<ScaffoldState> key) {
    _scaffoldKey = key;
  }

  void openDrawer() {
    _scaffoldKey?.currentState?.openEndDrawer();
  }
}

/// Instancia única del servicio
final scaffoldService = ScaffoldService();
