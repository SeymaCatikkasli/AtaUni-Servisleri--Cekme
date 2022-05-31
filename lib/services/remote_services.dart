import 'package:atauni_son/models/announcement.dart';
import 'package:atauni_son/models/events.dart';
import 'package:atauni_son/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  Future<List<Haber>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://atauni.edu.tr/servis/medya/haberler');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return AutoGenerate.fromJson(jsonDecode(json)).haber;
    }
  }
  
  Future<List<Duyuru>?> getAnnouncements() async {
    var client = http.Client();
    var uri = Uri.parse('https://atauni.edu.tr/servis/medya/duyurular');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return AutoGenerate1.fromJson(jsonDecode(json)).duyuru;
    }
  }
   Future<List<Etkinlik>?> getEvents() async {
    var client = http.Client();
    var uri = Uri.parse('https://atauni.edu.tr/servis/medya/etkinlikler');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return AutoGenerate2.fromJson(jsonDecode(json)).etkinlik;
    }
  }
}
