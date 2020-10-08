import 'package:TowardsLife/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ThirukuralLists extends GetView<HomeController> {
  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);

  final primary = const Color(0xff696b9e);
  final secondary = const Color(0xfff29a94);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 170),
            width: double.infinity,
            child: Obx(
              () {
                if (controller.kurals.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  controller: controller.controller,
                  itemCount: controller.kurals.length,
                  itemBuilder: (_, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                          width: 2,
                          color: Colors.cyan.withOpacity(0.8),
                          // style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => controller.controller.jumpTo(
                                      controller
                                          .controller.position.minScrollExtent),
                                  child: Text(
                                    // kural.kurals[index].chapter,
                                    controller.kurals[index].chapter.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.purple),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Colors.redAccent[400],
                                    // thickness: 2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => controller.controller.jumpTo(
                                      controller
                                          .controller.position.maxScrollExtent),
                                  child: Text(
                                    controller.kurals[index].section.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.purple),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.orange,
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                              bottom: 20,
                              left: 15,
                            ),
                            title: Text(
                              controller.kurals[index].kural[0].toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.indigoAccent),
                            ),
                            subtitle: Text(
                              '${controller.kurals[index].kural[1]} [${controller.kurals[index].number}]',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.menu,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  const Text(
                    "Thirukkural",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    // controller: TextEditingController(text: locations[0]),
                    cursorColor: Theme.of(context).primaryColor,
                    style: dropdownMenuItem,
                    decoration: const InputDecoration(
                      hintText: "type here to find the kural",
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                      prefixIcon: Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// class Homew extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Towards Life'),
//         // centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//           InkWell(
//             onDoubleTap: () {},
//             child: IconButton(
//               icon: Icon(Icons.shuffle),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () {
//                 if (controller.kurals.length <= 0) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                   padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
//                   controller: controller.controller,
//                   itemCount: controller.kurals.length,
//                   itemBuilder: (_, index) {
//                     return Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                         side: BorderSide(
//                           width: 2,
//                           color: Colors.cyan.withOpacity(0.8),
//                           style: BorderStyle.solid,
//                         ),
//                       ),
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             height: 30,
//                             child: ListView(
//                               padding:
//                                   EdgeInsets.only(left: 20, right: 20, top: 10),
//                               physics: BouncingScrollPhysics(),
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               children: <Widget>[
//                                 InkWell(
//                                   onTap: () => controller.controller.jumpTo(
//                                       controller
//                                           .controller.position.minScrollExtent),
//                                   child: Text(
//                                     // kural.kurals[index].chapter,
//                                     controller.kurals[index].chapter.toString(),
//                                     style: TextStyle(
//                                         fontSize: 15, color: Colors.purple),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 20,
//                                   child: VerticalDivider(
//                                     color: Colors.redAccent[400],
//                                     // thickness: 2,
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () => controller.controller.jumpTo(
//                                       controller
//                                           .controller.position.maxScrollExtent),
//                                   child: Text(
//                                     controller.kurals[index].section.toString(),
//                                     style: TextStyle(
//                                         fontSize: 15, color: Colors.purple),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Divider(
//                             height: 10,
//                             color: Colors.orange,
//                           ),
//                           ListTile(
//                             contentPadding: EdgeInsets.only(
//                               bottom: 20,
//                               left: 15,
//                             ),
//                             title: Text(
//                               controller.kurals[index].kural[0].toString(),
//                               style: TextStyle(
//                                   fontSize: 15, color: Colors.indigoAccent),
//                             ),
//                             subtitle: Text(
//                               '${controller.kurals[index].kural[1]} [${controller.kurals[index].number}]',
//                               style: const TextStyle(
//                                   fontSize: 14, color: Colors.indigo),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Obx(() => (controller.isLoading.value && controller.kurals.length > 0)
//               ? CircularProgressIndicator()
//               : SizedBox.shrink()),
//         ],
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// enum TtsState { playing, stopped, paused, continued }

// class _HomeState extends State<Home> {
//   // ODO for web check flutter-tts implementation
//   ScrollController _controller = ScrollController();
//   FlutterTts flutterTts;
//   final CollectionReference kuralCollection =
//       FirebaseFirestore.instance.collection('ThirukKural');
//   Kural kural;
//   List<Kurals> kurals;
//   bool shuffle = false, isLoading = true, isTtsPlaying = false;
//   int limit = 8;

//   bool moreAvail = true, isMoreLoading = false;

//   TtsState ttsState = TtsState.stopped;
//   get isPlaying => ttsState == TtsState.playing;

//   get isStopped => ttsState == TtsState.stopped;

//   get isPaused => ttsState == TtsState.paused;

//   get isContinued => ttsState == TtsState.continued;
//   @override
//   void initState() {
//     _controller.addListener(
//       () {
//         if (_controller.position.pixels ==
//             _controller.position.maxScrollExtent) {
//           print('no');
//           fetchMoreKurals();
//         }
//       },
//     );
//     super.initState();
//     ttsInit();
//     fetchKurals();
//   }

//   ttsInit() {
//     flutterTts = FlutterTts();

//     if (!kIsWeb) {
//       if (Platform.isAndroid) {
//         _getEngines();
//       }
//     }
//   }

//   ttsHandler(int index) {
//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         kural.kurals[index].isPlaying = true;
//         isTtsPlaying = true;
//         ttsState = TtsState.playing;
//       });
//     });

//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         print("Complete");
//         ttsState = TtsState.stopped;
//         kural.kurals[index].isPlaying = false;
//         isTtsPlaying = false;
//       });
//     });

//     flutterTts.setCancelHandler(() {
//       setState(() {
//         print("Cancel");
//         kural.kurals[index].isPlaying = false;
//         isTtsPlaying = false;
//         ttsState = TtsState.stopped;
//       });
//     });

//     if (kIsWeb || Platform.isIOS) {
//       flutterTts.setPauseHandler(() {
//         setState(() {
//           print("Paused");
//           kural.kurals[index].isPlaying = false;
//           isTtsPlaying = false;
//           ttsState = TtsState.paused;
//         });
//       });

//       flutterTts.setContinueHandler(() {
//         setState(() {
//           print("Continued");
//           kural.kurals[index].isPlaying = true;
//           isTtsPlaying = true;
//           ttsState = TtsState.continued;
//         });
//       });
//     }

//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         kural.kurals[index].isPlaying = false;
//         isTtsPlaying = false;
//         ttsState = TtsState.stopped;
//       });
//     });
//   }

//   Future _getEngines() async {
//     var engines = await flutterTts.getEngines;
//     if (engines != null) {
//       for (dynamic engine in engines) {
//         print(engine);
//       }
//     }
//   }

//   Future _speak(String text) async {
//     await flutterTts.setVolume(0.8);
//     await flutterTts.setSpeechRate(0.6);
//     await flutterTts.setPitch(1.6);
//     if (Platform.isAndroid) {
//       await flutterTts.setVoice('ta-IN-language');
//     }

//     await flutterTts.setLanguage(
//         await flutterTts.isLanguageAvailable('ta-IN') != null
//             ? 'ta-IN'
//             : 'en-IN');
//     // var f = await flutterTts.getVoices;
//     // flutterTts.
//     // f.forEach((e) => print(e));

//     if (text != null) {
//       if (text.isNotEmpty) {
//         var result = await flutterTts.speak(text);
//         if (result == 1) setState(() => ttsState = TtsState.playing);
//       }
//     }
//   }

//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }

//   Future _pause() async {
//     var result = await flutterTts.pause();
//     if (result == 1) setState(() => ttsState = TtsState.paused);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     flutterTts.stop();
//     _controller.dispose();
//   }

//   List<DocumentSnapshot> krls = [];
//   QueryDocumentSnapshot last;
//   fetchKurals() async {
//     // await Future.delayed(const Duration(seconds: 2));
//     setState(() {
//       isLoading = true;
//     });
//     Query query = kuralCollection.orderBy('number').limit(limit);

//     QuerySnapshot snapshot = await query.get();

//     krls = snapshot.docs;
//     last = snapshot.docs[krls.length - 1];

//     kural = Kural.fromDocumentSnapshot(krls);

//     setState(() {
//       isLoading = false;
//     });
//   }

//   fetchMoreKurals() async {
//     print('fetch more');
//     if (moreAvail == false) {
//       print('no kurals');
//       return;
//     }

//     setState(() {
//       isMoreLoading = true;
//     });
//     Query query = kuralCollection
//         .orderBy('number')
//         .startAfter([last.data()['number']]).limit(limit);

//     // print(last.data());

//     QuerySnapshot snapshot = await query.get();

//     krls.addAll(snapshot.docs);
//     kural = Kural.fromDocumentSnapshot(krls);

//     if (snapshot.docs.length >= limit)
//       last = snapshot.docs[snapshot.docs.length - 1];
//     else
//       moreAvail = false;

//     setState(() {
//       isMoreLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // isLoading = true;
//     // print('call pls');
//     return SafeArea(
//       child: Scaffold(
//         // backgroundColor: Colors.cyanAccent,
//         appBar: AppBar(
//           primary: true,
//           leading: FlutterLogo(size: 100),

//           title: Text('Towards Life'),
//           // centerTitle: true,
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () => _speak('less done'),
//             ),
//             InkWell(
//               onDoubleTap: fetchKurals,
//               child: IconButton(
//                 icon: Icon(Icons.shuffle),
//                 onPressed: () => setState(() => shuffle = true),
//               ),
//             ),
//           ],
//         ),
//         body: isLoading == true
//             ? ListView(
//                 children: [
//                   ShimmerContainer(),
//                   ShimmerContainer(),
//                   ShimmerContainer(),
//                   ShimmerContainer(),
//                   ShimmerContainer(),
//                   ShimmerContainer(),
//                 ],
//               )
//             : Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: ListView.builder(
//                       controller: _controller,
//                       padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
//                       itemBuilder: (BuildContext context, int index) {
//                         // print(kural.kurals[1].isPlaying.toString() + '   kk');
//                         // print(sam.toString() + ' . sss');
//                         // kurals = kural.kurals;
//                         if (shuffle) {
//                           kural.kurals.shuffle();
//                           shuffle = false;
//                         } //else
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25.0),
//                             side: BorderSide(
//                               width: 2,
//                               color: Colors.cyan.withOpacity(0.8),
//                               style: BorderStyle.solid,
//                             ),
//                           ),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 height: 30,
//                                 child: ListView(
//                                   padding: EdgeInsets.only(
//                                       left: 20, right: 20, top: 10),
//                                   physics: BouncingScrollPhysics(),
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   children: <Widget>[
//                                     Text(
//                                       kural.kurals[index].chapter,
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.purple),
//                                     ),
//                                     Container(
//                                       // margin: EdgeInsets.only(bottom: 10),
//                                       height: 20,
//                                       child: VerticalDivider(
//                                         color: Colors.redAccent[400],
//                                         // thickness: 2,
//                                       ),
//                                     ),
//                                     Text(
//                                       kural.kurals[index].section,
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.purple),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Divider(
//                                 height: 10,
//                                 color: Colors.orange,
//                               ),
//                               ListTile(
//                                 trailing: Padding(
//                                   padding: const EdgeInsets.only(right: 10.0),
//                                   child: InkWell(
//                                       onDoubleTap: () => _stop,
//                                       child:
//                                           kural.kurals[index].isPlaying == false
//                                               ? Icon(Icons.play_arrow)
//                                               : Platform.isIOS
//                                                   ? Icon(Icons.pause)
//                                                   : Icon(Icons.stop),
//                                       onTap: isTtsPlaying == false ||
//                                               kural.kurals[index].isPlaying ==
//                                                   true
//                                           ? () {
//                                               ttsHandler(index);
//                                               setState(
//                                                 () {
//                                                   if (kural.kurals[index]
//                                                           .isPlaying ==
//                                                       false) {
//                                                     _speak(kural
//                                                         .kurals[index].kural
//                                                         .join(' '));
//                                                   } else {
//                                                     if (Platform.isIOS)
//                                                       _pause();
//                                                     _stop();
//                                                   }
//                                                   kural.kurals[index]
//                                                           .isPlaying =
//                                                       !kural.kurals[index]
//                                                           .isPlaying;
//                                                 },
//                                               );
//                                             }
//                                           : null),
//                                 ),
//                                 contentPadding: EdgeInsets.only(
//                                   bottom: 20,
//                                   left: 15,
//                                 ),
//                                 title: Text(
//                                   kural.kurals[index].kural[0],
//                                   style: TextStyle(
//                                       fontSize: 15, color: Colors.indigoAccent),
//                                 ),
//                                 subtitle: Text(
//                                   kural.kurals[index].kural[1] +
//                                       ' [' +
//                                       kural.kurals[index].number.toString() +
//                                       ']',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.indigo),
//                                 ),
//                               ),
//                               // Row(
//                               //   children: <Widget>[
//                               //     IconButton(
//                               //       icon: Icon(Icons.shuffle),
//                               //       onPressed: () => setState(() => shuffle = true),
//                               //     ),
//                               //   ],
//                               // )
//                             ],
//                           ),
//                         );
//                       },
//                       itemCount: kural.kurals.length,
//                     ),
//                   ),
//                   isMoreLoading ? CircularProgressIndicator() : Container()
//                 ],
//               ),
//       ),
//     );
//   }
// }

// class ShimmerContainer extends StatelessWidget {
//   const ShimmerContainer({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       height: displayHeightExcludingToolbar(context) * 0.2,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           side: BorderSide(
//             width: 2,
//             color: Colors.cyan.withOpacity(0.8),
//             style: BorderStyle.solid,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Shimmer(
//                   child: Container(
//                     color: Colors.blueGrey[50],
//                     width: 170,
//                     height: 20,
//                   ),
//                 ),
//                 VerticalDivider(
//                   color: Colors.black,
//                   thickness: 20,
//                 ),
//                 Shimmer(
//                   child: Container(
//                     color: Colors.blueGrey[50],
//                     width: 170,
//                     height: 20,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.orange,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ListTile(
//               title: Shimmer(
//                 child: Container(
//                   color: Colors.blueGrey[50],
//                   width: double.infinity,
//                   height: 20,
//                 ),
//               ),
//               subtitle: Shimmer(
//                 child: Container(
//                   color: Colors.blueGrey[50],
//                   width: double.infinity,
//                   height: 15,
//                 ),
//               ),
//               trailing: Icon(Icons.play_arrow),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }