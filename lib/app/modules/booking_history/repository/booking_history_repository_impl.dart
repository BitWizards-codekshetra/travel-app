import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'booking_history_repository.dart';

part 'booking_history_repository_impl.g.dart';

class BookingHistoryRepositoryImpl extends BookingHistoryRepository {
  // TODO add your methods here
}

@riverpod
 BookingHistoryRepository bookingHistoryRepository(BookingHistoryRepositoryRef ref) =>
    BookingHistoryRepositoryImpl();

