import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:tw_wallet_ui/main.dart';
import 'package:tw_wallet_ui/router/routers.dart';

void main() {
  testWidgets('show login page properly', (WidgetTester tester) async {
    await tester.pumpWidget(TWallet(initialRoute: Routes.magicLinkLogin));

    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('should init magic auth store', (tester) async {
    await tester.pumpWidget(TWallet(initialRoute: Routes.magicLinkLogin));

    expect(Magic.instance, isNotNull);
  });

  testWidgets('should show login verification message', (tester) async {
    await tester.pumpWidget(TWallet(initialRoute: Routes.magicLinkLogin));

    await tester.enterText(find.byType(TextField), '111@1.com');
    await tester.tap(find.text('Login'));

    expect(find.text('Check your email'), findsOneWidget);
  });
}
