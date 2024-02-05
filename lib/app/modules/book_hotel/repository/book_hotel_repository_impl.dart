import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'book_hotel_repository.dart';

part 'book_hotel_repository_impl.g.dart';

class BookHotelRepositoryImpl extends BookHotelRepository {
  // TODO add your methods here
}

@riverpod
 BookHotelRepository bookHotelRepository(BookHotelRepositoryRef ref) =>
    BookHotelRepositoryImpl();

