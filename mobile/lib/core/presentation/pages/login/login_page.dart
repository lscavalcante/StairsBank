import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/pages/home/home_page.dart';
import 'package:stairsbank/core/presentation/theme/spaces.dart';
import 'package:stairsbank/core/presentation/theme/text_custom.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/shared/components/button/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Button(
                child: Text(
                  "Login",
                  style: TextCustom(context).button,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                },
              ),
              const SpacerVertical.normal(),
              Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  style: TextCustom(context).info,
                  children: [
                    TextSpan(
                      text: "Signup",
                      style: TextCustom(context).info.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
        backgroundColor: ThemeColors.blueSemiLight,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                height: 150,
              ),
              Text(
                "Login",
                style: TextCustom(context).title,
              ),
              const SpacerVertical.normal(),
              Text(
                "Set a name for your profile, here's the password",
                style: TextCustom(context).info,
                textAlign: TextAlign.center,
              ),
              const SpacerVertical.normal(),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF727E96).withOpacity(
                          0.4), // Defina a cor da borda quando não estiver selecionado
                      width: 1.0, // Defina a espessura da borda
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  labelText: "Login",
                  hintText: "Write your email...",
                ),
              ),
              const SpacerVertical.normal(),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF727E96).withOpacity(
                          0.4), // Defina a cor da borda quando não estiver selecionado
                      width: 1.0, // Defina a espessura da borda
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  labelText: "Password",
                  hintText: "Write your password...",
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.right,
                  style: TextCustom(context).info,
                ),
              ),
              const SpacerVertical.normal(),
            ],
          ),
        ),
      ),
    );
  }
}
