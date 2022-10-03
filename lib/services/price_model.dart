class PriceModel {
  String? urunismi;
  String? edf;
  String? eyf;
  String? birim;

  PriceModel({this.urunismi, this.edf, this.eyf, this.birim});

  PriceModel.fromJson(Map<String, dynamic> json) {
    urunismi = json['urunismi'];
    edf = json['edf'];
    eyf = json['eyf'];
    birim = json['birim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urunismi'] = this.urunismi;
    data['edf'] = this.edf;
    data['eyf'] = this.eyf;
    data['birim'] = this.birim;
    return data;
  }
}
