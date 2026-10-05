// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Suggestion {

 String get id; SuggestionTag get tag;/// Where in the CV the line lives, e.g. "Summary, line 1".
 String get where;/// Expected lift, e.g. "+4 match" or "clarity".
 String get lift; String get before; String get after; SuggestionStatus get status;
/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionCopyWith<Suggestion> get copyWith => _$SuggestionCopyWithImpl<Suggestion>(this as Suggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Suggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.where, where) || other.where == where)&&(identical(other.lift, lift) || other.lift == lift)&&(identical(other.before, before) || other.before == before)&&(identical(other.after, after) || other.after == after)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,tag,where,lift,before,after,status);

@override
String toString() {
  return 'Suggestion(id: $id, tag: $tag, where: $where, lift: $lift, before: $before, after: $after, status: $status)';
}


}

/// @nodoc
abstract mixin class $SuggestionCopyWith<$Res>  {
  factory $SuggestionCopyWith(Suggestion value, $Res Function(Suggestion) _then) = _$SuggestionCopyWithImpl;
@useResult
$Res call({
 String id, SuggestionTag tag, String where, String lift, String before, String after, SuggestionStatus status
});




}
/// @nodoc
class _$SuggestionCopyWithImpl<$Res>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._self, this._then);

  final Suggestion _self;
  final $Res Function(Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tag = null,Object? where = null,Object? lift = null,Object? before = null,Object? after = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as SuggestionTag,where: null == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String,lift: null == lift ? _self.lift : lift // ignore: cast_nullable_to_non_nullable
as String,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SuggestionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Suggestion].
extension SuggestionPatterns on Suggestion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Suggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Suggestion value)  $default,){
final _that = this;
switch (_that) {
case _Suggestion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Suggestion value)?  $default,){
final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SuggestionTag tag,  String where,  String lift,  String before,  String after,  SuggestionStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.id,_that.tag,_that.where,_that.lift,_that.before,_that.after,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SuggestionTag tag,  String where,  String lift,  String before,  String after,  SuggestionStatus status)  $default,) {final _that = this;
switch (_that) {
case _Suggestion():
return $default(_that.id,_that.tag,_that.where,_that.lift,_that.before,_that.after,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SuggestionTag tag,  String where,  String lift,  String before,  String after,  SuggestionStatus status)?  $default,) {final _that = this;
switch (_that) {
case _Suggestion() when $default != null:
return $default(_that.id,_that.tag,_that.where,_that.lift,_that.before,_that.after,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Suggestion implements Suggestion {
  const _Suggestion({required this.id, required this.tag, required this.where, required this.lift, required this.before, required this.after, this.status = SuggestionStatus.open});
  

@override final  String id;
@override final  SuggestionTag tag;
/// Where in the CV the line lives, e.g. "Summary, line 1".
@override final  String where;
/// Expected lift, e.g. "+4 match" or "clarity".
@override final  String lift;
@override final  String before;
@override final  String after;
@override@JsonKey() final  SuggestionStatus status;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionCopyWith<_Suggestion> get copyWith => __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.where, where) || other.where == where)&&(identical(other.lift, lift) || other.lift == lift)&&(identical(other.before, before) || other.before == before)&&(identical(other.after, after) || other.after == after)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,tag,where,lift,before,after,status);

@override
String toString() {
  return 'Suggestion(id: $id, tag: $tag, where: $where, lift: $lift, before: $before, after: $after, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SuggestionCopyWith<$Res> implements $SuggestionCopyWith<$Res> {
  factory _$SuggestionCopyWith(_Suggestion value, $Res Function(_Suggestion) _then) = __$SuggestionCopyWithImpl;
@override @useResult
$Res call({
 String id, SuggestionTag tag, String where, String lift, String before, String after, SuggestionStatus status
});




}
/// @nodoc
class __$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(this._self, this._then);

  final _Suggestion _self;
  final $Res Function(_Suggestion) _then;

/// Create a copy of Suggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tag = null,Object? where = null,Object? lift = null,Object? before = null,Object? after = null,Object? status = null,}) {
  return _then(_Suggestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as SuggestionTag,where: null == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String,lift: null == lift ? _self.lift : lift // ignore: cast_nullable_to_non_nullable
as String,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SuggestionStatus,
  ));
}


}

// dart format on
