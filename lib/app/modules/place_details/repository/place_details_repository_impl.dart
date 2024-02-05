import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'place_details_repository.dart';

part 'place_details_repository_impl.g.dart';

class PlaceDetailsRepositoryImpl extends PlaceDetailsRepository {
  // TODO add your methods here
}

@riverpod
 PlaceDetailsRepository placeDetailsRepository(PlaceDetailsRepositoryRef ref) =>
    PlaceDetailsRepositoryImpl();

