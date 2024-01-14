import 'package:flutter/material.dart';
import 'package:tebak_gambar/database/learning_video_data.dart';
import 'package:tebak_gambar/models/learning_video_model.dart';

class LearningVideoProvider with ChangeNotifier {
  final List<LearningVideoModel> _videos = [];
  List<LearningVideoModel> get videos => _videos;
  bool isLoading = false;
  bool _isLandscape = false;
  bool get isLandscape => _isLandscape;
  bool _isPinched = false;
  bool get isPinched => _isPinched;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getVideo() {
    if(_videos.isEmpty) {
      initializeVideos();
    }
  }

  getIsPinched(bool isPinched) {
    _isPinched = isPinched;
  }

  setIsLandscape(bool isLandscape) {
    _isLandscape = isLandscape;
  }

  void initializeVideos() {
    LearningVideoData learningVideoData = LearningVideoData();

    for (var video in learningVideoData.videos) {
      _videos.add(
        LearningVideoModel(
          title: video['title'],
          videoPath: video['video_path'],
        ),
      );
    }
  }
}
