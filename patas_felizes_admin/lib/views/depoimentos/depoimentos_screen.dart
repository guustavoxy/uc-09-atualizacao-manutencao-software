import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class DepoimentosScreen extends StatelessWidget {
  const DepoimentosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de Depoimentos')),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4, // Mock
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.amber, size: 40),
              title: const Text('Ana Silva'),
              subtitle: const Text('Atendimento impecável! O Rex voltou cheiroso e lindo.'),
              trailing: const Text('Nota: 5', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => _mostrarModalDepoimento(context),
      ),
    );
  }

  void _mostrarModalDepoimento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Depoimento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'Nome do Cliente')),
              TextField(decoration: const InputDecoration(labelText: 'Depoimento'), maxLines: 3),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Nota (Estrelas)'),
                items: [1,2,3,4,5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Salvar')),
          ],
        );
      },
    );
  }
}
