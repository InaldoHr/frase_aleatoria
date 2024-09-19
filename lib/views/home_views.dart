import 'package:flutter/material.dart';
import 'package:frase_aleatoria/controller/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {

  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _atualizar();
  }

  void _atualizar() async {
    _controller.fraseobj = await _controller.novaFrase();
    setState(() {
      _controller.frase = _controller.fraseobj.frase!;
      _controller.autor = _controller.fraseobj.autor!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Racionais Frases',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/racionais.png'),
          ),
          Center(
            child: Text(
              'Clique para gerar uma frase',
              style: GoogleFonts.pirataOne(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 224, 15, 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                _controller.frase,
                style: GoogleFonts.pirataOne(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 95, 0, 0),
                    ),
                  ]
                ),
              ),
            ),
          ),
          Center(
            child: Text(_controller.autor,
                style: GoogleFonts.pirataOne(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                )),
          ),
          Container(
            height: 100,
          ),
          Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 224, 15, 15),
                foregroundColor: Colors.white,
              ),
              
              onPressed: _atualizar,
              child: const Text('Gerar Frase'),
            ),
          )
        ],
      ),
    );
  }
}


