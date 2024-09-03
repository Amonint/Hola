import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Cambia el fondo a negro
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              // Header Image
              Image.asset(
                'assets/images/jose.jpg',
                height: screenHeight * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // Top Close Button
              Positioned(
                top: screenHeight * 0.05,
                right: screenWidth * 0.04,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/botonX.svg',
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.08,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              // Bottom Share and Settings Buttons
              Positioned(
                bottom: screenHeight * 0.02,
                right: screenWidth * 0.04,
                child: Column(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/Group377.svg',
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.08,
                      ),
                      onPressed: () {
                        // Lógica para compartir
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/masboton.svg',
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.08,
                      ),
                      onPressed: () {
                        // Lógica para abrir ajustes
                      },
                    ),
                  ],
                ),
              ),

              // User Name and Genres
              Positioned(
                bottom: screenHeight * 0.01,
                left: screenWidth * 0.04,
                right: screenWidth * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jose Rojas',
                      style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.003),
                  ],
                ),
              ),
            ],
          ),

          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Text(
              'Eventos Asistidos',
              style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Cambia el color del texto a blanco
              ),
            ),
          ),

          // Events Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: screenWidth * 0.02,
              mainAxisSpacing: screenHeight * 0.02,
              children: [
                EventCard(
                    imagePath: 'assets/images/hu3.jpg',
                    eventName: 'La Sudada Jungla\nUrbana - Quito'),
                EventCard(
                    imagePath: 'assets/images/profile1.jpg',
                    eventName: 'LeQuat-Loja'),
                EventCard(
                    imagePath: 'assets/images/ty4.jpg',
                    eventName: 'Subterra - Barcelona'),
                EventCard(
                    imagePath: 'assets/images/pro3.jpg',
                    eventName: 'Dyedsoundorom'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String label;

  GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Chip(
      backgroundColor: Color(0xFF2C2C2E), // Dark grey background
      avatar: CircleAvatar(
        backgroundColor: Color(0xFFD9CBB7), // Light beige circle color
        radius: screenHeight * 0.007,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'HelveticaNeue', // Applying the custom font
          color: Color(0xFFD9CBB7), // Light beige text color
          fontSize: screenHeight * 0.017,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String eventName;

  EventCard({required this.imagePath, required this.eventName});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight * 0.01),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black.withOpacity(0.5),
          padding: EdgeInsets.all(screenHeight * 0.005),
          child: Text(
            eventName,
            style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.017),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
