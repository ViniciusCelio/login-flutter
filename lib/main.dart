import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(color: Colors.white),
          iconTheme: const IconThemeData(
            color: Colors.white, 
          ),
        ),
        drawer: const Drawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
                  Image.asset('assets/images/background.jpg',
                  fit: BoxFit.cover), 
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      style: TextStyle(color: Colors.purple, fontSize: 10),
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Password'),
                      style: TextStyle(color: Colors.purple, fontSize: 10),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio das bordas
                          ),
                        ),
                      ),
                      child: const Text("Enter"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Novo aqui?  "),
                        RichText(
                            text: TextSpan(
                                text: 'Crie uma conta',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final Uri url =
                                        Uri.parse('https://pucminas.br');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Não foi possível abrir o link';
                                    }
                                  }))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Minha conta',
            )
          ],
        ),
      ),
    );
  }
}
