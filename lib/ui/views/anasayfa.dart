import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    var k1 = Kategoriler(id: 1, ad: "Temel Gıda", resim:"images/temelgida.png");
    kategoriListesi.add(k1);
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
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                color: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: color2,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), // Sol üst köşe oval
                        topRight: Radius.circular(10), // Sağ üst köşe oval
                      ),
                      color: color2,
                    ),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    height: 50,
                    child: Text("getir",style: TextStyle(fontFamily: "playpen",color: color1,fontSize: 25,fontWeight: FontWeight.w700),),
                  ),
                ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: 392,
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
                        padding: const EdgeInsets.only(left:12),
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
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "images/getiryemek_afis.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
