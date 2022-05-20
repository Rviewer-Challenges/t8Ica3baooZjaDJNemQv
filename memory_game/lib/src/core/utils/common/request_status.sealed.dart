// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_status.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [RequestStatus]<[T] extends [Object]?> {
///
/// ([RequestStatusInitial] initial){} with data equality
///
/// ([RequestStatusLoading] loading){} with data equality
///
/// ([RequestStatusSuccess] success){[T]? data} with data equality
///
/// ([RequestStatusFailure] failure){[String] error} with data equality
///
/// }
@SealedManifest(_RequestStatus)
abstract class RequestStatus<T extends Object?> {
  const RequestStatus._internal();

  const factory RequestStatus.initial() = RequestStatusInitial<T>;

  const factory RequestStatus.loading() = RequestStatusLoading<T>;

  const factory RequestStatus.success({
    T? data,
  }) = RequestStatusSuccess<T>;

  const factory RequestStatus.failure({
    required String error,
  }) = RequestStatusFailure<T>;

  bool get isInitial => this is RequestStatusInitial<T>;

  bool get isLoading => this is RequestStatusLoading<T>;

  bool get isSuccess => this is RequestStatusSuccess<T>;

  bool get isFailure => this is RequestStatusFailure<T>;

  RequestStatusInitial<T> get asInitial => this as RequestStatusInitial<T>;

  RequestStatusLoading<T> get asLoading => this as RequestStatusLoading<T>;

  RequestStatusSuccess<T> get asSuccess => this as RequestStatusSuccess<T>;

  RequestStatusFailure<T> get asFailure => this as RequestStatusFailure<T>;

  RequestStatusInitial<T>? get asInitialOrNull {
    final requestStatus = this;
    return requestStatus is RequestStatusInitial<T> ? requestStatus : null;
  }

  RequestStatusLoading<T>? get asLoadingOrNull {
    final requestStatus = this;
    return requestStatus is RequestStatusLoading<T> ? requestStatus : null;
  }

  RequestStatusSuccess<T>? get asSuccessOrNull {
    final requestStatus = this;
    return requestStatus is RequestStatusSuccess<T> ? requestStatus : null;
  }

  RequestStatusFailure<T>? get asFailureOrNull {
    final requestStatus = this;
    return requestStatus is RequestStatusFailure<T> ? requestStatus : null;
  }

