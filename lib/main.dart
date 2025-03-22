import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sacanner_pigeon_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔒 Forzar orientación vertical
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation
        .portraitDown, // Opcional, si permitimos invertir el dispositivo
  ]);

  runApp(const MyApp());
}
