import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:zyptopulse/bloc/crypto_bloc/index.dart';
import 'package:zyptopulse/bloc/fav_bloc/index.dart';
import 'package:zyptopulse/index.dart';
import 'package:zyptopulse/providers/index.dart';
import 'package:zyptopulse/repository/crypto_repository.dart';
import 'package:zyptopulse/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CryptoBloc(cryptoRepository: CryptoRepository())),
        BlocProvider(create: (_)=>FavBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ThemeProvider()),
          ChangeNotifierProvider(create: (_)=>AuthService()),
          ChangeNotifierProvider(create: (_)=>BottomNavigationProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder:(context,value,_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Zypto Pulse',
              theme: AppTheme().light,
              darkTheme: AppTheme().dark,
              themeMode: value.currentTheme,
              initialRoute: NavigationRoutes.splash,
              getPages: NavigationRoutes.routes,
            );
          },
        ),
      ),
    );
  }
}
