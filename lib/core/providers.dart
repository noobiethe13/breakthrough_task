import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/home/viewmodels/favourite_notifier.dart';
import '../features/home/viewmodels/home_viewmodel.dart';
import '../models/album_model.dart';
import '../services/album_service.dart';
// Provider for AlbumService
final albumServiceProvider = Provider((ref) => AlbumService());

// Provider for HomeViewModel
final homeViewModelProvider =
StateNotifierProvider<HomeViewModel, AsyncValue<List<AlbumModel>>>(
      (ref) {
    final albumService = ref.watch(albumServiceProvider);
    return HomeViewModel(albumService)..loadAlbums();
  },
);

//Provider for Favourite Albums Count
final favoriteAlbumsProvider = StateNotifierProvider<FavoriteAlbumsNotifier, List<AlbumModel>>(
      (ref) => FavoriteAlbumsNotifier(),
);

