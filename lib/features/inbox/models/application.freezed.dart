// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Application {

 String get id; String get company; String get role; String get location; String get level;/// Display name of the CV used, as it was when the mail was drafted.
 String get cvName; AppStatus get status; bool get unread;/// Match score, 0 to 100.
 int get score;/// Last activity, shown on the row.
 DateTime get date; String get snippet; DateTime? get sentAt; String? get sentMail;
/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationCopyWith<Application> get copyWith => _$ApplicationCopyWithImpl<Application>(this as Application, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Application&&(identical(other.id, id) || other.id == id)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.cvName, cvName) || other.cvName == cvName)&&(identical(other.status, status) || other.status == status)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.score, score) || other.score == score)&&(identical(other.date, date) || other.date == date)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.sentMail, sentMail) || other.sentMail == sentMail));
}


@override
int get hashCode => Object.hash(runtimeType,id,company,role,location,level,cvName,status,unread,score,date,snippet,sentAt,sentMail);

@override
String toString() {
  return 'Application(id: $id, company: $company, role: $role, location: $location, level: $level, cvName: $cvName, status: $status, unread: $unread, score: $score, date: $date, snippet: $snippet, sentAt: $sentAt, sentMail: $sentMail)';
}


}

/// @nodoc
abstract mixin class $ApplicationCopyWith<$Res>  {
  factory $ApplicationCopyWith(Application value, $Res Function(Application) _then) = _$ApplicationCopyWithImpl;
@useResult
$Res call({
 String id, String company, String role, String location, String level, String cvName, AppStatus status, bool unread, int score, DateTime date, String snippet, DateTime? sentAt, String? sentMail
});




}
/// @nodoc
class _$ApplicationCopyWithImpl<$Res>
    implements $ApplicationCopyWith<$Res> {
  _$ApplicationCopyWithImpl(this._self, this._then);

  final Application _self;
  final $Res Function(Application) _then;

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? company = null,Object? role = null,Object? location = null,Object? level = null,Object? cvName = null,Object? status = null,Object? unread = null,Object? score = null,Object? date = null,Object? snippet = null,Object? sentAt = freezed,Object? sentMail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,cvName: null == cvName ? _self.cvName : cvName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,snippet: null == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sentMail: freezed == sentMail ? _self.sentMail : sentMail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Application].
extension ApplicationPatterns on Application {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Application value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Application() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Application value)  $default,){
final _that = this;
switch (_that) {
case _Application():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Application value)?  $default,){
final _that = this;
switch (_that) {
case _Application() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String company,  String role,  String location,  String level,  String cvName,  AppStatus status,  bool unread,  int score,  DateTime date,  String snippet,  DateTime? sentAt,  String? sentMail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Application() when $default != null:
return $default(_that.id,_that.company,_that.role,_that.location,_that.level,_that.cvName,_that.status,_that.unread,_that.score,_that.date,_that.snippet,_that.sentAt,_that.sentMail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String company,  String role,  String location,  String level,  String cvName,  AppStatus status,  bool unread,  int score,  DateTime date,  String snippet,  DateTime? sentAt,  String? sentMail)  $default,) {final _that = this;
switch (_that) {
case _Application():
return $default(_that.id,_that.company,_that.role,_that.location,_that.level,_that.cvName,_that.status,_that.unread,_that.score,_that.date,_that.snippet,_that.sentAt,_that.sentMail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String company,  String role,  String location,  String level,  String cvName,  AppStatus status,  bool unread,  int score,  DateTime date,  String snippet,  DateTime? sentAt,  String? sentMail)?  $default,) {final _that = this;
switch (_that) {
case _Application() when $default != null:
return $default(_that.id,_that.company,_that.role,_that.location,_that.level,_that.cvName,_that.status,_that.unread,_that.score,_that.date,_that.snippet,_that.sentAt,_that.sentMail);case _:
  return null;

}
}

}

/// @nodoc


class _Application implements Application {
  const _Application({required this.id, required this.company, required this.role, required this.location, required this.level, required this.cvName, required this.status, required this.unread, required this.score, required this.date, required this.snippet, this.sentAt, this.sentMail});
  

@override final  String id;
@override final  String company;
@override final  String role;
@override final  String location;
@override final  String level;
/// Display name of the CV used, as it was when the mail was drafted.
@override final  String cvName;
@override final  AppStatus status;
@override final  bool unread;
/// Match score, 0 to 100.
@override final  int score;
/// Last activity, shown on the row.
@override final  DateTime date;
@override final  String snippet;
@override final  DateTime? sentAt;
@override final  String? sentMail;

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationCopyWith<_Application> get copyWith => __$ApplicationCopyWithImpl<_Application>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Application&&(identical(other.id, id) || other.id == id)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.cvName, cvName) || other.cvName == cvName)&&(identical(other.status, status) || other.status == status)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.score, score) || other.score == score)&&(identical(other.date, date) || other.date == date)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.sentMail, sentMail) || other.sentMail == sentMail));
}


@override
int get hashCode => Object.hash(runtimeType,id,company,role,location,level,cvName,status,unread,score,date,snippet,sentAt,sentMail);

@override
String toString() {
  return 'Application(id: $id, company: $company, role: $role, location: $location, level: $level, cvName: $cvName, status: $status, unread: $unread, score: $score, date: $date, snippet: $snippet, sentAt: $sentAt, sentMail: $sentMail)';
}


}

/// @nodoc
abstract mixin class _$ApplicationCopyWith<$Res> implements $ApplicationCopyWith<$Res> {
  factory _$ApplicationCopyWith(_Application value, $Res Function(_Application) _then) = __$ApplicationCopyWithImpl;
@override @useResult
$Res call({
 String id, String company, String role, String location, String level, String cvName, AppStatus status, bool unread, int score, DateTime date, String snippet, DateTime? sentAt, String? sentMail
});




}
/// @nodoc
class __$ApplicationCopyWithImpl<$Res>
    implements _$ApplicationCopyWith<$Res> {
  __$ApplicationCopyWithImpl(this._self, this._then);

  final _Application _self;
  final $Res Function(_Application) _then;

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? company = null,Object? role = null,Object? location = null,Object? level = null,Object? cvName = null,Object? status = null,Object? unread = null,Object? score = null,Object? date = null,Object? snippet = null,Object? sentAt = freezed,Object? sentMail = freezed,}) {
  return _then(_Application(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,cvName: null == cvName ? _self.cvName : cvName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,snippet: null == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sentMail: freezed == sentMail ? _self.sentMail : sentMail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
