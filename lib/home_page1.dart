import 'dart:math';
import 'package:flutter/material.dart';
import 'home_page2.dart';

class HomePage1 extends StatefulWidget {
  final String dica;

  const HomePage1({Key? key, this.dica = ''}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage1> {
  final Map<String, String> palavras = {
    'monitor': 'Utilizamos para ver o que estamos fazendo/assistir coisas m___t_r',
    'gabinete': 'Aquilo em que se monta o conputador g___ne_e',
    'teclado': 'Utilizado para digitar t__l___o',
    'mouse': 'Utilizado para navegar como um pincel m___e',
    'placa-mãe': 'Parte base para um computador p___a-m__e',
  };

  String palavraAtual = '';
  final TextEditingController controller = TextEditingController();

  void sortearPalavra() {
    final random = Random();
    List<String> chaves = palavras.keys.toList();
    String palavraSorteada = chaves[random.nextInt(chaves.length)];

    setState(() {
      palavraAtual = palavraSorteada;
      controller.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    sortearPalavra();
  }

  void verificarResposta(BuildContext context) {
    if (controller.text == palavraAtual) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage2(
            mensagem: 'Parabéns, você acertou!',
            dica: '',
            palavra: palavraAtual,
            acertou: true,
          ),
        ),
      );
      sortearPalavra();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage2(
            mensagem: 'Tente novamente!',
            dica: palavras[palavraAtual]!,
            palavra: palavraAtual,
            acertou: false,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Descubra a Palavra',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Chute uma palavra',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => verificarResposta(context),
                child: Text('Verificar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
