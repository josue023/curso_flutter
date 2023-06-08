import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/myself.dart';

void main(){
  testWidgets("Probando q aparezca name y age", (WidgetTester widgetTester) async{

    await widgetTester.pumpWidget(Myself(29, "Josue"));

    expect(find.text("Josue"), findsOneWidget);
    expect(find.text("29"), findsWidgets);

    expect(find.byType(Icon), findsNWidgets(1));
  });
}