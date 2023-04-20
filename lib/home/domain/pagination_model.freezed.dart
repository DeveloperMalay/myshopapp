// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MasterPaginationModel<T> {
  List<ProductModel> get posts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get initialLoaded => throw _privateConstructorUsedError;
  bool get isPaginationLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterPaginationModelCopyWith<T, MasterPaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterPaginationModelCopyWith<T, $Res> {
  factory $MasterPaginationModelCopyWith(MasterPaginationModel<T> value,
          $Res Function(MasterPaginationModel<T>) then) =
      _$MasterPaginationModelCopyWithImpl<T, $Res, MasterPaginationModel<T>>;
  @useResult
  $Res call(
      {List<ProductModel> posts,
      int page,
      String errorMessage,
      bool initialLoaded,
      bool isPaginationLoading});
}

/// @nodoc
class _$MasterPaginationModelCopyWithImpl<T, $Res,
        $Val extends MasterPaginationModel<T>>
    implements $MasterPaginationModelCopyWith<T, $Res> {
  _$MasterPaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
    Object? errorMessage = null,
    Object? initialLoaded = null,
    Object? isPaginationLoading = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      initialLoaded: null == initialLoaded
          ? _value.initialLoaded
          : initialLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaginationLoading: null == isPaginationLoading
          ? _value.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MasterPaginationModelCopyWith<T, $Res>
    implements $MasterPaginationModelCopyWith<T, $Res> {
  factory _$$_MasterPaginationModelCopyWith(_$_MasterPaginationModel<T> value,
          $Res Function(_$_MasterPaginationModel<T>) then) =
      __$$_MasterPaginationModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> posts,
      int page,
      String errorMessage,
      bool initialLoaded,
      bool isPaginationLoading});
}

/// @nodoc
class __$$_MasterPaginationModelCopyWithImpl<T, $Res>
    extends _$MasterPaginationModelCopyWithImpl<T, $Res,
        _$_MasterPaginationModel<T>>
    implements _$$_MasterPaginationModelCopyWith<T, $Res> {
  __$$_MasterPaginationModelCopyWithImpl(_$_MasterPaginationModel<T> _value,
      $Res Function(_$_MasterPaginationModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
    Object? errorMessage = null,
    Object? initialLoaded = null,
    Object? isPaginationLoading = null,
  }) {
    return _then(_$_MasterPaginationModel<T>(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      initialLoaded: null == initialLoaded
          ? _value.initialLoaded
          : initialLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaginationLoading: null == isPaginationLoading
          ? _value.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MasterPaginationModel<T> extends _MasterPaginationModel<T> {
  _$_MasterPaginationModel(
      {final List<ProductModel> posts = const [],
      this.page = 10,
      this.errorMessage = '',
      this.initialLoaded = false,
      this.isPaginationLoading = false})
      : _posts = posts,
        super._();

  final List<ProductModel> _posts;
  @override
  @JsonKey()
  List<ProductModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool initialLoaded;
  @override
  @JsonKey()
  final bool isPaginationLoading;

  @override
  String toString() {
    return 'MasterPaginationModel<$T>(posts: $posts, page: $page, errorMessage: $errorMessage, initialLoaded: $initialLoaded, isPaginationLoading: $isPaginationLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MasterPaginationModel<T> &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.initialLoaded, initialLoaded) ||
                other.initialLoaded == initialLoaded) &&
            (identical(other.isPaginationLoading, isPaginationLoading) ||
                other.isPaginationLoading == isPaginationLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      page,
      errorMessage,
      initialLoaded,
      isPaginationLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MasterPaginationModelCopyWith<T, _$_MasterPaginationModel<T>>
      get copyWith => __$$_MasterPaginationModelCopyWithImpl<T,
          _$_MasterPaginationModel<T>>(this, _$identity);
}

abstract class _MasterPaginationModel<T> extends MasterPaginationModel<T> {
  factory _MasterPaginationModel(
      {final List<ProductModel> posts,
      final int page,
      final String errorMessage,
      final bool initialLoaded,
      final bool isPaginationLoading}) = _$_MasterPaginationModel<T>;
  _MasterPaginationModel._() : super._();

  @override
  List<ProductModel> get posts;
  @override
  int get page;
  @override
  String get errorMessage;
  @override
  bool get initialLoaded;
  @override
  bool get isPaginationLoading;
  @override
  @JsonKey(ignore: true)
  _$$_MasterPaginationModelCopyWith<T, _$_MasterPaginationModel<T>>
      get copyWith => throw _privateConstructorUsedError;
}
