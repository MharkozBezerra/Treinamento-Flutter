import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_agenda/models/item.dart';
import 'dart:convert'; //Import para dados json.

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Remoce [icone de debug]
      debugShowCheckedModeBanner: false,
      title: "ChekList Flutter",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //cria-se variavel do objeto item
  var items = new List<Item>();
  //Iniai-se  no construtor
  HomePage() {
    //Inicializa-se os item sem nenhum dado.
    items = [];
    //Adiciona-se 3 itens de  forma manual.
    //items.add(Item(title: "Item I", done: false));
    //items.add(Item(title: "Item II", done: true));
    //items.add(Item(title: "Item III", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  _HomePageState() {
    //Ao criar o arquivo em memória, informação é salva.
    loadMemorie();
  }

  void addItem() {
    setState(() {
      //Se estiver vazio, não faz o  precedimento e retona o valor nullo
      if (newTaskCtrl.text.isEmpty) {
        return;
      } else {
        //Adiciona o item a lista
        widget.items.add(
          Item(title: newTaskCtrl.text, done: false),
        );
        //limpa o botão.
        newTaskCtrl.text = "";
        //Salva o dados em memória interna
        saveMemory();
      }
    });
  }

  //Excluiro item desejado
  void delItem(int index) {
    setState(() {
      widget.items.removeAt(index);
      //Salva o dados em memória interna
      saveMemory();
    });
  }

  Future loadMemorie() async {
    //Atribui valores, salvo em memória interna.
    var prefs = await SharedPreferences.getInstance();
    //lê os arquivos encontrados na mamoria
    var data = prefs.getString('data');

    //Verica se informação é nula
    if (data != null) {
      //Passa dados encontrado em formato Json
      Iterable decoded = jsonDecode(data);
      //Cria-se uma lista para ser popular itens salvo em memória.
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      //Atualiza a página com o item salvo em memória interna.
      setState(() {
        widget.items = result;
      });
    }
  }

  saveMemory() async {
    //Busca dados que  estiver salvo na memória.
    var prefs = await SharedPreferences.getInstance();
    //percorre o dados atrás do dado para salvar.
    await prefs.setString('data', jsonEncode(widget.items));
  }

  @override
  Widget build(BuildContext context) {
    //use Scaffold sempre que estiver uma página na tela.
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          //seta ID do editText
          controller: newTaskCtrl,
          //seta o tipo de teclado que será usado
          keyboardType: TextInputType.text,
          //define o estilo do botão
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          //Cria-se a hinit do editText
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        //Realiza a contagem da lista que vem da classe pai
        itemCount: widget.items.length,
        //Renderiza a lista na tela, passando o contexto e o índice do item selecionado
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          //Dismissible [usado como efeito deslizante da checkbox]
          return Dismissible(
            //Retona  na tela uma caixa de listagem selecionável
            child: CheckboxListTile(
              //Texto que irá ser mostrado
              title: Text(item.title),
              //Mostra-se o valor do checkbox
              value: item.done,
              //Interação do usuário após clicar no item selecionado
              onChanged: (value) {
                //informar que o item está sendo mudado e  realiza a mudandança do item
                setState(() {
                  //item realiza mudança do item
                  item.done = value;
                  //Salva o dados em memória interna
                  saveMemory();
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
              child: Text("Arraste para excluir ;) "),
            ),
            onDismissed: (direction) {
              delItem(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
