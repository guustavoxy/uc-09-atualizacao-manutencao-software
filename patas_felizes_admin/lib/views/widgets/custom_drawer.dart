import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Text(
              'Patas Felizes\nPainel Admin',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contatos (Leads)'),
            onTap: () => Navigator.pushReplacementNamed(context, '/contatos'),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Fotos Antes e Depois'),
            onTap: () => Navigator.pushReplacementNamed(context, '/fotos'),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Depoimentos'),
            onTap: () => Navigator.pushReplacementNamed(context, '/depoimentos'),
          ),
        ],
      ),
    );
  }
}
