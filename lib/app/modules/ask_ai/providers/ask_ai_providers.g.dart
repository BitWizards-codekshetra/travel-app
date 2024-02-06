// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_ai_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$askAiHash() => r'5e1617ed368e1904b51f2c3bd8565a7c837dd11d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef AskAiRef = AutoDisposeFutureProviderRef<AskiAiResponse>;

/// See also [askAi].
@ProviderFor(askAi)
const askAiProvider = AskAiFamily();

/// See also [askAi].
class AskAiFamily extends Family<AsyncValue<AskiAiResponse>> {
  /// See also [askAi].
  const AskAiFamily();

  /// See also [askAi].
  AskAiProvider call({
    required String budget,
    required String place,
    required String travelOption,
  }) {
    return AskAiProvider(
      budget: budget,
      place: place,
      travelOption: travelOption,
    );
  }

  @override
  AskAiProvider getProviderOverride(
    covariant AskAiProvider provider,
  ) {
    return call(
      budget: provider.budget,
      place: provider.place,
      travelOption: provider.travelOption,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'askAiProvider';
}

/// See also [askAi].
class AskAiProvider extends AutoDisposeFutureProvider<AskiAiResponse> {
  /// See also [askAi].
  AskAiProvider({
    required this.budget,
    required this.place,
    required this.travelOption,
  }) : super.internal(
          (ref) => askAi(
            ref,
            budget: budget,
            place: place,
            travelOption: travelOption,
          ),
          from: askAiProvider,
          name: r'askAiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$askAiHash,
          dependencies: AskAiFamily._dependencies,
          allTransitiveDependencies: AskAiFamily._allTransitiveDependencies,
        );

  final String budget;
  final String place;
  final String travelOption;

  @override
  bool operator ==(Object other) {
    return other is AskAiProvider &&
        other.budget == budget &&
        other.place == place &&
        other.travelOption == travelOption;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, budget.hashCode);
    hash = _SystemHash.combine(hash, place.hashCode);
    hash = _SystemHash.combine(hash, travelOption.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
