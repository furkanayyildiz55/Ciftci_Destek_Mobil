import 'package:ciftci_destek_mobil/screen/main_page.dart';
import 'package:ciftci_destek_mobil/themes/main_colors.dart';
import 'package:flutter/material.dart';

class AnalizSonucu extends StatefulWidget {
  List<String>? besin_analiz_sonucu;
  List<String>? secilen_besin;
  AnalizSonucu({this.besin_analiz_sonucu, this.secilen_besin, Key? key})
      : super(key: key);

  @override
  State<AnalizSonucu> createState() => _AnalizSonucuState();
}

class _AnalizSonucuState extends State<AnalizSonucu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: MainColors.Blue2,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Analiz Sonucu",
        ),
        actions: [
          IconButton(
              onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => MainPaage()),
                                (Route<dynamic> route) => false);
              }, icon: const Icon(Icons.home))
        ],
      ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.secilen_besin!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.secilen_besin![index] +
                            ' degeri: ' +
                            widget.besin_analiz_sonucu![index],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Geri don'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Anasayfa')),
              ],)
            ],
          ),
        ));
  }
}
