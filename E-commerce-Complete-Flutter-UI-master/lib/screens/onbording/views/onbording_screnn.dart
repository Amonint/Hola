import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';
import 'package:video_player/video_player.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/gif/background_Vid.mp4')
      ..initialize().then((_) {
        setState(() {}); // Para que se reconstruya el widget después de la inicialización
        _videoController.setLooping(true); // Hacer que el video se repita
        _videoController.setVolume(0.0);
        _videoController.play(); // Reproducir el video automáticamente
      });
  }

  @override
  void dispose() {
    _videoController.dispose(); // Liberar el controlador cuando no se necesite
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_videoController.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          else
            Container(
              color: Colors.black, // Mostrar un fondo negro mientras se carga el video
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '¡Únete a la Fiesta! ',
                              style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'assets/images/confu.png', // Ruta a tu archivo PNG
                              height: 60.0, // Ajusta el tamaño si es necesario
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Crea tu propio evento y comparte con amigos o '
                          'encuentra nuevas experiencias para disfrutar',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 60.0),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signUpScreenRoute);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            "Registrarse",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, logInScreenRoute);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            backgroundColor: Colors.transparent,
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
