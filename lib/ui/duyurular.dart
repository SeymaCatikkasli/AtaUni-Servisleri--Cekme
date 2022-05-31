import 'package:atauni_son/models/announcement.dart';
import 'package:atauni_son/services/remote_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatefulWidget {
  AnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  List<Duyuru>? posts;

  var isLoaded = false;
    @override
  void initState() {
    super.initState();
    //Apiden veri al
    getData();
  }

  getData() async {
    posts = await RemoteService().getAnnouncements();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (posts != null) {
      var _posts = posts!;
      return ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            var p = _posts[index];
            return GestureDetector(
                onTap: () => {
                  // navigate 2 p.duyuruLinkiOlustur()
                },
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: Text(
                      p.medyaBaslik,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          });
    } else {
      return const Center(
        
        child: CircularProgressIndicator(
        color: Colors.blue,
      )
      );
    }
  }
}
