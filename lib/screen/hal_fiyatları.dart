import 'package:ciftci_destek_mobil/services/price_model.dart';
import 'package:ciftci_destek_mobil/services/prices_post_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../themes/main_colors.dart';

class HalFiyatlari extends StatefulWidget {
  const HalFiyatlari({Key? key}) : super(key: key);

  @override
  State<HalFiyatlari> createState() => _HalFiyatlariState();
}

class _HalFiyatlariState extends State<HalFiyatlari> {
  List<PriceModel>? _items;
  late final IPricesPostServices _pricesPostServices;
  @override
  void initState() {
    super.initState();
    _pricesPostServices = PricesPostServices();
    _fetchPostItems();
  }

  _fetchPostItems() async {
    _items = await _pricesPostServices.fetchPostItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: MainColors.Blue2,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Çiftçi Destek",
        ),
        actions: [IconButton(onPressed: () async {}, icon: const Icon(Icons.switch_left_sharp))],
      ),
      body: _items == null
          ? const Center(
              child: SpinKitWave(
              color: Colors.blueAccent,
              size: 50.0,
            ))
          : ListView.builder(
              itemCount: _items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      _items![index].urunismi.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                        Text("En Düşük :${_items![index].edf} En Yüksek :${_items![index].eyf}"),
                    trailing: Text(_items![index].birim.toString()),
                  ),
                );
              }),
    );
  }
}
