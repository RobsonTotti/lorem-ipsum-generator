import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget(
      {Key? key, this.largeScreen, this.mediumScreen, this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static double tamanhoTela(context) {
    Size screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? screenSize.width * 1
        : screenSize.width * 0.5;
  }

  static double alturaTela(context) {
    return MediaQuery.of(context).size.height;
  }

  static double larguraTela(context, tamanho) {
    Size screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? screenSize.width * 1
        : screenSize.width / tamanho;
  }

  // tamanho que os inputs tem em uma row com 3 inputs
  static double tamanhoInputRow2(context) {
    double tela = tamanhoTela(context);

    double pdBody = paddingBody(context);
    double espEntreInputs = espacoEntreInputs(context);

    return ResponsiveWidget.isSmallScreen(context)
        ? tela + pdBody * 2
        : (tela - pdBody * 2 - espEntreInputs) / 2;
  }

// tamanho para os campos maiores de uma row com dois itens grandes e um menor
  static double tamanhoInputRow2e5(context) {
    double tela = tamanhoTela(context);

    double pdBody = paddingBody(context);
    double espEntreInputs = espacoEntreInputs(context);

    return ResponsiveWidget.isSmallScreen(context)
        ? tela + pdBody * 2
        : (tela - pdBody * 2 - espEntreInputs) / 2.5;
  }

  // tamanho que os inputs tem em uma row com 3 inputs
  static double tamanhoInputRow3(context) {
    double tela = tamanhoTela(context);

    double pdBody = paddingBody(context);
    double espEntreInputs = espacoEntreInputs(context);

    return ResponsiveWidget.isSmallScreen(context)
        ? tela + pdBody * 2
        : (((tela - 1) - pdBody * 2) - espEntreInputs * 2) / 3;
  }

  static double paddingBody(context) {
    return 24;
  }

  static double espacoEntreInputs(context) {
    return 16;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen!;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen!;
        } else {
          return smallScreen!;
        }
      },
    );
  }
}
