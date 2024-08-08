import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/album_model.dart';
import '../../../services/album_service.dart';

class HomeViewModel extends StateNotifier<AsyncValue<List<AlbumModel>>> {
  final AlbumService _albumService;

  HomeViewModel(this._albumService) : super(const AsyncValue.loading());

  Future<void> loadAlbums() async {
    try {
      final albums = await _albumService.fetchAlbums();
      state = AsyncValue.data(albums);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
