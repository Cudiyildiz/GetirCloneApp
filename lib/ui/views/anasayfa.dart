import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:getir_clone/data/kategoriler.dart';
import 'package:getir_clone/ui/colors.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Future<List<Kategoriler>> kategoriYukle() async{
    var kategoriListesi = <Kategoriler>[];
    var k1 = Kategoriler(id: 1, ad: "Temel Gıda", resim:"temelgida.png");
    var k2 = Kategoriler(id: 2, ad: "Fırından", resim:"firin.png");
    var k3 = Kategoriler(id: 3, ad: "Meyve&Se...", resim:"sebze.png");
    var k4 = Kategoriler(id: 4, ad: "Kahvaltılık", resim:"kahvalti.png");
    var k5 = Kategoriler(id: 5, ad: "Yiyecek", resim:"yiyecek.png");
    var k6 = Kategoriler(id: 6, ad: "Süt Ürünleri", resim:"sut.png");
    var k7 = Kategoriler(id: 7, ad: "Kişisel Bakım", resim:"bakim.png");
    var k8 = Kategoriler(id: 8, ad: "Dondurma", resim:"dondurma.png");
    var k9 = Kategoriler(id: 9, ad: "Fit & Form", resim:"fit.png");
    var k10 = Kategoriler(id: 10, ad: "Ev Bakım", resim:"temizlik.png");
    var k11 = Kategoriler(id: 11, ad: "Ev & Yaşam", resim:"evdekor.png");
    var k12 = Kategoriler(id: 12, ad: "Bebek", resim:"bebek.png");
    var k13 = Kategoriler(id: 13, ad: "Cinsel Sağlık", resim:"cinselsaglik.png");

    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k4);
    kategoriListesi.add(k5);
    kategoriListesi.add(k6);
    kategoriListesi.add(k7);
    kategoriListesi.add(k8);
    kategoriListesi.add(k9);
    kategoriListesi.add(k10);
    kategoriListesi.add(k11);
    kategoriListesi.add(k12);
    kategoriListesi.add(k13);

    return kategoriListesi;
  }
  void initState() {
    super.initState();
    // Durum çubuğu rengini siyah yap
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Durum çubuğu rengi siyah
        statusBarIconBrightness: Brightness.light, // İkonların rengi (beyaz)
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        centerTitle: true,
        title: Text(
          "getir",
          style: TextStyle(
            fontFamily: "playpen",
            color: color1,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 3,
        toolbarHeight: 60,
        // AppBar içinde alanları hizalamak için
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: color2,
                width: 3,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: color1,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: (){

                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13), // Buton boyutları
                                textStyle: TextStyle(fontSize: 18),// Yazı tipi boyutu
                                shape: RoundedRectangleBorder( // Kenarları özelleştirme
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ), // Kenarların yuvarlanması
                                ),
                                shadowColor: Colors.transparent, // Gölge rengini kaldırır
                                elevation: 1, // Gölgeyi kaldırır
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Teslimat Adresi Belirle",style: TextStyle(fontSize: 16,color: color3),),
                                  SizedBox(width:100),
                                  Icon(Icons.keyboard_arrow_down_rounded,color: color2,size: 25,),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: Column(
                                children: [
                                  Text("TVS",style: TextStyle(color: color2),),
                                  Text("20-30 dk",style: TextStyle(fontWeight: FontWeight.w600,color: color2,fontSize: 18),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("images/getiryemek_afis.jpg")
                    ),
                  ),
                  const SizedBox(height: 8),
                  FutureBuilder<List<Kategoriler>>(
                    future: kategoriYukle(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var kategoriListesi = snapshot.data;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height*0.6,
                          child: GridView.builder(
                            itemCount: kategoriListesi!.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,childAspectRatio: 1/1.2
                            ),
                            itemBuilder: (context,indeks){
                              var kategori = kategoriListesi[indeks];
                              return GestureDetector(
                                onTap: (){
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("images/${kategori.resim}"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("${kategori.ad}",style: const TextStyle(fontSize:12),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      else{
                        return const Center();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height:55,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.home, size: 30, color: color2), onPressed: () {}),
              IconButton(icon: Icon(Icons.search, size: 30,color: color4,), onPressed: () {}),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color2,
                ),
                child: Icon(Icons.menu_outlined, color: color1,size: 20,),
              ),
              IconButton(icon: Icon(Icons.account_circle, size: 30,color: color4,), onPressed: () {}),
              IconButton(icon: Icon(Icons.card_giftcard, size: 30,color: color4,), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
