import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/dashboard/dashboard_screen.dart';
import 'views/contatos/contatos_screen.dart';
import 'views/fotos/fotos_screen.dart';
import 'views/depoimentos/depoimentos_screen.dart';

void main() {
  runApp(
    // Necessário para o Riverpod funcionar
    const ProviderScope(child: PatasFelizesApp()),
  );
}

class PatasFelizesApp extends StatelessWidget {
  const PatasFelizesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patas Felizes Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/contatos': (context) => const ContatosScreen(),
        '/fotos': (context) => const FotosScreen(),
        '/depoimentos': (context) => const DepoimentosScreen(),
      },
    );
  }
}
