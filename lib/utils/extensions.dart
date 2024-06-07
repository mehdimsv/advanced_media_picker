import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

import '../models/asset_model.dart';
import 'package:collection/collection.dart';

extension FileTypeExtension on String {
  bool isPicture() =>
      toLowerCase().endsWith('.svg') ||
      toLowerCase().endsWith('.png') ||
      toLowerCase().endsWith('.jpg') ||
      toLowerCase().endsWith('.jpeg') ||
      toLowerCase().endsWith('.gif') ||
      toLowerCase().endsWith('.webp');

  bool isVideo() =>
      toLowerCase().endsWith('.mp4') ||
      toLowerCase().endsWith('.mov') ||
      toLowerCase().endsWith('.avi') ||
      toLowerCase().endsWith('.flv') ||
      toLowerCase().endsWith('.wmv');
}

extension AssetContains on List<AssetModel> {
  bool containsAsset(AssetEntity asset) =>
      firstWhereOrNull((AssetModel element) => element.id == asset.id) != null;
}

extension ValueAssetsList on ValueNotifier<List<AssetModel>> {
  bool containsAsset(AssetEntity asset) =>
      value.firstWhereOrNull((AssetModel element) => element.id == asset.id) != null;

  void addAsset(AssetModel asset) {
    value = <AssetModel>[...value, asset];
  }

  void removeAsset(AssetModel asset) {
    value = <AssetModel>[...value]..removeWhere((AssetModel element) => element.id == asset.id);
  }
}
