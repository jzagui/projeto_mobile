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
      ProjectViewFormWidget(),
      ProjectViewFormWidget(),
      ProjectViewFormWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Programação mobile",
        home: Scaffold(
            body:
              Center(
                child:SingleChildScrollView(
                  child: _pages.elementAt(_currentPage),
                ),
              ), 
            appBar: AppBar(title: Text("Atividade 2")),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.announcement), title: Text("Gui")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.cake), title: Text("Jeff")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.cloud), title: Text("Projeto"))
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
    return Container(
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
    );
  }
}

class FormLogin{
  var textLogin = '';
  var textSenha = '';
}
