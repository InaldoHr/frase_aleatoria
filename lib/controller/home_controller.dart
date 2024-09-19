import 'package:frase_aleatoria/model/frase_model.dart';


class HomeController {
  String resultado = "";

  String frase = "";
  String autor = "";

FraseModel fraseobj = FraseModel();

  Future<FraseModel> novaFrase() async{
    // Instanciar OBJ:
    
    fraseobj = await FraseModel.novaFrase();
    
    return fraseobj;
 
  }
}

