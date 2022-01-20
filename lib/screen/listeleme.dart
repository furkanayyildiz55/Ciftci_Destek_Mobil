import 'package:ciftci_destek_mobil/models/veriler.dart';
import 'package:flutter/material.dart';
import 'package:ciftci_destek_mobil/screen/analiz.dart';
import 'package:ciftci_destek_mobil/themes/main_colors.dart';


class Listeleme extends StatefulWidget {
  Listeleme({Key? key}) : super(key: key);

  @override
  _ListelemeState createState() => _ListelemeState();
}

class _ListelemeState extends State<Listeleme> {
  List<Veriler> liste = [
    Veriler(besinAdi: 'PH', durum: false),
    Veriler(besinAdi: 'K', durum: false),
    Veriler(besinAdi: 'N', durum: false),
    Veriler(besinAdi: 'P', durum: false),
    Veriler(besinAdi: 'Ca', durum: false),
    Veriler(besinAdi: 'Mg', durum: false),
    Veriler(besinAdi: 'Mn', durum: false),
    Veriler(besinAdi: 'Zn', durum: false),
    Veriler(besinAdi: 'Fe', durum: false),
    Veriler(besinAdi: 'Cu', durum: false),
    Veriler(besinAdi: 'Tuz', durum: false),
    Veriler(besinAdi: 'Kireç', durum: false),
    Veriler(besinAdi: 'Tekstür', durum: false),
  ];
  List<String> secilen_besin = [];
  bool secildimi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: MainColors.Blue2,
        elevation: 0,
        centerTitle: true,
        title: Text('Analiz Yapılacak Besin Maddeleri'),
        actions: [
          IconButton(
              onPressed: () async {}, icon: const Icon(Icons.switch_left_sharp))
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                    value: liste[index].durum,
                    onChanged: (deger) {
                      setState(() {
                        liste[index].durum = deger as bool;
                      });
                    },
                    title: Text(liste[index].besinAdi));
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                for (int i = 0; i < liste.length; i++) {
                  if (liste[i].durum == true)
                    secilen_besin.add(liste[i].besinAdi);
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ToprakAnalizi(
                          secilen_besin: secilen_besin,
                        )));
              },
              child: Text('Devam Et')),
        ],
      )),
    );
  }
}
