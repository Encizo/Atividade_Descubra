import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  final String mensagem;
  final String dica;
  final String palavra;
  final bool acertou;

  const HomePage2({
    Key? key,
    required this.mensagem,
    required this.dica,
    required this.palavra,
    required this.acertou,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Resultado',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mensagem, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              if (!acertou) ...[
                Text('Dica: $dica', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, dica);
                },
                child: Text(acertou ? 'Tentar novamente' : 'Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
