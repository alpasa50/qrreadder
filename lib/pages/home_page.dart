import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/pages/direcciones_page.dart';
import 'package:qrreaderapp/providers/db_provider.dart';
import 'package:qrreaderapp/providers/scan_list_provider.dart';
import 'package:qrreaderapp/providers/ui_provider.dart';
import 'package:qrreaderapp/widgets/custom_navigatorbar.dart';
import 'package:qrreaderapp/widgets/scan_button.dart';

import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Historial"),
        actions: [
          IconButton(onPressed: () {
            Provider.of<ScanListProvider>(context, listen: false).deleteAllScans();

          }, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: const ScanButton(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context);


    switch (currentIndex){

      case 0: 
        scanListProvider.loadScansByType('geo');
        return MapasPage();

      case 1:
        scanListProvider.loadScansByType('http');
        return DireccionesPage();

      default:
        return MapasPage();  
    }
  }
}