import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:lorem_ipsum_generator/responsive.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController numLettersController = TextEditingController();
  TextEditingController numParagrafsController = TextEditingController();

  String text = "";

  @override
  void initState() {
    super.initState();
    numLettersController.text = '120';

    numParagrafsController.text = '2';

    generateLorem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lorem Ipsum Generator'),
      ),
      body: Center(
        child: Container(
          width: ResponsiveWidget.tamanhoTela(context),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Wrap(
                    runSpacing: ResponsiveWidget.espacoEntreInputs(context),
                    spacing: ResponsiveWidget.espacoEntreInputs(context),
                    children: [
                      Container(
                        width: ResponsiveWidget.tamanhoInputRow2(context),
                        child: TextFormField(
                          controller: numLettersController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Number of letters",
                              labelText: "Number of letters"),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            generateLorem();
                          },
                        ),
                      ),
                      Container(
                        width: ResponsiveWidget.tamanhoInputRow2(context),
                        child: TextFormField(
                          controller: numParagrafsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Number of paragraphs",
                              labelText: "Number of paragraphs"),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            generateLorem();
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        FlutterClipboard.copy(text).then((value) {
                          print('copied');
                          Toast.show("Copied!",
                              duration: Toast.lengthShort, gravity: Toast.center);
                        });
                      },
                      child: Center(child: AutoSizeText("Copy to clipboard", maxLines: 1,)),
                    ),
                  ),
                  AutoSizeText(text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  generateLorem() {
    setState(() {
      text = lorem(
          paragraphs: int.tryParse(numParagrafsController.text)!,
          words: int.tryParse(numLettersController.text)!);
    });
  }
}
