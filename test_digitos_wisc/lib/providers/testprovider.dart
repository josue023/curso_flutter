import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/models/testcreciente.dart';
import 'package:test_digitos_wisc/models/testdirecto.dart';
import 'package:test_digitos_wisc/models/testinverso.dart';
import 'package:test_digitos_wisc/services/test_services.dart';
import '../models/sujeto.dart';

class CustomTestProvider with ChangeNotifier{

  bool testStarterd = false;
  bool pruebaTest = false;
  String numerosEnPantalla = "";
  bool testTerminado = false;

  Sujeto? sujeto;
  TestServices testServices = TestServices();

  TestDirecto testDirecto = TestDirecto();
  var numerosOrdenDirecto = TestDirecto.numeroOrdenDirecto;

  TestInverso testInverso = TestInverso();
  var numerosOrdenInverso = TestInverso.numeroOrdenInverso;

  TestCreciente testCreciente = TestCreciente();
  var numerosOrdenCreciente = TestCreciente.numeroOrdenCreciente;

  String testActualString = "";
  var _testActual = test.directo;

  get testActual => _testActual;

  //------------ funciones comenzar tests-------------------------
  void comenzarTest(String codigo){

    sujeto = Sujeto(codigo: codigo);
    testStarterd = true;
    testTerminado = false;

    _testActual = test.directo;
    cambiarStringTestActual(_testActual);

    numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    notifyListeners();
  }

  void comenzarTestInverso(){

    _testActual = test.inverso;
    cambiarStringTestActual(_testActual);
    pruebaTest = true;

    numerosEnPantalla = numerosOrdenInverso[0][0].toString();
    notifyListeners();
  }

  void comenzarTestCreciente(){
    _testActual = test.creciente;
    cambiarStringTestActual(_testActual);
    pruebaTest = true;

    numerosEnPantalla = numerosOrdenCreciente[0][0].toString();
    notifyListeners();
  }

  //----------------------------------------------------------

  void correcto(){

    switch(_testActual){
      case test.directo:
        correctoTestDirecto();
        break;
      case test.inverso:
        correctoTestInverso();
        break;
      case test.creciente:
        correctoTestCreciente();
        break;
    }
  }

  void incorrecto(){

    switch(_testActual){
      case test.directo:
        incorrectoTestDirecto();
        break;
      case test.inverso:
        incorrectoTestInverso();
        break;
      case test.creciente:
        incorrectoTestCreciente();
        break;
    }
  }

  void correctoTestDirecto(){
    String resultado = testDirecto.correcto();
    if(resultado == "terminado"){
      comenzarTestInverso();
    }else{
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestDirecto(){
    String resultado = testDirecto.incorrecto();
    if(resultado == "terminado"){
      comenzarTestInverso();
    }else{
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void correctoTestInverso(){
    String resultado = testInverso.correcto();
    if(resultado == "terminado"){
      comenzarTestCreciente();
    }else{
      if(testInverso.contEjemplo == 2){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }

      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestInverso(){
    String resultado = testInverso.incorrecto();
    if(resultado == "terminado"){
      comenzarTestCreciente();
    }else{
      if(testInverso.contEjemplo == 2){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }

      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void correctoTestCreciente(){
    String resultado = testCreciente.correcto();
    if(resultado == "terminado"){
      finalizarTest();
    }else{
      if(testCreciente.contEjemplo == 4){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }

      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestCreciente(){
    String resultado = testCreciente.incorrecto();
    if(resultado == "terminado"){
      finalizarTest();
    }else{
      if(testCreciente.contEjemplo == 4){
        pruebaTest = false;
      }else{
        pruebaTest = true;
      }

      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void cambiarStringTestActual(var tests){
    switch(tests){
      case test.directo:
        testActualString = "Test Directo";
        break;
      case test.inverso:
        testActualString = "Test Inverso";
        break;
      case test.creciente:
        testActualString = "Test Creciente";
        break;
    }
  }

  void finalizarTest(){
    testStarterd = false;
    testTerminado = true;

    sujeto!.puntuacionDirecta = testDirecto.aciertos;
    sujeto!.puntuacionDirectaSpan = testDirecto.span;
    sujeto!.puntuacionInverso = testInverso.aciertos;
    sujeto!.puntuacionInversoSpan = testInverso.span;
    sujeto!.puntuacionCreciente = testCreciente.aciertos;
    sujeto!.puntuacionCrecienteSpan = testCreciente.span;

    testServices.addTest(sujeto!);

    notifyListeners();
  }

}

enum test{
  directo,
  inverso,
  creciente
}