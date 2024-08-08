import 'package:breakthrough_task/features/home/viewmodels/home_viewmodel.dart';
import 'package:breakthrough_task/models/album_model.dart';
import 'package:breakthrough_task/services/album_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_viewmodel_test.mocks.dart';

@GenerateMocks([AlbumService])
void main() {
  late MockAlbumService mockAlbumService;
  late HomeViewModel homeViewModel;
  late ProviderContainer container;

  setUp(() {
    mockAlbumService = MockAlbumService();
    container = ProviderContainer();
    homeViewModel = HomeViewModel(mockAlbumService);
  });

  tearDown(() {
    container.dispose();
  });

  test('HomeViewModel fetches albums successfully', () async {
    final albumList = [
      AlbumModel(
        artistName: 'Artist 1',
        collectionName: 'Collection 1',
        artworkUrl100: 'https://example.com/artwork1.jpg',
        collectionPrice: 10.0,
        releaseDate: DateTime.parse('2022-01-01'),
      ),
      AlbumModel(
        artistName: 'Artist 2',
        collectionName: 'Collection 2',
        artworkUrl100: 'https://example.com/artwork2.jpg',
        collectionPrice: 12.0,
        releaseDate: DateTime.parse('2023-01-01'),
      ),
    ];

    when(mockAlbumService.fetchAlbums()).thenAnswer((_) async => albumList);

    await homeViewModel.loadAlbums();

    expect(homeViewModel.state, AsyncValue.data(albumList));
  });

  test('HomeViewModel handles fetchAlbums error', () async {
    when(mockAlbumService.fetchAlbums()).thenThrow(Exception('Failed to load albums'));

    await homeViewModel.loadAlbums();

    expect(homeViewModel.state, isA<AsyncValue<List<AlbumModel>>>());
    expect(homeViewModel.state.hasError, true);
  });
}
