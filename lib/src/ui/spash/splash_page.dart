import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../presentation/style/labels/custom_colors.dart';
import '../../presentation/style/labels/custom_labels.dart';
import 'package:sacanner_pigeon_app/src/presentation/services/navigation_push.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showCheck = false;

  @override
  void initState() {
    super.initState();

    // 1. Mostrar Lottie por 2 segundos
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showCheck = true;
      });

      // 2. Mostrar ícono por 1 segundo más
      Timer(const Duration(seconds: 1), () {
        NavigationService(newRoute: "/LoginPage").pushAndRemoveUntil();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _showCheck
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Icon(
                        Icons.check_circle_outline,
                        key: const ValueKey("check"),
                        size: 200,
                        color: CustomColors.success,
                      ),
                    )
                  : Lottie.asset(
                      'assets/lotties/splash.json',
                      key: const ValueKey("lottie"),
                      width: 300,
                      height: 300,
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              "QR Scanner",
              style: CustomLabels.h4!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
