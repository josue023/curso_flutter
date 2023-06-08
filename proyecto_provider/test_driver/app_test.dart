import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group("Provando counter provider app", () {
    late final FlutterDriver driver;

    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async{
      //driver.close();
    });

    /*final incrementButton = find.byValueKey("increment");
    final counterText = find.byValueKey("counterText");

    test("probar boton incrementar", () async{
      await driver.tap(incrementButton);

      final readtext = await driver.getText(counterText);
      expect(readtext, "1");
    });*/
    final textfield = find.byValueKey("textfield");

    test("test sobre textField", () async{
      await driver.setTextEntryEmulation(enabled: true);

      await driver.tap(textfield);
      await driver.enterText("esto es un texo en driver");
      await driver. enterText("woow");
    });
  });
}