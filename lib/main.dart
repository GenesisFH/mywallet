import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mywallet/service/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:mywallet/config/router/app_router.dart';
import 'package:mywallet/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Si es necesario, agrega las opciones de Firebase aquí:
    // options: FirebaseOptions(
    //   apiKey: "your-api-key",
    //   appId: "your-app-id",
    //   messagingSenderId: "your-messaging-sender-id",
    //   projectId: "your-project-id",
    // ),
  );
  runApp(const MainApp());
}

// clase principal de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz de usuario de la aplicación
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Proveedor para el servicio de autenticación
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false, // Desactiva la etiqueta de depuración en la esquina superior derecha
        title: 'My Wallet',
        theme: appTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
