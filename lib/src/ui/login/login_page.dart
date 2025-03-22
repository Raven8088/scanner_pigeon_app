import '../../../pigeon_api.g.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../presentation/common/custom_paddings.dart';
import '../../presentation/services/navigation_push.dart';
import '../../presentation/style/labels/custom_colors.dart';
import '../../presentation/style/labels/custom_labels.dart';
import '../../presentation/widgets/form/elevation_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isAuthenticating = false;
  String _statusMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_statusMessage.isEmpty) {
      _statusMessage = S.of(context).mustAuthenticate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomPadding.left,
          vertical: 32,
        ),
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 200, color: CustomColors.surface),
              const SizedBox(height: 32),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: CustomLabels.bodyText1!
                    .copyWith(color: CustomColors.onSegundary),
              ),
              const SizedBox(height: 48),
              ElevationButton(
                typeLarge: 2,
                radio: 4,
                text: S.of(context).authenticate,
                backgroundColor: CustomColors.secundary,
                borderColor: CustomColors.onSegundary,
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: CustomColors.primary!,
                  size: 30,
                ),
                ontap: _isAuthenticating ? null : _authenticate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
      _statusMessage = S.of(context).authenticating;
    });

    try {
      final api = BiometricAuthApi();
      final result = await api.authenticate();

      if (result.success == true) {
        setState(() {
          _statusMessage = S.of(context).accessGranted;
        });

        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          NavigationService(newRoute: "/ScannerPage").pushAndRemoveUntil();
        }
      } else {
        setState(() {
          _statusMessage =
              "❌ ${result.errorMessage ?? S.of(context).authFailed}";
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = "⚠️ ${S.of(context).unexpectedError}: $e";
      });
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }
}
