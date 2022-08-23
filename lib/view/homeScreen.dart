import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
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
  HomeProvider hpFalse = Provider.of<HomeProvider>(context, listen: false);
  HomeProvider hpTrue = Provider.of<HomeProvider>(context, listen: true);
  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("${hp}"),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hpTrue.Data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 200,
                      child: Card(
                        shadowColor: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "${hpTrue.Data[index].images}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 45,
                      top: 50,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          shadows: [
                            Shadow(color: Colors.redAccent, blurRadius: 30)
                          ],
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// assetsAudioPlayer.builderCurrentPosition(
// builder: (context, duration) {
// return Slider(
// max: d1.inSeconds.toDouble(),
// value: duration.inSeconds.toDouble(),
// onChanged: (value) {
// assetsAudioPlayer.seek(
// Duration(
// seconds: value.toInt(),
// ),
// );
// },
// );
// }),
// const SizedBox(
// height: 15,
// ),
// Text("$d1"),
// const SizedBox(
// height: 15,
// ),
// IconButton(
// iconSize: 70,
// onPressed: () {
// hpFalse.play();
// if (hpFalse.isPlay == true) {
// assetsAudioPlayer.play();
// } else {
// assetsAudioPlayer.pause();
// }
// },
// icon: hpTrue.isPlay
// ? const Icon(Icons.pause_circle_outline)
// : const Icon(Icons.play_circle_outline),
// ),
// ],
// ),