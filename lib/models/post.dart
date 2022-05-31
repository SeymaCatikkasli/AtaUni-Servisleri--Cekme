import 'dart:convert';

class AutoGenerate {
  AutoGenerate({
    required this.haber,
  });
  late final List<Haber> haber;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    haber = List.from(json['haber']).map((e)=>Haber.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['haber'] = haber.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Haber {
  Haber({
    required this.medyaId,
    required this.medyaBaslik,
    required this.medyaOzet,
    required this.medyaSeoad,
    required this.portalYuklemeKonum,
  });
  late final String medyaId;
  late final String medyaBaslik;
  late final String medyaOzet;
  late final String medyaSeoad;
  late final String portalYuklemeKonum;
  
  Haber.fromJson(Map<String, dynamic> json){
    medyaId = json['medya_id'];
    medyaBaslik = json['medya_baslik'];
    medyaOzet = json['medya_ozet'];
    medyaSeoad = json['medya_seoad'];
    portalYuklemeKonum = json['portal_yukleme_konum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['medya_id'] = medyaId;
    _data['medya_baslik'] = medyaBaslik;
    _data['medya_ozet'] = medyaOzet;
    _data['medya_seoad'] = medyaSeoad;
    _data['portal_yukleme_konum'] = portalYuklemeKonum;
    return _data;
  }
  String resimLinkiOlustur() => 'https://atauni.edu.tr/yuklemeler/${portalYuklemeKonum}';
  String haberLinkiOlustur() => 'https://atauni.edu.tr/${medyaSeoad}'; // web sayfasına gitmek için
}