import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/route/screen_export.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  final double categoryHeight = 100;
  List<Widget> itemsData = [];

  List<Map<String, dynamic>> Eventos = [
    {
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },
    {
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },
    {
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },{
      "name": "LeQuat",
      "distance": "1km",
      "direccion": "Casa Kambana",
      "image": "assets/images/hu3.jpg"
    },
  ];

  void populateItems() {
    List<Widget> listItems = [];
    for (var event in Eventos) {
      listItems.add(
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, eventDetailScreenRoute);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(event["image"]),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event["name"],
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "${event["distance"]}, ${event["direccion"]}",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/cora.svg",
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print("Botón de ícono presionado");
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 280;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 1;
      });
    });
    populateItems();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF181A1F),
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        toolbarHeight: size.height * 0.18,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, profileScreenRoute);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "•",
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Hey, Jose",
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  // Acción para la ubicación
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "UBICACIÓN",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Vicente Rocafuerte",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 7),
                        SvgPicture.asset(
                          "assets/icons/arrowD.svg",
                          height: 6,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Acción para el carrito
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/Cart Icon.svg",
                    height: 28,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchScreen');
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/iconsSearch.svg",
                    height: 26,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF181A1F),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: itemsData.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  double height = MediaQuery.of(context).size.height;
                  double offset = controller.offset;

                  // Calcular la posición relativa del elemento en la pantalla
                  double itemPosition = offset - index * 350;

                  // Calcular la escala basada en la posición del elemento
                  double scale = (1 - (itemPosition / height).clamp(0.0, 1.0))
                      .clamp(0.8, 1.0);

                  // Ajustar la opacidad basada en la escala
                  double opacity = scale;

                  return Transform.translate(
                    offset: Offset(0, itemPosition / 2),
                    child: Transform.scale(
                      scale: scale,
                      child: Opacity(
                        opacity: opacity,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 350,
                            child: itemsData[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
