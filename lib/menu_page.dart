import 'package:atauni_son/ui/duyurular.dart';
import 'package:atauni_son/ui/etkinlikler.dart';
import 'package:atauni_son/ui/haberler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final String _title = "ATATÜRK ÜNİVERSİTESİ";
  var _index = 0;
  final PageController _sayfaDegistirici = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBarProperty(),
      // drawer:Drawer(child: ,) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, //iconun renk değiştirmesi için
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper), label: "Haberler"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bullhorn), label: "Duyurular"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.peopleGroup),label: "Etkinlikler"),
        ],
        
        onTap: (i) => setState(() {
          _index = i;
          _sayfaDegistirici.jumpToPage(i);
        }),
        selectedItemColor: ProjectColors.selected,
        unselectedItemColor: ProjectColors.unselected,
      ),
     
      body: PageView(
        // content degıssın sadece diye
        controller: _sayfaDegistirici, //sayfanın değiştiğini kontrol ediyor.bottomNavigationbarın itemini kullandım.
        children: [
          NewsPage(), 
          AnnouncementsPage(),
          EventsPage()
        ],
      ),
    );
  }

  AppBar AppBarProperty() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [ProjectColors.myColor, ProjectColors_2.myColor2],
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _LogoSizedBox(),
          _ImageProperty(),
          _TextSizedBox(),
          Text(
            _title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
    );
  }

  Image _ImageProperty() {
    return Image.asset(
      'assets/atauni_logo.png',
      height: 30,
      width: 30,
    );
  }

  SizedBox _TextSizedBox() => SizedBox(
        height: 10,
        width: 10,
      );

  IconButton _IconProperty_newspaper() => IconButton(
      onPressed: () {},
      icon: FaIcon(FontAwesomeIcons.newspaper,
          color: ProjectColors.myColor, size: MenuIconSize.iconSize));

  IconButton _IconProperty_bullhorn() => IconButton(
      onPressed: () {},
      icon: FaIcon(FontAwesomeIcons.bullhorn,
          color: ProjectColors.myColor, size: MenuIconSize.iconSize));

  IconButton _IconProperty_peopleGroup() => IconButton(
      onPressed: () {},
      icon: FaIcon(FontAwesomeIcons.peopleGroup,
          color: ProjectColors.myColor, size: MenuIconSize.iconSize));

  IconButton _IconProperty_restaurant() => IconButton(
      onPressed: () {},
      icon: Icon(Icons.restaurant_menu_outlined,
          color: ProjectColors.myColor, size: MenuIconSize.iconSize));
}

class _LogoSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
      width: 13,
    );
  }
}

class ProjectPadding {
  static final pagePadding = EdgeInsets.symmetric(vertical: 25, horizontal: 20);
}

class ProjectColors {
  static final Color myColor = Color.fromARGB(255, 13, 29, 117);
  static final Color unselected = Colors.grey;
  static final Color selected= Colors.lightBlue;
}

class ProjectColors_2 {
  static final Color myColor2 = Colors.lightBlue;

}

class MenuIconSize {
  static final double iconSize = 20;
}
