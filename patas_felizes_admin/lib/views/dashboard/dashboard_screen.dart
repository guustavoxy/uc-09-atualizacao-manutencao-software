import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Layout responsivo simples para Web e Mobile
    bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: isWeb ? 4 : 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: const [
            DashboardCard(title: 'Novos Contatos Hoje', value: '15', icon: Icons.person_add),
            DashboardCard(title: 'Acessos Totais', value: '120', icon: Icons.visibility),
            DashboardCard(title: 'Fotos Galeria', value: '34', icon: Icons.photo),
            DashboardCard(title: 'Avaliação Média', value: '4.8', icon: Icons.star),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.orange),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
