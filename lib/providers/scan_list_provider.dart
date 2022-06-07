import 'package:flutter/material.dart';
import 'package:qrreaderapp/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';


  Future<ScanModel> newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(newScan);

    newScan.id = id;
    if(this.tipoSeleccionado == newScan.id){
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadScans()async{
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType (String tipo)async{
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  deleteAllScans()async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async{
    await DBProvider.db.deleteScans(id);
  }


}