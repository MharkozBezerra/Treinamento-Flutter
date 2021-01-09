class Item {
  //**Recebe um tipo de titulo em String */
  String title;
  //**Recebe um valor que intica se está finalizado [true] ou [false] */
  bool done;

  //*Contrutor da classe, recebendo valores direto, sem a necessidade dos gets/sets*/
  Item({this.title, this.done});

//**Constroi um arquivo tipo Jason */
  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }

  /// *Deserializa o dados em json recebebido */
  Map<String, dynamic> toJson() {
    //cria-se uma uma constante imutável
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //passa valores para o maps criado.
    data['title'] = this.title;
    data['done'] = this.done;
    //retorna valor recebido em maps - json
    return data;
  }
}
