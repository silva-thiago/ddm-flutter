import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';

class QRCodeTagsPage extends StatefulWidget {
  const QRCodeTagsPage({super.key});

  @override
  State<QRCodeTagsPage> createState() => _QRCodeTagsStatePage();
}

class _QRCodeTagsStatePage extends State<QRCodeTagsPage> {
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
    return Column(
      children: [
        /* const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Minhas etiquetas',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ), */
        const Row(
          children: [
            Text(
              'Aqui você pode cadastrar e validar suas etiquetas.\nCada etiqueta é única e intransferível.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        FilledButton(
          onPressed: readQRCode,
          child: const Text(
            'Ler QR Code',
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
              const SizedBox(height: 16.0),
              ListView.builder(
                reverse: true,
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                itemCount: qrCodeTags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        qrCodeTags[index],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Id: ${qrCodeTags[index].hashCode}',
                            ),
                            Text(
                              'Data: ${_getFormattedTimestamp()}',
                            ),
                            const Text(
                              'Status: Ativo',
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          setState(() {
                            qrCodeTags.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 16.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              // const Divider(),
            ],
          ),
        const SizedBox(height: 16.0),
        if (qrCodeTags.isEmpty)
          const Text(
            'Você ainda não possui nenhuma etiqueta cadastrada.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
      ],
    );
  }

  String _getFormattedTimestamp() {
    var formatter = DateFormat('dd-MM-yyyy');
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
