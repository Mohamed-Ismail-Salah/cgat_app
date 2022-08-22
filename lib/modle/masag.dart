import 'package:chat_app/constants.dart';

class MasageModle{
    final String  masagemodel;
    final String  id;
  MasageModle( this.masagemodel,this.id);
  factory MasageModle.formjson(jsonData)  {
    return MasageModle(jsonData[KMasage],jsonData['id']);
}
}