import 'package:flutter/material.dart';

class BuscarPage extends StatefulWidget {
  const BuscarPage({super.key});

  @override
  State<BuscarPage> createState() => _BuscarPageState();
}

class _BuscarPageState extends State<BuscarPage> {
  final TextEditingController _pesquisaController = TextEditingController();

  final List<String> assuntos = [
    'Flutter',
    'Dart',
    'UI Design',
    'Mobile',
    'App',
    'Instagram',
    'Reels',
    'Story',
    'Visual',
    'Widgets',
    'Projeto',
    'Design',
  ];

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  List<String> get _itensFiltrados {
    final texto = _pesquisaController.text.trim().toLowerCase();

    if (texto.isEmpty) {
      return assuntos;
    }

    return assuntos.where((item) {
      return item.toLowerCase().contains(texto);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _pesquisaController,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(
                    hintText: 'Pesquisar',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: _itensFiltrados.length,
                itemBuilder: (context, index) {
                  final item = _itensFiltrados[index];
                  final colors = [
                    Colors.blue,
                    Colors.orange,
                    Colors.purple,
                    Colors.pink,
                    Colors.green,
                    Colors.red,
                    Colors.teal,
                    Colors.deepPurple,
                    Colors.amber,
                  ];

                  final color = colors[index % colors.length];

                  return Container(
                    color: color,
                    child: Center(
                      child: Text(
                        item,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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