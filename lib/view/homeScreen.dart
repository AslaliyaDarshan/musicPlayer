import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/model/modelData.dart';
import 'package:musicplayer/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration d1 = const Duration(seconds: 0);
  HomeProvider? hpFalse;
  HomeProvider? hpTrue;

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio(""),
      //${Provider.of<HomeProvider>(context).Data[index].song}
      autoStart: false,
      showNotification: true,
    );
    assetsAudioPlayer.current.listen((event) {
      d1 = event!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider hpFalse = Provider.of<HomeProvider>(context, listen: false);
    HomeProvider hpTrue = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: hpTrue.Data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              assetsAudioPlayer.pause();
              hpFalse.allData = ModelData(
                  images: hpFalse.Data[index].images,
                  title: hpFalse.Data[index].title,
                  subtitle: hpFalse.Data[index].subtitle,
                  song: hpFalse.Data[index].song);
              Navigator.pushNamed(context, 'list');
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 7, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "${hpFalse.Data[index].images}",
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "${hpFalse.Data[index].title}",
                              style: const TextStyle(
                                  color: Colors.orange, fontSize: 18),
                            ),
                            subtitle: Text(
                              "${hpFalse.Data[index].subtitle}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.orangeAccent,
                                size: 29),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
