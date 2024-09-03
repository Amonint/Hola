import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late GoogleMapController mapController;

  final LatLng _eventLocation =
      const LatLng(-3.983119, -79.197468); // Coordenadas de ejemplo

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1A2E2B), // Fondo oscuro
      body: SafeArea(
        child: Stack(
          children: [
            // Contenido principal
            SingleChildScrollView(
              child: Column(
                children: [
                  // Información de la distancia y estado
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '1 Km, Casa Kambana',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/live.svg',
                            width: screenHeight * 0.06, // Ajusta el tamaño
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Título del evento
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'La Sudada Jungla Urbana',
                      style: TextStyle(
                        fontFamily: 'Mona Sans',
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),

                  // Imagen del evento con íconos superpuestos
                  Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        height: screenHeight * 0.4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/pro3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Etiqueta de género en la parte superior izquierda
                      Positioned(
                        top: screenHeight * 0.04,
                        left: screenWidth * 0.04,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color:Color(0xFFBAE000),
                                size: screenHeight * 0.02,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Reggaeton',
                                style: TextStyle(
                                  fontFamily: 'Mona Sans',
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Íconos de favorito y compartir en la parte superior derecha
                      Positioned(
                        top: screenHeight * 0.03,
                        right: screenWidth * 0.03,
                        child: Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/like.svg',
                                width: screenHeight * 0.04,
                                height: screenHeight * 0.04,
                              ),
                              onPressed: () {
                                // Lógica para favorito
                              },
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/compa.svg',
                                width: screenHeight * 0.04,
                                height: screenHeight * 0.04,
                              ),
                              onPressed: () {
                                // Lógica para compartir
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Detalles del evento
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detalles del Evento:',
                          style: TextStyle(
                            fontFamily: 'Mona Sans Italic',
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'BITTER BABE / col / @tratratrax @bitterbabe_\nJunto a @ssilviaponce & @la.j0ya.',
                          style: TextStyle(
                            fontFamily: 'Mona Sans Italic',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Viernes, 14 jun, 9:30 p.m. GMT+2',
                          style: TextStyle(
                            fontFamily: 'Mona Sans BoldItalic',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Casa Kambana, Vilcabamba',
                          style: TextStyle(
                            fontFamily: 'Mona Sans Italic',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/loca.svg',
                              width: screenHeight * 0.0159,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Loja',
                              style: TextStyle(
                                fontFamily: 'Mona Sans',
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/info.svg',
                              width: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Reggaeton',
                              style: TextStyle(
                                fontFamily: 'Mona Sans',
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/infooo.svg',
                              width: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Este es un evento 16+',
                              style: TextStyle(
                                fontFamily: 'Mona Sans',
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/purta.svg',
                              width: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Apertura de puertas a las 9:30 p. m.',
                              style: TextStyle(
                                fontFamily: 'Mona Sans',
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Ver ubicación en el mapa:',
                          style: TextStyle(
                            fontFamily: 'Mona Sans',
                            color: Colors.white,
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Mapa de Google Maps
                        Container(
                          height: screenHeight * 0.25,
                          width: double.infinity,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _eventLocation,
                              zoom: 15.0,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId('eventLocation'),
                                position: _eventLocation,
                                infoWindow: InfoWindow(
                                  title: 'Casa Kambana',
                                  snippet: 'Vilcabamba',
                                ),
                              ),
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Botón de cierre
            Positioned(
              top: screenHeight * 0.01,
              right: screenWidth * 0.04,
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/botonX.svg',
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.04,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // Botón de preventa
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(255, 0, 0, 0), // Color de fondo del botón
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 0, 0, 0), // Color del botón
                  ),
                  onPressed: () {
                    // Lógica para la acción del botón
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Columna para el texto de preventa y el precio
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preventa 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.017,
                            ),
                          ),
                          Text(
                            '8,50 USD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.025,
                            ),
                          ),
                        ],
                      ),
                      // Flecha SVG a la derecha
                      SvgPicture.asset(
                        'assets/icons/arrow-up.svg',
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.06,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
