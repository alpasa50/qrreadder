import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); 
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text(scans[i].valor.toString()),
        subtitle: Text(scans[i].id.toString()),
        trailing: Icon(Icons.arrow_right, color: Colors.grey),
        leading: Icon(
          Icons.home_outlined,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () => print(scans[i].id),
      ),
      itemCount: scans.length,
      
    );
  }
}
