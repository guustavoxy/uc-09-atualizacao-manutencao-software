import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FotosScreen extends StatelessWidget {
  const FotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de Fotos')),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isWeb ? 4 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6, // Mock de itens
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Rex - Antes e Depois', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => _mostrarModalAdicionar(context),
      ),
    );
  }

  void _mostrarModalAdicionar(BuildContext context) {
    final nomeController = TextEditingController();
    final imagemController = TextEditingController();
    final instagramController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Nova Foto'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome do Cachorro')),
                TextField(controller: imagemController, decoration: const InputDecoration(labelText: 'Link da Imagem')),
                TextField(controller: instagramController, decoration: const InputDecoration(labelText: 'Link do Instagram')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            ElevatedButton(
              onPressed: () {
                // Aqui você pegaria os valores dos controllers e chamaria o POST na sua API
                // ref.read(fotoControllerProvider.notifier).addFoto(...)
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
