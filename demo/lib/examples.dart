import 'dart:async';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'data.dart';
import 'examples/calendar.dart';
import 'examples/certificate.dart';
import 'examples/document.dart';
import 'examples/invoice.dart';
import 'examples/report.dart';
import 'examples/resume.dart';
import 'examples/resume2.dart';
import 'examples/resume3.dart';

const examples = <Example>[
  Example('INTEGRANTE 1', 'resume.dart', generateResume),
  Example("INTEGRANTE 2", 'resume2.dart', generateResume2),
  //Example('INTEGRANTE 3', 'document.dart', generateDocument),
  //Example('PRUEBA ', 'resume3.dart', generateResume3),

];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}
