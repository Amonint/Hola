import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/route/route_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Permite el desplazamiento si es necesario
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3, // 30% de la altura del dispositivo
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Registrarse",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Espacio entre el texto y los botones
              _buildElevatedButton(
                icon: Icon(Icons.email),
                label: "Continuar con Email",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderColor: Colors.black,
              ),
              const SizedBox(height: 16),
              _buildElevatedButton(
                icon: Icon(Icons.apple),
                label: "Continuar con Apple",
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                borderColor: Colors.transparent,
              ),
              const SizedBox(height: 16),
              _buildElevatedButton(
                icon: SvgPicture.asset(
                  'assets/icons/goo.svg',
                  height: 24.0,
                ),
                label: "Continuar con Google",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderColor: Colors.black,
              ),
              const SizedBox(height: 16),
              _buildElevatedButton(
                icon: Icon(
                  Icons.facebook,
                  color: Color.fromARGB(255, 24, 143, 240),
                ),
                label: "Continuar con Facebook",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderColor: Colors.black,
              ),
              const SizedBox(height: 30),
              Text(
                "Al tocar Continuar con Facebook, Google o Apple, aceptas dar a Vibe's Terms of Use and Privacy Policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              const SizedBox(height: 30),
              Text(
                "¿Tienes cuenta?",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, logInScreenRoute);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Text(
                  "Iniciar Sesión",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton({
    required Widget icon,
    required String label,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color borderColor,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, entryPointScreenRoute);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(double.infinity, 52), // Botones ocupan todo el ancho disponible
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Ajuste de padding para mayor flexibilidad
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 10.0), // Espacio entre el icono y el texto
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
