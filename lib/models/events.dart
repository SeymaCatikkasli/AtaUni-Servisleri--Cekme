class AutoGenerate2 {
  AutoGenerate2({
    required this.etkinlik,
  });
  late final List<Etkinlik> etkinlik;
  
  AutoGenerate2.fromJson(Map<String, dynamic> json){
    etkinlik = List.from(json['etkinlik']).map((e)=>Etkinlik.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['etkinlik'] = etkinlik.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Etkinlik {
  Etkinlik({
    required this.medyaId,
    required this.medyaBaslik,
    required this.medyaSeoad,
    required this.medyaBtarih,
    required this.medyaBaglanti,
    required this.portalYuklemeKonum,
    required this.medyaGun,
    required this.medyaDetay,
  });
  late final String medyaId;
  late final String medyaBaslik;
  late final String medyaSeoad;
  late final String medyaBtarih;
  late final String medyaBaglanti;
  late final String portalYuklemeKonum;
  late final String medyaGun;
  late final List<MedyaDetay> medyaDetay;
  
  Etkinlik.fromJson(Map<String, dynamic> json){
    medyaId = json['medya_id'];
    medyaBaslik = json['medya_baslik'];
    medyaSeoad = json['medya_seoad'];
    medyaBtarih = json['medya_btarih'];
    medyaBaglanti = json['medya_baglanti'];
    portalYuklemeKonum = json['portal_yukleme_konum'];
    medyaGun = json['medya_gun'];
    medyaDetay = List.from(json['medya_detay']).map((e)=>MedyaDetay.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['medya_id'] = medyaId;
    _data['medya_baslik'] = medyaBaslik;
    _data['medya_seoad'] = medyaSeoad;
    _data['medya_btarih'] = medyaBtarih;
    _data['medya_baglanti'] = medyaBaglanti;
    _data['portal_yukleme_konum'] = portalYuklemeKonum;
    _data['medya_gun'] = medyaGun;
    _data['medya_detay'] = medyaDetay.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MedyaDetay {
  MedyaDetay({
    required this.medyaDetayturId,
    required this.medyaDetayIcerik,
    required this.medyaDetayturAd,
  });
  late final String medyaDetayturId;
  late final String medyaDetayIcerik;
  late final String medyaDetayturAd;
  
  MedyaDetay.fromJson(Map<String, dynamic> json){
    medyaDetayturId = json['medya_detaytur_id'];
    medyaDetayIcerik = json['medya_detay_icerik'];
    medyaDetayturAd = json['medya_detaytur_ad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['medya_detaytur_id'] = medyaDetayturId;
    _data['medya_detay_icerik'] = medyaDetayIcerik;
    _data['medya_detaytur_ad'] = medyaDetayturAd;
    return _data;
  }
}