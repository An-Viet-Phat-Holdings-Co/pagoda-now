import 'package:flutter_test/flutter_test.dart';
import 'package:pagoda_now/app/app.dart';

void main() {
  testWidgets('Homepage loads with Pagoda Now title and Home text',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const PagodaNowApp());

    // Wait for rendering
    await tester.pumpAndSettle();

    // Verify the title
    expect(find.text('Pagoda Now'), findsOneWidget);

    // Verify that "Home" appears somewhere (AppBar or body)
    expect(find.text('Home'), findsWidgets);
  });
}
