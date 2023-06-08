import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/fraction.dart';

void main(){
  group("Testeando fraction", () {
    test("10 dividido entre 2 debe ser 5", (){
      final fraction = Fraction(
          numerator: 10,
          denominator: 2
      );

      expect(fraction.toDouble, 5.0);
    });
    
    test("Negate devuelve el signo opuesto", (){
      final fraction = Fraction(
        numerator: 10,
        denominator: 2
      );

      fraction.negate();
      expect(fraction.toDouble, -5.0);
    });
  });
  
}