  R when<R extends Object?>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T? data) success,
    required R Function(String error) failure,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial();
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading();
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success(requestStatus.data);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure(requestStatus.error);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? initial,
    R Function()? loading,
    R Function(T? data)? success,
    R Function(String error)? failure,
    required R Function(RequestStatus<T> requestStatus) orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial != null ? initial() : orElse(requestStatus);
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading != null ? loading() : orElse(requestStatus);
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success != null
          ? success(requestStatus.data)
          : orElse(requestStatus);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure != null
          ? failure(requestStatus.error)
          : orElse(requestStatus);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function()? initial,
    void Function()? loading,
    void Function(T? data)? success,
    void Function(String error)? failure,
    void Function(RequestStatus<T> requestStatus)? orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      if (initial != null) {
        initial();
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusLoading<T>) {
      if (loading != null) {
        loading();
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusSuccess<T>) {
      if (success != null) {
        success(requestStatus.data);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusFailure<T>) {
      if (failure != null) {
        failure(requestStatus.error);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? initial,
    R Function()? loading,
    R Function(T? data)? success,
    R Function(String error)? failure,
    R Function(RequestStatus<T> requestStatus)? orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial != null ? initial() : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading != null ? loading() : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success != null
          ? success(requestStatus.data)
          : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure != null
          ? failure(requestStatus.error)
          : orElse?.call(requestStatus);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(RequestStatusInitial<T> initial) initial,
    required R Function(RequestStatusLoading<T> loading) loading,
    required R Function(RequestStatusSuccess<T> success) success,
    required R Function(RequestStatusFailure<T> failure) failure,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial(requestStatus);
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading(requestStatus);
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success(requestStatus);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure(requestStatus);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(RequestStatusInitial<T> initial)? initial,
    R Function(RequestStatusLoading<T> loading)? loading,
    R Function(RequestStatusSuccess<T> success)? success,
    R Function(RequestStatusFailure<T> failure)? failure,
    required R Function(RequestStatus<T> requestStatus) orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial != null ? initial(requestStatus) : orElse(requestStatus);
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading != null ? loading(requestStatus) : orElse(requestStatus);
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success != null ? success(requestStatus) : orElse(requestStatus);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure != null ? failure(requestStatus) : orElse(requestStatus);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(RequestStatusInitial<T> initial)? initial,
    void Function(RequestStatusLoading<T> loading)? loading,
    void Function(RequestStatusSuccess<T> success)? success,
    void Function(RequestStatusFailure<T> failure)? failure,
    void Function(RequestStatus<T> requestStatus)? orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      if (initial != null) {
        initial(requestStatus);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusLoading<T>) {
      if (loading != null) {
        loading(requestStatus);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusSuccess<T>) {
      if (success != null) {
        success(requestStatus);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else if (requestStatus is RequestStatusFailure<T>) {
      if (failure != null) {
        failure(requestStatus);
      } else if (orElse != null) {
        orElse(requestStatus);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(RequestStatusInitial<T> initial)? initial,
    R Function(RequestStatusLoading<T> loading)? loading,
    R Function(RequestStatusSuccess<T> success)? success,
    R Function(RequestStatusFailure<T> failure)? failure,
    R Function(RequestStatus<T> requestStatus)? orElse,
  }) {
    final requestStatus = this;
    if (requestStatus is RequestStatusInitial<T>) {
      return initial != null
          ? initial(requestStatus)
          : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusLoading<T>) {
      return loading != null
          ? loading(requestStatus)
          : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusSuccess<T>) {
      return success != null
          ? success(requestStatus)
          : orElse?.call(requestStatus);
    } else if (requestStatus is RequestStatusFailure<T>) {
      return failure != null
          ? failure(requestStatus)
          : orElse?.call(requestStatus);
    } else {
      throw AssertionError();
    }
  }
}

/// (([RequestStatusInitial] : [RequestStatus])<[T] extends [Object]?> initial){}
///
/// with data equality
class RequestStatusInitial<T extends Object?> extends RequestStatus<T>
    with EquatableMixin {
  const RequestStatusInitial() : super._internal();

  @override
  String toString() => 'RequestStatus.initial()';

  @override
  List<Object?> get props => [];
}

/// (([RequestStatusLoading] : [RequestStatus])<[T] extends [Object]?> loading){}
///
/// with data equality
class RequestStatusLoading<T extends Object?> extends RequestStatus<T>
    with EquatableMixin {
  const RequestStatusLoading() : super._internal();

  @override
  String toString() => 'RequestStatus.loading()';

  @override
  List<Object?> get props => [];
}

/// (([RequestStatusSuccess] : [RequestStatus])<[T] extends [Object]?> success){[T]? data}
///
/// with data equality
class RequestStatusSuccess<T extends Object?> extends RequestStatus<T>
    with EquatableMixin {
  const RequestStatusSuccess({
    this.data,
  }) : super._internal();

  final T? data;

  @override
  String toString() => 'RequestStatus.success(data: $data)';

  @override
  List<Object?> get props => [
        data,
      ];
}

/// (([RequestStatusFailure] : [RequestStatus])<[T] extends [Object]?> failure){[String] error}
///
/// with data equality
class RequestStatusFailure<T extends Object?> extends RequestStatus<T>
    with EquatableMixin {
  const RequestStatusFailure({
    required this.error,
  }) : super._internal();

  final String error;

  @override
  String toString() => 'RequestStatus.failure(error: $error)';

  @override
  List<Object?> get props => [
        error,
      ];
}
