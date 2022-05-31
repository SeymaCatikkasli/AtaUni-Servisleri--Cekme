import 'package:atauni_son/models/post.dart';
import 'package:atauni_son/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewsPage extends StatefulWidget {
  List<Haber>? posts;

  NewsPage({Key? key, List<Haber>? this.posts}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

enum LoadState {
  Pulling, // Veri Çekiliyor
  Done, // Veri Çekildi
  NoConnection // İnternet yok, fakir
}

class _NewsPageState extends State<NewsPage> {
  List<Haber>? posts;

  var isLoaded = LoadState.Pulling;
  @override
  void initState() {
    super.initState();
    //Apiden veri al
    getData();
  }

  getData() async {
    try {
      posts = await RemoteService().getPosts(); //exception olduğunda setstate e internet yok diyorum.
    }
    catch(e) {
      setState(() {
      isLoaded = LoadState.NoConnection;
      });
    }
    if (posts != null) {
      setState(() {
        isLoaded = LoadState.Done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (isLoaded) {
      case LoadState.Done:
        var _posts = posts!;
        return ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            var p = _posts[index];
            return GestureDetector(
                
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(p.resimLinkiOlustur()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 4),
                        child: Text(
                          p.medyaBaslik,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 4),
                        child: Text(
                          p.medyaOzet,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ));
          });
      case LoadState.NoConnection:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error,size: 70,),
            SizedBox(height: 10,width: 10,),

            Text("İnternet bağlantın yok."),
            
          ],
        );
      case LoadState.Pulling:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.blue,),
            SizedBox(height: 10,width: 10,),
            Text("Yükleniyor..."),
          ],
        );
    }
  }
}
