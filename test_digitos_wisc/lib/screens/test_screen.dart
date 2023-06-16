import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_digitos_wisc/providers/testprovider.dart';

class TestScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final _testProvider = Provider.of<CustomTestProvider>(context);
    final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Página de test"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _testProvider.testStarterd
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_testProvider.testActualString}",
                        style: TextStyle(fontSize: 30),),
                  _testProvider.pruebaTest
                  ? Text("Ejemplo", style: TextStyle(color: Colors.green, fontSize: 18),)
                  : Container(),
                  SizedBox(height: 20,),
                  Text(
                    "${_testProvider.numerosEnPantalla}",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  )
                ],
              )

        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _testProvider.testTerminado
            ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Test Finalizado", style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),),
            )
            : Container(),
            ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Comenzar test"),
                          content: TextField(
                            decoration: InputDecoration(
                              hintText: "Introduce el codigo"
                            ),
                            controller: _textController,
                          ),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  _testProvider.comenzarTest(_textController.text);
                                  Navigator.pop(context);
                                },
                                child: Text("Comenzar")
                            )
                          ],
                        );
                      }
                  );
                },
                child: Text("Comenzar test")
            )
          ],
        ),
      ),


      floatingActionButton: _testProvider.testStarterd ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                onPressed: (){
                  _testProvider.incorrecto();
                },
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: (){
                _testProvider.correcto();
              },
              child: Icon(Icons.done),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      )
      : Container()
    );
  }
}