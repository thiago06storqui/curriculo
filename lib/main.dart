import 'package:flutter/material.dart';
import './page/curriculo.dart'; // importa a tela que você criou

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currículo',
      debugShowCheckedModeBanner: false,
      // Aqui definimos a animação de entrada
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CurriculoPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Animação: a tela entra deslizando de baixo para cima
            final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    );
  }
}