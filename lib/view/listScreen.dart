import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  HomeProvider? hpTrue;
  HomeProvider? hpFalse;
  Duration d1 = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
        Audio(
            "${Provider.of<HomeProvider>(context, listen: false).allData!.song}"),
        autoStart: false,
        showNotification: true);
    assetsAudioPlayer.current.listen((event) {
      d1 = event!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider hpFalse = Provider.of<HomeProvider>(context, listen: false);
    HomeProvider hpTrue = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "Music Player",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            hpFalse.play();
            if (hpFalse.isPlay == true) {
              assetsAudioPlayer.play();
            } else {
              assetsAudioPlayer.pause();
            }
            Icon(
              hpTrue.isPlay
                  ? Icons.pause_circle_outline
                  : Icons.play_circle_outline,
              color: Colors.white,
              size: 70,
            );
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 45,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
              color: Colors.grey[500],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text(
                        "Help",
                      ),
                    ),
                    const PopupMenuItem(
                      child: Text(
                        "Feedback",
                      ),
                    )
                  ]),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("${hpFalse.allData!.images}",
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.8),
              ),
            ),
          ),
          assetsAudioPlayer.builderCurrentPosition(
              builder: (context, duration) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.repeat, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey[500],
                  max: d1.inSeconds.toDouble(),
                  value: duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    assetsAudioPlayer.seek(
                      Duration(
                        seconds: value.toInt(),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3, left: 20, bottom: 6, right: 6),
                      child: Text(
                        "${duration.inHours}:${duration.inMinutes}:${duration.inSeconds}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3, left: 20, bottom: 6, right: 6),
                      child: Text(
                        "${d1.inHours}:${d1.inMinutes}:${d1.inSeconds}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  assetsAudioPlayer.previous(keepLoopMode: false);
                },
                icon: const Icon(
                  Icons.skip_previous_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              IconButton(
                iconSize: 70,
                onPressed: () {
                  hpFalse.play();
                  if (hpFalse.isPlay == true) {
                    assetsAudioPlayer.play();
                  } else {
                    assetsAudioPlayer.pause();
                  }
                },
                icon: hpTrue.isPlay
                    ? const Icon(
                        Icons.pause_circle_outline,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                      ),
              ),
              IconButton(
                onPressed: () {
                  assetsAudioPlayer.next(keepLoopMode: false, stopIfLast: true);
                },
                icon: const Icon(
                  Icons.skip_next_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
