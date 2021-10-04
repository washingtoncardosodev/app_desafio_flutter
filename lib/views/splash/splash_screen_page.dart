import 'package:app_desafio/views/personagem/personagem_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadSplash();
    super.initState();
  }

  loadSplash() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Route route =
          MaterialPageRoute(builder: (context) => const PersonagemListPage());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/images/marvel.svg",
            width: 180,
          ),
        ),
        const SizedBox(height: 100),
        const CircularProgressIndicator(
          color: Colors.white,
        ),
      ],
    );
  }
}
