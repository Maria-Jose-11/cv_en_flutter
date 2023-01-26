/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../data.dart';

const PdfColor green = PdfColor.fromInt(0xD1A4A4);
const PdfColor gray = PdfColor.fromInt(0x808080);
const PdfColor lightGreen = PdfColor.fromInt(0xD1A4A4);
const PdfColor yellow = PdfColor.fromInt(0xffcdf1e4);
const sep = 190.0;

Future<Uint8List> generateResume2(PdfPageFormat format, CustomData data) async {
  final doc = pw.Document(title: 'CV Mateo', author: 'David PHAM-VAN');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/mateo.jpg')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [


            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.ClipOval(
                          child: pw.Container(
                            width: 200,
                            height: 160,
                            color: lightGreen,
                            child: pw.Image(profileImage)                     
                          ),  
                        ),

                    //----------------------------------------------------------------------
                    pw.SizedBox(height: 30),
                    pw.Header(text: 'Contacto',
                    textStyle: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    
                    pw.Text('Correo: nicolasmcr99@gmail.com                      '),
                    pw.Text('Teléfono: 0983978699                                 '),
                    pw.Text('Ubicación: Quito, Ecuador                          '),
                    pw.Text('LinkedIn: mateo-cueva                               '),
                    pw.Text('GitHub: mateocueva03                                '),
                    //----------------------------------------------------------------------
                    
                    pw.SizedBox(height: 10),

                    //----------------------------------------------------------------------
                    pw.Header(text: 'Software',
                      textStyle: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    
                    pw.Column(children: <pw.Widget>[
                      _Percent(size: 60, value: .9, title: pw.Text('Word')),
                      pw.SizedBox(height: 10),
                      _Percent(
                          size: 60, value: .7, title: pw.Text('Excel')),
                    ]),
                    //----------------------------------------------------------------------

                    pw.SizedBox(height: 10),

                    //----------------------------------------------------------------------
                    pw.Header(text: 'Competencias técnicas',
                    textStyle: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                    
                    pw.Text('• Bases de datos.                               '),
                    pw.Text('• Diseño de interfaces                           '),
                    pw.Text('• Desarrollo de aplicaciones web                   '),
                    //pw.Text('• Desarrollo de aplicaciones \n   móviles               '),
                    pw.Text('• Redes y telecomunicaciones                       '),

                    //----------------------------------------------------------------------


              
                  ],
                ),
              ),

              //----------------------------------------------------------------------
                pw.SizedBox(height: 30),
                pw.Header(text: 'Habilidades blandas',
                  textStyle: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 15),
                ),
                  
                pw.Text('• Iniciativa                                                '),
                pw.Text('• Capacidad de aprendizaje                                      '),
                pw.Text('• Disposición para trabajo en equipo                              '),
                pw.Text('• Adaptación al cambio                                      '),
              //----------------------------------------------------------------------

                pw.SizedBox(height: 10),
              
              //----------------------------------------------------------------------
                pw.Header(text: 'Idiomas',
                  textStyle: pw.Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 15),
                ),
                  
                pw.Column(children: <pw.Widget>[

                      _Percent2(size: 30, value: .9, title: pw.Text('Español')),
                      pw.SizedBox(height: 10),
                      _Percent2(
                          size: 30, value: .7, title: pw.Text('Inglés')),
                ]),
              //----------------------------------------------------------------------
                
                ],
                
              ),
              
              
            ),
            
            pw.Partition(
              width: 23,
              child: pw.Column(),

            ),
            
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 20, bottom: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text('Mateo Cueva R.',
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        pw.Text('Desarrollo de software',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('Estudiante de la carrera de Desarrollo de Software'),
                                pw.Text('Escuela Politecnica Nacional'),
                                pw.Text('Quito, Ecuador'),
                              ],
                            ),
                            pw.Padding(padding: pw.EdgeInsets.zero)
                          ],
                        ),
                  //----------------------------------------------------------------
                      ],
                    ),
                  ),

                  //-------------------------------------------------------------------------
                  
                  //-------------------------------------------------------------------------
                  pw.SizedBox(height: 20),
                  _Category(title: 'Formación Académica'),
                  _Block(
                      title: 'Tecnología Superior en Desarrollo de Software',
                      descripcion: 'Escuela Politécnica Nacional',
                      fecha: '2019 - Presente',
                      icon: const pw.IconData(0xe530)),
                  //--------------------------------------------------------------

                  //-------------------------------------------------------------------------
                  pw.SizedBox(height: 20),
                  _Category(title: 'Experiencia laboral'),
                  _Block(
                      title: 'Sedemi',
                      descripcion: "Pasante en el área de TIC's\nActividades realizadas:\n\t• Mantenimiento preventivo y correctivo\n   de equipos informáticos y de\n   comunicación.\n\t• Soporte técnico a los clientes internos.\n\t• Mantenimiento de Data Center.",
                      fecha: 'De septiembre de 2022 hasta la actualidad',
                      icon: const pw.IconData(0xe530)),
                      pw.SizedBox(height: 10),
                  
                  pw.SizedBox(height: 70),
                  _Category(title: 'Cursos'),
                  _Block(
                      title: 'Fundamentos de electrónica digital',
                      descripcion: 'Fundación Carlos Slim',
                      fecha: 'Julio 2022',
                      icon: const pw.IconData(0xf0cf)),
                      pw.SizedBox(height: 10),
                  _Block(
                      title: 'Algoritmos y estructura de datos',
                      descripcion: 'Escuela de Formación de Tecnólogos, ESFOT',
                      fecha: 'Octubre 2020',
                      icon: const pw.IconData(0xe30d)),
                      pw.SizedBox(height: 10),
                  _Block(
                      title: 'Seguridad informática', 
                      descripcion: 'Escuela de Formación de Tecnólogos, ESFOT',
                      fecha: 'Octubre 2020',
                      icon: const pw.IconData(0xe0ca)),
                  
                 
                  //--------------------------------------------------------------
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resumenew.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    required this.descripcion,
    required this.fecha,
    this.icon,
  });

  final String title;
  final String descripcion;
  final String fecha;
  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),  
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  //Lorem(length: 20),
                pw.Text(fecha),
                pw.Text(descripcion),    
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;
  final double value;
  final pw.Widget title;
  static const fontSize = 1.2;
  PdfColor get color => green;
  static const backgroundColor = PdfColors.grey500;
  static const strokeWidth = 6.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}


class _Percent2 extends pw.StatelessWidget {
  _Percent2({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;
  final double value;
  final pw.Widget title;
  static const fontSize = 1.2;
  PdfColor get color => green;
  static const backgroundColor = PdfColors.grey300;
  static const strokeWidth = 6.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        //width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.LinearProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              valueColor: green,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
