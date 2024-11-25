import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Expanded(child: Image.network('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBp3RvPnaG_hz7PLQnsminoLnrDpfdexeSr5XYM6-ADKz20raH5LIdTQV6x1i_Hf0kC_C4PhHWQ9zTjhuKw-954gZLkb2m4DYHVEVk_q4q6MYvJn17xk2nCBL1DyajNYF3yieAUn2fOM9n/s120/%25D8%25B5%25D9%2588%25D8%25B1+%25D9%2582%25D9%2585%25D8%25B1+%25D9%2588%25D8%25BA%25D9%258A%25D9%2588%25D9%2585+%25D9%2588%25D8%25B1%25D8%25AF%25D9%258A%25D8%25A9+%25D9%2581%25D9%258A+%25D8%25A7%25D9%2584%25D9%2586%25D9%2587%25D8%25A7%25D8%25B1+%25D8%258C+%25D8%25A7%25D8%25B1%25D9%2588%25D8%25B9+%25D8%25B5%25D9%2588%25D8%25B1+%25D9%2582%25D9%2585%25D8%25B1+%25D8%25A8%25D8%25AF%25D9%2582%25D8%25A9+4K.jpg')),
        ],
      ),
    );
  }
}
