import 'package:flutter/material.dart';

class CurrencyConverterPage2 extends StatefulWidget {
  const CurrencyConverterPage2({super.key});

  @override
  State<CurrencyConverterPage2> createState() => _CurrencyConverterPage2State();
}

class _CurrencyConverterPage2State extends State<CurrencyConverterPage2> {
  double? result;
  final TextEditingController textEditingController = TextEditingController();
  static const double exchangeRate = 277.36;

  void convert() {
    setState(() {
      try {
        result = double.parse(textEditingController.text) * exchangeRate;
      } catch (e) {
        result = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 55, 59),
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white60,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 46, 55, 59),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildResultText(),
            _buildTextField(),
            _buildConvertButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultText() {
    return Text(
      result == null ? 'Invalid input' : 'PKR ${result!.toStringAsFixed(2)}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.monetization_on),
          prefixIconColor: Colors.black,
          hintText: "Enter Amount in USD",
          hintStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }

  Widget _buildConvertButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: convert,
        style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(100, 49)),
          backgroundColor: MaterialStatePropertyAll(Colors.black45),
        ),
        child: const Text(
          "Convert",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
