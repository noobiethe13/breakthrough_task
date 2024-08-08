import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/album_model.dart';

class FavoriteAlbumsNotifier extends StateNotifier<List<AlbumModel>> {
  FavoriteAlbumsNotifier() : super([]);

  void toggleFavorite(AlbumModel album) {
    if (state.contains(album)) {
      state = state.where((a) => a != album).toList();
    } else {
      state = [...state, album];
    }
  }
}