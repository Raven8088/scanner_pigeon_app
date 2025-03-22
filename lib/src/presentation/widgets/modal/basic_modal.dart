import 'package:flutter/material.dart';
import '../../services/navigator_service.dart';
import '../../style/labels/custom_colors.dart';

void customModallBotton(
    {required Widget widget,
    bool withIcon = true,
    Function()? closeEvent,
    bool back = true,
    bool isDismissible = true,
    double topRadius = 10,
    Color? color,
    double height = 0.95}) {
  final navigator = NavigatorService.navigatorkey.currentContext;
  if (navigator != null) {
    final tickerProvider =
        navigator.findAncestorStateOfType<TickerProviderStateMixin>();
    if (tickerProvider != null) {
      showModalBottomSheet(
        isDismissible: isDismissible,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: navigator,
        transitionAnimationController: AnimationController(
          vsync: tickerProvider,
          duration: const Duration(milliseconds: 300),
        ),
        builder: (BuildContext context) {
          var boxDecoration = BoxDecoration(
            //border: Border.all(color: color ?? Colors.transparent),
            color: color ?? CustomColors.secundary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRadius),
              topLeft: Radius.circular(topRadius),
            ),
          );

          return DraggableScrollableSheet(
            initialChildSize: height,
            maxChildSize: height,
            minChildSize: height,
            expand: false,
            builder: (context, scrollController) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: PopScope(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * height,
                      decoration: boxDecoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: 43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:
                                      CustomColors.containerBackgroundDisable,
                                ),
                                child: const SizedBox(
                                  width: 43,
                                  height: 5,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: widget,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ).then((value) {
        // Función para cerrar el modal
        if (closeEvent != null) {
          closeEvent();
        }
      });
    }
  }
}
