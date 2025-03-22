import 'package:intl/intl.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../bloc/scann/scann_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/common/assetspath.dart';
import '../../presentation/common/custom_paddings.dart';
import '../../presentation/services/navigation_push.dart';
import '../../presentation/style/labels/custom_labels.dart';
import '../../presentation/style/labels/custom_colors.dart';
import '../../presentation/widgets/form/elevation_button.dart';
import '../../presentation/widgets/appBars/app_bar_principal.dart';
import '../../presentation/widgets/modal/basic_modal.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late Size size;
  late ScannBloc _scannBloc;

  @override
  void initState() {
    super.initState();
    _scannBloc = BlocProvider.of<ScannBloc>(context);
    _scannBloc.add(LoadCodesEvent());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarPrincipal(text: "Escáner QR"),
      body: BlocBuilder<ScannBloc, ScannState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: CustomPadding.left,
              right: CustomPadding.right,
            ),
            child: Column(
              children: [
                _scannerHeader(),
                const SizedBox(height: 24),
                if (state.messageFeedback.trim() != "")
                  feedBack(
                      message: state.messageFeedback,
                      messageIsError: state.messageIsError),
                Expanded(child: _codeList()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget feedBack({required String message, required bool messageIsError}) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: (messageIsError
              ? CustomColors.error
              : CustomColors.success!.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              messageIsError ? Icons.error_outline : Icons.check_circle_outline,
              color: messageIsError
                  ? CustomColors.secundary
                  : CustomColors.success,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                message,
                style: CustomLabels.h6!.copyWith(
                  color: messageIsError
                      ? CustomColors.secundary
                      : CustomColors.success,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scannerHeader() {
    return Column(
      children: [
        Image.asset(
          assetsPngPath(
            image: "logo",
          ),
          color: CustomColors.error,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 40),
        Text(
          S.of(context).addCode,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 32),
        ElevationButton(
          typeLarge: 2,
          prefixIcon: Icon(
            Icons.qr_code,
            color: CustomColors.secundary,
          ),
          text: S.of(context).scancode,
          ontap: () {
            NavigationService(newRoute: "/QrScannerPage").pushRedirect();
          },
        ),
      ],
    );
  }

  Widget _codeList() {
    return BlocBuilder<ScannBloc, ScannState>(
      builder: (context, state) {
        if (state.codes.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noCodes,
              style: CustomLabels.caption,
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          itemCount: state.codes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (BuildContext context, int i) {
            final code = state.codes[i];
            return Card(
              color: CustomColors.concavas,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Información del código
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoRow(S.of(context).id, code.id.toString()),
                          _infoRow(S.of(context).type, code.type),
                          _infoRow(
                            S.of(context).date,
                            DateFormat.yMMMMd().add_jm().format(code.timestamp),
                          ),
                        ],
                      ),
                    ),

                    // Botón de eliminar
                    IconButton(
                      icon: Icon(Icons.delete, color: CustomColors.error),
                      onPressed: () {
                        customModallBotton(
                          height: 0.40,
                          widget: confirmDeleteDialog(
                            onConfirm: () {
                              Navigator.of(context).pop(); // Cierra el modal
                              _scannBloc.add(DeleteCodeEvent(
                                  request: code,
                                  succesText: S.of(context).codeDeleted,
                                  errorText: S.of(context).codeDeleteError));
                            },
                            onCancel: () {
                              Navigator.of(context).pop(); // Solo cerrar
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Wrap(
        spacing: 8,
        children: [
          Text(label, style: CustomLabels.h6),
          Text(
            value,
            style: CustomLabels.caption,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget confirmDeleteDialog({
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    return Padding(
      padding: EdgeInsets.all(CustomPadding.right),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded,
              size: 60, color: CustomColors.error),
          const SizedBox(height: 16),
          Text(
            S.of(context).deleteConfirmationTitle,
            style: CustomLabels.h5!.copyWith(color: CustomColors.error),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).deleteConfirmationMessage,
            style: CustomLabels.bodyText1,
            textAlign: TextAlign.center,
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
                  text: S.of(context).cancel,
                  ontap: onCancel,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevationButton(
                  typeLarge: 3,
                  radio: 8,
                  backgroundColor: CustomColors.error,
                  textColor: Colors.white,
                  text: S.of(context).delete,
                  prefixIcon: const Icon(Icons.delete, color: Colors.white),
                  ontap: onConfirm,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
