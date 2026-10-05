// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MailDraft {

 String get to; String get subject; String get body;
/// Create a copy of MailDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MailDraftCopyWith<MailDraft> get copyWith => _$MailDraftCopyWithImpl<MailDraft>(this as MailDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MailDraft&&(identical(other.to, to) || other.to == to)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,to,subject,body);

@override
String toString() {
  return 'MailDraft(to: $to, subject: $subject, body: $body)';
}


}

/// @nodoc
abstract mixin class $MailDraftCopyWith<$Res>  {
  factory $MailDraftCopyWith(MailDraft value, $Res Function(MailDraft) _then) = _$MailDraftCopyWithImpl;
@useResult
$Res call({
 String to, String subject, String body
});




}
/// @nodoc
class _$MailDraftCopyWithImpl<$Res>
    implements $MailDraftCopyWith<$Res> {
  _$MailDraftCopyWithImpl(this._self, this._then);

  final MailDraft _self;
  final $Res Function(MailDraft) _then;

/// Create a copy of MailDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? to = null,Object? subject = null,Object? body = null,}) {
  return _then(_self.copyWith(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MailDraft].
extension MailDraftPatterns on MailDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MailDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MailDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MailDraft value)  $default,){
final _that = this;
switch (_that) {
case _MailDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MailDraft value)?  $default,){
final _that = this;
switch (_that) {
case _MailDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String to,  String subject,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MailDraft() when $default != null:
return $default(_that.to,_that.subject,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String to,  String subject,  String body)  $default,) {final _that = this;
switch (_that) {
case _MailDraft():
return $default(_that.to,_that.subject,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String to,  String subject,  String body)?  $default,) {final _that = this;
switch (_that) {
case _MailDraft() when $default != null:
return $default(_that.to,_that.subject,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _MailDraft implements MailDraft {
  const _MailDraft({required this.to, required this.subject, required this.body});
  

@override final  String to;
@override final  String subject;
@override final  String body;

/// Create a copy of MailDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MailDraftCopyWith<_MailDraft> get copyWith => __$MailDraftCopyWithImpl<_MailDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MailDraft&&(identical(other.to, to) || other.to == to)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,to,subject,body);

@override
String toString() {
  return 'MailDraft(to: $to, subject: $subject, body: $body)';
}


}

/// @nodoc
abstract mixin class _$MailDraftCopyWith<$Res> implements $MailDraftCopyWith<$Res> {
  factory _$MailDraftCopyWith(_MailDraft value, $Res Function(_MailDraft) _then) = __$MailDraftCopyWithImpl;
@override @useResult
$Res call({
 String to, String subject, String body
});




}
/// @nodoc
class __$MailDraftCopyWithImpl<$Res>
    implements _$MailDraftCopyWith<$Res> {
  __$MailDraftCopyWithImpl(this._self, this._then);

  final _MailDraft _self;
  final $Res Function(_MailDraft) _then;

/// Create a copy of MailDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? to = null,Object? subject = null,Object? body = null,}) {
  return _then(_MailDraft(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
