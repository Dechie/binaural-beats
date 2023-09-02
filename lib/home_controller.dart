import 'package:binaural/constants.dart';
import 'package:binaural/screens/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
  HomeController();

  final _headsetState = Rx<HeadsetState?>(null);
  HeadsetState? get headsetState => _headsetState.value;
  Rx<PlayerStates> playerState = PlayerStates.disabled.obs;
  Rx<Color> playerColor = const Color.fromARGB(255, 228, 228, 228).obs;

  final headsetPlugin = HeadsetEvent();
  final player = AudioPlayer();

  Map<PlayerStates, Color> matchColor = {
    PlayerStates.disabled: colorDisabled,
    PlayerStates.playable: colorPlayable,
    PlayerStates.playing: colorPlaying,
  };

  @override
  void onInit() {
    super.onInit();
    configurePlayer();
    headsetPlugin.requestPermission();

    headsetPlugin.getCurrentState.then((value) {
      _headsetState.value = value;
      update();
    });

    headsetPlugin.setListener((value) {
      _headsetState.value = value;
      if (value == HeadsetState.DISCONNECT) {
        playerState.value = PlayerStates.disabled;
        playerColor.value = matchColor[PlayerStates.disabled]!;
        update();
        showAlertSnackBar();

        if (playerState.value == PlayerStates.playing) {
          player.stop();
        }
      }

      if (playerState.value == PlayerStates.disabled &&
          value == HeadsetState.CONNECT) {
        playerState.value = PlayerStates.playable;
        playerColor.value = colorPlayable;
        update();
      }
    });

    playerColor.value = matchColor[playerState]!;
    update();
  }
/*
  void checkHeadsetsAtStart() {
    headsetPlugin.getCurrentState.then((value) {
      _headsetState.value = value;

      update();
      if (value == HeadsetState.DISCONNECT) {
        showAlertSnackBar();
      }
    });
  }
  */

  void changePlayerColor(PlayerStates playerState) {
    playerColor.value = matchColor[playerState]!;
  }

  void transitionPlayableState(PlayerStates currentState) {
    playerColor.value = matchColor[currentState]!;

    if (currentState == PlayerStates.playable) {
      playerState.value = PlayerStates.playing;
      update();
      changePlayerColor(playerState.value);
      playAudio();
    } else if (currentState == PlayerStates.playing) {
      playerState.value = PlayerStates.playable;
      update();
      changePlayerColor(playerState.value);
      player.stop();
    }
  }

  void configurePlayer() {
    player.setAsset('assets/music/Binaural_beats.mp3');
    player.setVolume(0.6);
  }

  void showAlertSnackBar() {
    Get.snackbar(
        backgroundColor: const Color.fromARGB(255, 220, 220, 220),
        duration: const Duration(seconds: 5),
        'Warning: earphones not plugged',
        'This application works best with earphones plugged, so plug earphones to start using it.',
        snackPosition: SnackPosition.BOTTOM);
  }

  void playAudio() {
    player.play();
  }
}
