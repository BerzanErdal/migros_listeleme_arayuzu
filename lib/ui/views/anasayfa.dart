import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:migros_uygulamasi/data/entity/migros.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfKontrol = TextEditingController();
  var resimListesi = <String>[
    "sanalmarketafis.png",
    "tazeafis.png",
    "yemekafis.png",
    "mionafis.png",
    "macroafis.png",
    "hemenafis.png",
    "ekstraafis.png",
  ];

  Future<List<Migros>> Migrosgetir() async {
    var migrosListesi = <Migros>[];
    var m1 = Migros(
        id: 1, ad: "Migros\nSanalMarket", resim: "migrossanalmarket.png");
    var m2 = Migros(id: 2, ad: "Migros\nHemen", resim: "migroshemen.png");
    var m3 = Migros(id: 3, ad: "Migros\nYemek", resim: "migrosyemek.png");
    var m4 = Migros(id: 4, ad: "Taze\nDirekt", resim: "tazedirekt.png");
    var m5 = Migros(id: 5, ad: "Macro Online", resim: "makroonline.png");
    var m6 = Migros(id: 6, ad: "Migros\nEkstra", resim: "migrosekstra.png");
    var m7 = Migros(id: 7, ad: "Mion", resim: "mion.png");
    var m8 = Migros(id: 8, ad: "Müthiş\nÇekiliş", resim: "mutiscekilis.png");

    migrosListesi.addAll([m1, m2, m3, m4, m5, m6, m7, m8]);
    return migrosListesi;
  }

  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      _currentIndexNotifier.value =
          (_currentIndexNotifier.value + 1) % resimListesi.length;
    });
  }

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MİGROS",
          style: TextStyle(
              color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.black54),
              ))),
              onPressed: () {},
              icon: const Icon(Icons.notifications))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            Container(
              height: 150,
              alignment: Alignment.center,
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndexNotifier,
                builder: (context, index, child) {
                  return GestureDetector(
                    onTap: () {
                      _currentIndexNotifier.value =
                          (_currentIndexNotifier.value + 1) %
                              resimListesi.length;
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        var inAnimation = Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation);
                        return Stack(
                          children: [
                            SlideTransition(
                                position: inAnimation, child: child),
                          ],
                        );
                      },
                      child: SizedBox(
                        key: ValueKey<int>(_currentIndexNotifier.value),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "resimler/${resimListesi[_currentIndexNotifier.value]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 4, right: 4),
              child: TextField(
                controller: tfKontrol,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      print("İkona tiklandi");
                    },
                    icon: const Icon(Icons.search_outlined),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        print("Mikrofona tiklandi");
                      },
                      icon: const Icon(Icons.mic)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Ürün, yemek veya hizmet ara",
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Migros>>(
                future: Migrosgetir(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Hata: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Veri bulunamadı"));
                  } else {
                    var migrosListesi = snapshot.data;
                    return GridView.builder(
                      itemCount: migrosListesi!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.11 / 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var migros = migrosListesi[index];
                        return Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${migros.ad}"),
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "resimler/${migros.resim}",
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
