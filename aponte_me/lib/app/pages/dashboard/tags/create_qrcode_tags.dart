import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CreateQRCodeWidget extends StatefulWidget {
  const CreateQRCodeWidget({super.key});

  @override
  State<CreateQRCodeWidget> createState() => _CreateQRCodeWidgetState();
}

class _CreateQRCodeWidgetState extends State<CreateQRCodeWidget> {
  List<String> qrCodeTags = [];

  Future<void> readQRCode() async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
        '#FF6666',
        'Cancelar',
        true,
        ScanMode.QR,
      );

      setState(() {
        if (code != '-1' && !qrCodeTags.contains(code)) {
          qrCodeTags.add(code);
        }
      });
    } catch (error) {
      throw ('Falha na leitura do QR code: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar etiqueta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            // color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: readQRCode,
                    child: const Text('Ler QR Code'),
                  ),
                ),
                const SizedBox(height: 16.0),
                if (qrCodeTags.isNotEmpty)
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Etiquetas adicionadas: ${qrCodeTags.length}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: qrCodeTags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            isThreeLine: true,
                            leading: Text(
                              qrCodeTags[index],
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            title: Text(
                              '${qrCodeTags[index].hashCode}',
                            ),
                            subtitle: Text(
                              'Validade: ${DateTime.timestamp()} - Status: Ativo',
                            ),
                            /*trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  qrCodeTags.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 16.0,
                              ),
                            ),*/
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
