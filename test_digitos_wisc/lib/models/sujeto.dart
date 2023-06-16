class Sujeto{

  final String _codigo;

  String get codigo => _codigo;

  int _puntuacionDirecta = 0;
  int _puntuacionDirectaSpan = 0;
  int _puntuacionInverso = 0;
  int _puntuacionInversoSpan = 0;
  int _puntuacionCreciente = 0;
  int _puntuacionCrecienteSpan = 0;


  Sujeto({required String codigo}):
      _codigo = codigo;

  int get puntuacionDirecta => _puntuacionDirecta;

  int get puntuacionCrecienteSpan => _puntuacionCrecienteSpan;

  set puntuacionCrecienteSpan(int value) {
    _puntuacionCrecienteSpan = value;
  }

  int get puntuacionCreciente => _puntuacionCreciente;

  set puntuacionCreciente(int value) {
    _puntuacionCreciente = value;
  }

  int get puntuacionInversoSpan => _puntuacionInversoSpan;

  set puntuacionInversoSpan(int value) {
    _puntuacionInversoSpan = value;
  }

  int get puntuacionInverso => _puntuacionInverso;

  set puntuacionInverso(int value) {
    _puntuacionInverso = value;
  }

  int get puntuacionDirectaSpan => _puntuacionDirectaSpan;

  set puntuacionDirectaSpan(int value) {
    _puntuacionDirectaSpan = value;
  }

  set puntuacionDirecta(int value) {
    _puntuacionDirecta = value;
  }
}