import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _myAppNavigationBar();
  }
  
}

class _myAppNavigationBar extends State<StatefulWidget> {
  int _currentPage;
  var _pages;
  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _pages = [
      //Container(child: Text("Page 1 - Anúncios")),
      FiltroFormWidget(),  
      CompraFormWidget(),
      PedidoFormWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Programação mobile",
        home: Scaffold(
            body:
              Center (
                child: _pages.elementAt(_currentPage),
              ),
              // Center(
              //   child:SingleChildScrollView(
              //     child: _pages.elementAt(_currentPage),
              //   ),
              // ), 
            appBar: AppBar(title: Text("Atividade 2")),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.filter_alt_sharp), title: Text("Filtro")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart), title: Text("Carrinho")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt), title: Text("Pedidos"))
              ],
              fixedColor: Colors.redAccent,
              currentIndex: _currentPage,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            )));
  }

}
class FormData {
  var textItem = '';
  var sliderDistancia = .0;
  var checkPagamentoOnline = false;

}


class FiltroFormWidget extends StatefulWidget {
  final FormData form = new FormData();

  @override
  State<StatefulWidget> createState() {
    return _FiltroFormWidgetState(form);
  }  
}

class _FiltroFormWidgetState extends State<FiltroFormWidget> {
  final FormData form;
  int distancia = 0;

  _FiltroFormWidgetState(this.form);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(10),
      ),
      child:
        Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10),
            child: 
              Column(children: [
                Text("Busca",),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  )
                ),
              ],),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:
              Column(children: [
                Text(
                  "Distancia(km) - $distancia"
                ),
                Slider(
                  min:0,
                  max:20,
                  value: form.sliderDistancia, 
                  onChanged: (double value) {
                    setState(() {
                      form.sliderDistancia = value;
                      distancia = value.round();
                    });
                  }          
                ),
              ],)

          ),
          Container(
            padding: EdgeInsets.all(10),
            child:
              Row(
                children: [
                  Checkbox(
                    onChanged: (bool inValue){
                      setState(() {
                        form.checkPagamentoOnline = inValue;
                      });
                    },
                    value: form.checkPagamentoOnline,
                  ),
                  Text(
                    "Entregar"
                  )
                ],
              ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:
              RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text("Busca"),
                onPressed: (){
                  print('aaaaaaaaa'); 
                }
              )
              
          ),
          
        ],)
      )
    );
  }
}

class FormLogin{
  var textLogin = '';
  var textSenha = '';
}


class LoginFormWidget{

}


class PedidoItem{
  var numero = 0;
  var valor = .0;
  var status = 'aberto';
}

class PedidoFormWidget extends StatefulWidget{
  // var itens = ['1','2','3']

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PedidoFormWidget();
  }

}

class _PedidoFormWidget extends State<PedidoFormWidget>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
          itemPedido(10, 10.0, "Fechado",context),
          itemPedido(11, 30.0, "Fechado",context),
          itemPedido(12, 23.0, "Fechado",context),
          itemPedido(13, 44.0, "Cancelado",context),
          itemPedido(14, 193.0, "Fechado",context),
          itemPedido(14, 193.0, "Fechado",context),
      ],
    );
  }

}

Widget itemPedido(numero,valor,status, context){
  return ListTile(
    leading: Icon(Icons.arrow_forward_ios_sharp),
    title: Text('$numero - R\$$valor - $status'),
    onLongPress: (){
      print('aaaaa');
      AlertDialog(
        title: Text("Resposta Requerida"),
        content: Text("Você aceitaria?"),
        actions: [ 
          // FlatButton("Sim"),
          // FlatButton("Não"),
        ],
        elevation: 24.0,
        backgroundColor: Colors.blue,
        shape: CircleBorder()
      );
    },
  );
}

class CompraFormWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CompraFormWidget();
  }
}

class _CompraFormWidget extends State<CompraFormWidget>{
  var total = 0.50;
  var cartoes = ['cartao1','cartao2','cartao3',];
  var dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400.0,
          child:ListView(
              children: [
                itemCompra('alface', 10.0, 25,context),
                itemCompra('alface', 30.0, 25,context),
                itemCompra('alface', 23.0, 25,context),
                itemCompra('alface', 44.0, 25,context),
                itemCompra('alface', 193.0, 25,context),
                itemCompra('alface', 193.0, 25,context),
              ]
            )
        ),
        Divider(
          color: Colors.black
        ),
        Text('Total $total'),
        Row(
          children:[
            Text('Cartão'),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
          
        ),
        RaisedButton(
          color: Colors.greenAccent,
          textColor: Colors.white,
          child: Text("Confirmar Pedido"),
          onPressed: (){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.grey,
                duration: Duration(seconds: 5),
                content: Text("Pedido Confirmado"),
                
              )
            );
          }
        )

      ],
    );
  }

}

Widget itemCompra(nome,quantidade,valor, context){
  return ListTile(
    leading: Icon(Icons.arrow_forward_ios_sharp),
    title: Row(
      children: [
        Text('$nome - R\$$valor - $quantidade'),
        RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text("X"),
          onPressed: (){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.grey,
                duration: Duration(seconds: 5),
                content: Text("Deseja realmente excluir o item ?"),
                action: SnackBarAction(
                  label: "Confirmar!",
                  onPressed: () {
                    print("Excluido");
                  }
                )
              )
            );
          }
        ),
      ],
    )
  );
}

Widget listaItem(){
  return ListView(
    children: [
      ListTile(
        leading: Icon(Icons.arrow_forward_ios_sharp),
        title: Text("alface")
      ),
      ListTile(
        leading: Icon(Icons.arrow_forward_ios_sharp),
        title: Text("tomate")
      ),
      ListTile(
        leading: Icon(Icons.arrow_forward_ios_sharp),
        title: Text("Rucula")
      ),
      ListTile(
        leading: Icon(Icons.arrow_forward_ios_sharp),
        title: Text("maçã")
      ),

    ],
  );

}