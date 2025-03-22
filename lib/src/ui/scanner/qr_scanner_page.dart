import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../bloc/scann/scann_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dto/scanner/scanned_code_dto.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../presentation/common/custom_paddings.dart';
import '../../presentation/style/labels/custom_colors.dart';
import '../../presentation/widgets/form/elevation_button.dart';
import '../../presentation/widgets/appBars/app_bar_principal.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late Size size;
  ScannedCodeDTO? request;
  late ScannBloc _scannBloc;
  final MobileScannerController controller = MobileScannerController();
  bool hasScanned = false;

  @override
  void initState() {
    super.initState();
    _scannBloc = BlocProvider.of<ScannBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarPrincipal(text: S.of(context).scanningCode),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomPadding.left),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MobileScanner(
                    controller: controller,
                    onDetect: (capture) {
                      if (hasScanned) return;

                      final barcode = capture.barcodes.first;
                      final content = barcode.rawValue;

                      if (content != null) {
                        final type = detectQrType(content);
                        controller.stop();

                        setState(() {
                          hasScanned = true;
                          request = ScannedCodeDTO(
                            content: content,
                            type: type,
                            timestamp: DateTime.now(),
                          );
                        });

                        _scannBloc.add(RegisterCodeEvent(
                            request: request!,
                            succesText: S.of(context).codeAdded,
                            errorText: S.of(context).codeDeleteError));

                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (mounted) Navigator.pop(context, request);
                        });
                      }
                    },
                  ),
                  // Marco del escaneo
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: CustomColors.primary!, width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  // Ayuda visual
                  Positioned(
                    bottom: 24,
                    child: Text(
                      S.of(context).placeQrInFrame,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevationButton(
                    typeLarge: 3,
                    radio: 8,
                    textColor: CustomColors.secundary,
                    backgroundColor: CustomColors.onSegundary,
                    prefixIcon:
                        Icon(Icons.flash_on, color: CustomColors.secundary),
                    text: S.of(context).turnFlash,
                    ontap: () => controller.toggleTorch(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevationButton(
                    backgroundColor: CustomColors.secundary,
                    borderColor: CustomColors.error,
                    typeLarge: 3,
                    radio: 8,
                    textColor: CustomColors.error,
                    prefixIcon: Icon(Icons.cancel, color: CustomColors.error),
                    text: S.of(context).cancel,
                    ontap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  String detectQrType(String qrCode) {
    if (Uri.tryParse(qrCode)?.hasAbsolutePath == true) return "URL";
    if (qrCode.startsWith("mailto:")) return "Correo Electrónico";
    if (qrCode.startsWith("tel:")) return "Teléfono";
    if (qrCode.startsWith("sms:")) return "Mensaje SMS";
    if (qrCode.contains("BEGIN:VCARD")) return "Contacto";
    if (qrCode.startsWith("WIFI:")) return "WiFi";
    if (qrCode.startsWith("geo:")) return "Ubicación";
    if (qrCode.contains("BEGIN:VEVENT")) return "Evento de Calendario";
    return "Texto Plano";
  }
}
