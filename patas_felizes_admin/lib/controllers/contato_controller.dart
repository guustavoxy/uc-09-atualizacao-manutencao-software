import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/contato.dart';
import '../core/api/api_service.dart';

final contatoControllerProvider = 
  StateNotifierProvider<ContatoController, AsyncValue<List<Contato>>>((ref) {
    return ContatoController(ref.read(apiServiceProvider));
});

class ContatoController extends StateNotifier<AsyncValue<List<Contato>>> {
  final ApiService _api;

  ContatoController(this._api) : super(const AsyncValue.loading()) {
    fetchContatos();
  }

  Future<void> fetchContatos() async {
    try {
      state = const AsyncValue.loading();
      final response = await _api.dio.get('contatos');
      final contatos = (response.data as List)
          .map((e) => Contato.fromJson(e))
          .toList();
      state = AsyncValue.data(contatos);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> deleteContato(String id) async {
    try {
      await _api.dio.delete('contatos/$id');
      // Recarrega a lista após exclusão
      await fetchContatos();
    } catch (e) {
      // Exibir snackbar ou erro customizado
    }
  }
}
