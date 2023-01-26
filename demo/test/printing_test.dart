import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:printing_demo/data.dart';
import 'package:printing_demo/examples/document.dart';

void main() {
  testWidgets('Generando el documento PDF', (WidgetTester tester) async {
    const data = CustomData();
    final doc = await generateDocument(PdfPageFormat.a4, data);

    final file = File('curriculum_vitae.pdf');
    file.writeAsBytesSync(doc);
  });
}
