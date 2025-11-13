import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({Key? key}) : super(key: key);

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage>
    with SingleTickerProviderStateMixin {
  String _input = '';
  String _result = '';
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = _hitung(_input);
        } catch (e) {
          _result = 'Error';
        }
      } else if (value == '√') {
        final num = double.tryParse(_input);
        if (num != null) {
          _result = _hapusNol(sqrt(num));
        }
      } else if (value == 'x²') {
        final num = double.tryParse(_input);
        if (num != null) {
          _result = _hapusNol(pow(num, 2));
        }
      } else {
        _input += value;
      }
    });
  }

  String _hitung(String ekspresi) {
    ekspresi = ekspresi.replaceAll('×', '*').replaceAll('÷', '/');
    try {
      final parser = RegExp(r'(\d+(\.\d+)?|[+\-*/])');
      final tokens = parser.allMatches(ekspresi).map((m) => m.group(0)!).toList();

      double result = double.parse(tokens[0]);
      for (int i = 1; i < tokens.length; i += 2) {
        final op = tokens[i];
        final num = double.parse(tokens[i + 1]);
        switch (op) {
          case '+':
            result += num;
            break;
          case '-':
            result -= num;
            break;
          case '*':
            result *= num;
            break;
          case '/':
            result /= num;
            break;
        }
      }
      return _hapusNol(result);
    } catch (e) {
      return 'Error';
    }
  }

  String _hapusNol(num value) {
    return (value % 1 == 0) ? value.toInt().toString() : value.toString();
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return ElevatedButton(
      onPressed: () => _onPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.white.withOpacity(0.8),
        foregroundColor: textColor ?? Colors.deepPurple.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        elevation: 2,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonList = [
      ['7', '8', '9', '÷'],
      ['4', '5', '6', '×'],
      ['1', '2', '3', '-'],
      ['0', '.', '=', '+'],
      ['√', 'x²', '⌫', 'C'],
    ];

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFF8F4FF), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _input,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _result,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: buttonList.expand((e) => e).length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                final text = buttonList.expand((e) => e).toList()[index];
                                Color? color;
                                Color? textColor;

                                if (['÷', '×', '-', '+', '=', '√', 'x²']
                                    .contains(text)) {
                                  color = Colors.deepPurple.shade300;
                                  textColor = Colors.white;
                                } else if (text == 'C') {
                                  color = Colors.redAccent.shade200;
                                  textColor = Colors.white;
                                } else if (text == '⌫') {
                                  color = Colors.orangeAccent.shade200;
                                  textColor = Colors.white;
                                }

                                return _buildButton(
                                    text, color: color, textColor: textColor);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
