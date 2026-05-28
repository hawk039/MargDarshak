import 'package:flutter_test/flutter_test.dart';

import 'package:marg_darshak/app/app.dart';

void main() {
  testWidgets('renders Marg Darshak splash shell', (tester) async {
    await tester.pumpWidget(const MargDarshakApp());
    await tester.pump();

    expect(find.text('Marg Darshak'), findsOneWidget);
    expect(find.text("'A calm companion for inner reflection'"), findsOneWidget);
  });
}
