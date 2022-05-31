class AutoGenerate1 {
  AutoGenerate1({
    required this.duyuru,
  });
  late final List<Duyuru> duyuru;
  
  AutoGenerate1.fromJson(Map<String, dynamic> json){
    duyuru = List.from(json['duyuru']).map((e)=>Duyuru.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['duyuru'] = duyuru.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Duyuru {
  Duyuru({
    required this.medyaId,
    required this.medyaBaslik,
    required this.medyaSeoad,
    required this.medyaBaglanti,
  });
  late final String medyaId;
  late final String medyaBaslik;
  late final String medyaSeoad;
  late final String medyaBaglanti;
  
  Duyuru.fromJson(Map<String, dynamic> json){
    medyaId = json['medya_id'];
    medyaBaslik = json['medya_baslik'];
    medyaSeoad = json['medya_seoad'];
    medyaBaglanti = json['medya_baglanti'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['medya_id'] = medyaId;
    _data['medya_baslik'] = medyaBaslik;
    _data['medya_seoad'] = medyaSeoad;
    _data['medya_baglanti'] = medyaBaglanti;
    return _data;
  }

  String duyuruLinkiOlustur() => 'https://atauni.edu.tr/${medyaSeoad}';
}