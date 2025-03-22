import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:provider/provider.dart'; // 🔥 Importa Provider
import 'generated/l10n.dart';
import 'src/bloc/scann/scann_bloc.dart';
import 'src/presentation/style/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/presentation/services/navigator_service.dart';
import 'src/presentation/services/scaffold_service.dart';
import 'src/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ScannBloc())],
      child: ChangeNotifierProvider.value(
        // 🔥 Agrega ScaffoldService
        value: scaffoldService,
        child: MaterialApp(
          navigatorKey: NavigatorService.navigatorkey,
          showPerformanceOverlay: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate,
            LocaleNamesLocalizationsDelegate()
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          title: 'QR_Scanner',
          initialRoute: '/',
          routes: Routes.routes,
        ),
      ),
    );
  }
}
