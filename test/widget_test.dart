// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:instagram_flutter/app.dart';

void main() {
  testWidgets('A tela de login exibe os elementos principais', (WidgetTester tester) async {
    await tester.pumpWidget(const InstagramApp());

    expect(find.text('InstaGuedes'), findsOneWidget);
    expect(find.text('Entre na sua conta'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Cadastre-se'), findsOneWidget);
  });
}
