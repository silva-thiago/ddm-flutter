import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(background: Colors.black),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SweepPage(
        title: 'Flutter DDM Sweep Clients',
      ),
    );
  }
}

class SweepPage extends StatefulWidget {
  const SweepPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SweepPage> createState() => _SweepPageState();
}

class _SweepPageState extends State<SweepPage> {
  int _clients = 0;
  String displayValue = '';

  void _clientIn() {
    setState(() {
      _clients++;
    });
  }

  void _clientOut() {
    setState(() {
      _clients--;
    });

    if (_clients < 0) {
      setState(() {
        _clients = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'src/assets/images/natanael-OgxyjT3u7Uc-unsplash.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Total de clientes:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            Text('$_clients',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: _clientOut,
                          icon: const Icon(Icons.remove),
                          label: const Text('Saiu'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: _clientIn,
                          icon: const Icon(Icons.add),
                          label: const Text('Entrou'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
