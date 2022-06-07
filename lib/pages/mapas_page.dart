import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); 
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction){
          Provider.of<ScanListProvider>(context, listen: false).deleteScansById(scans[i].id!.toInt());
        },
        child: ListTile(
          title: Text(scans[i].valor.toString()),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.arrow_right, color: Colors.grey),
          leading: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () => print(scans[i].id),
        ),
      ),
      
    );
  }
}
