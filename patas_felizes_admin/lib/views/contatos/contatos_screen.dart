import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/contato_controller.dart';
import '../widgets/custom_drawer.dart';

class ContatosScreen extends ConsumerWidget {
  const ContatosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contatosState = ref.watch(contatoControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestão de Contatos')),
      drawer: const CustomDrawer(),
      body: contatosState.when(
        data: (contatos) {
          if (contatos.isEmpty) {
            return const Center(child: Text('Nenhum contato encontrado.'));
          }
          return ListView.separated(
            itemCount: contatos.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final contato = contatos[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(contato.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contato.email),
                    Text(contato.mensagem, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    ref.read(contatoControllerProvider.notifier).deleteContato(contato.id);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erro ao carregar contatos: $err')),
      ),
    );
  }
}
