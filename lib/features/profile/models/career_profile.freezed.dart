// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CareerProfile {

 String get name; String get headline; String get email; String get notice; String get salary; String get signOff; YearsBand get years; Set<String> get targetRoles; WorkLocation get location; MailTone get tone; CvContextScope get cvScope; List<String> get languages;
/// Create a copy of CareerProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerProfileCopyWith<CareerProfile> get copyWith => _$CareerProfileCopyWithImpl<CareerProfile>(this as CareerProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.email, email) || other.email == email)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.signOff, signOff) || other.signOff == signOff)&&(identical(other.years, years) || other.years == years)&&const DeepCollectionEquality().equals(other.targetRoles, targetRoles)&&(identical(other.location, location) || other.location == location)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.cvScope, cvScope) || other.cvScope == cvScope)&&const DeepCollectionEquality().equals(other.languages, languages));
}


@override
int get hashCode => Object.hash(runtimeType,name,headline,email,notice,salary,signOff,years,const DeepCollectionEquality().hash(targetRoles),location,tone,cvScope,const DeepCollectionEquality().hash(languages));

@override
String toString() {
  return 'CareerProfile(name: $name, headline: $headline, email: $email, notice: $notice, salary: $salary, signOff: $signOff, years: $years, targetRoles: $targetRoles, location: $location, tone: $tone, cvScope: $cvScope, languages: $languages)';
}


}

/// @nodoc
abstract mixin class $CareerProfileCopyWith<$Res>  {
  factory $CareerProfileCopyWith(CareerProfile value, $Res Function(CareerProfile) _then) = _$CareerProfileCopyWithImpl;
@useResult
$Res call({
 String name, String headline, String email, String notice, String salary, String signOff, YearsBand years, Set<String> targetRoles, WorkLocation location, MailTone tone, CvContextScope cvScope, List<String> languages
});




}
/// @nodoc
class _$CareerProfileCopyWithImpl<$Res>
    implements $CareerProfileCopyWith<$Res> {
  _$CareerProfileCopyWithImpl(this._self, this._then);

  final CareerProfile _self;
  final $Res Function(CareerProfile) _then;

/// Create a copy of CareerProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? headline = null,Object? email = null,Object? notice = null,Object? salary = null,Object? signOff = null,Object? years = null,Object? targetRoles = null,Object? location = null,Object? tone = null,Object? cvScope = null,Object? languages = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,notice: null == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as String,signOff: null == signOff ? _self.signOff : signOff // ignore: cast_nullable_to_non_nullable
as String,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as YearsBand,targetRoles: null == targetRoles ? _self.targetRoles : targetRoles // ignore: cast_nullable_to_non_nullable
as Set<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as WorkLocation,tone: null == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as MailTone,cvScope: null == cvScope ? _self.cvScope : cvScope // ignore: cast_nullable_to_non_nullable
as CvContextScope,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerProfile].
extension CareerProfilePatterns on CareerProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerProfile value)  $default,){
final _that = this;
switch (_that) {
case _CareerProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CareerProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String headline,  String email,  String notice,  String salary,  String signOff,  YearsBand years,  Set<String> targetRoles,  WorkLocation location,  MailTone tone,  CvContextScope cvScope,  List<String> languages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerProfile() when $default != null:
return $default(_that.name,_that.headline,_that.email,_that.notice,_that.salary,_that.signOff,_that.years,_that.targetRoles,_that.location,_that.tone,_that.cvScope,_that.languages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String headline,  String email,  String notice,  String salary,  String signOff,  YearsBand years,  Set<String> targetRoles,  WorkLocation location,  MailTone tone,  CvContextScope cvScope,  List<String> languages)  $default,) {final _that = this;
switch (_that) {
case _CareerProfile():
return $default(_that.name,_that.headline,_that.email,_that.notice,_that.salary,_that.signOff,_that.years,_that.targetRoles,_that.location,_that.tone,_that.cvScope,_that.languages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String headline,  String email,  String notice,  String salary,  String signOff,  YearsBand years,  Set<String> targetRoles,  WorkLocation location,  MailTone tone,  CvContextScope cvScope,  List<String> languages)?  $default,) {final _that = this;
switch (_that) {
case _CareerProfile() when $default != null:
return $default(_that.name,_that.headline,_that.email,_that.notice,_that.salary,_that.signOff,_that.years,_that.targetRoles,_that.location,_that.tone,_that.cvScope,_that.languages);case _:
  return null;

}
}

}

/// @nodoc


class _CareerProfile implements CareerProfile {
  const _CareerProfile({required this.name, required this.headline, required this.email, required this.notice, required this.salary, required this.signOff, this.years = YearsBand.fiveToSeven, final  Set<String> targetRoles = const <String>{}, this.location = WorkLocation.remote, this.tone = MailTone.formal, this.cvScope = CvContextScope.primaryOnly, final  List<String> languages = const ['English', 'Bahasa Indonesia']}): _targetRoles = targetRoles,_languages = languages;
  

@override final  String name;
@override final  String headline;
@override final  String email;
@override final  String notice;
@override final  String salary;
@override final  String signOff;
@override@JsonKey() final  YearsBand years;
 final  Set<String> _targetRoles;
@override@JsonKey() Set<String> get targetRoles {
  if (_targetRoles is EqualUnmodifiableSetView) return _targetRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_targetRoles);
}

@override@JsonKey() final  WorkLocation location;
@override@JsonKey() final  MailTone tone;
@override@JsonKey() final  CvContextScope cvScope;
 final  List<String> _languages;
@override@JsonKey() List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}


/// Create a copy of CareerProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerProfileCopyWith<_CareerProfile> get copyWith => __$CareerProfileCopyWithImpl<_CareerProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.email, email) || other.email == email)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.signOff, signOff) || other.signOff == signOff)&&(identical(other.years, years) || other.years == years)&&const DeepCollectionEquality().equals(other._targetRoles, _targetRoles)&&(identical(other.location, location) || other.location == location)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.cvScope, cvScope) || other.cvScope == cvScope)&&const DeepCollectionEquality().equals(other._languages, _languages));
}


@override
int get hashCode => Object.hash(runtimeType,name,headline,email,notice,salary,signOff,years,const DeepCollectionEquality().hash(_targetRoles),location,tone,cvScope,const DeepCollectionEquality().hash(_languages));

@override
String toString() {
  return 'CareerProfile(name: $name, headline: $headline, email: $email, notice: $notice, salary: $salary, signOff: $signOff, years: $years, targetRoles: $targetRoles, location: $location, tone: $tone, cvScope: $cvScope, languages: $languages)';
}


}

/// @nodoc
abstract mixin class _$CareerProfileCopyWith<$Res> implements $CareerProfileCopyWith<$Res> {
  factory _$CareerProfileCopyWith(_CareerProfile value, $Res Function(_CareerProfile) _then) = __$CareerProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String headline, String email, String notice, String salary, String signOff, YearsBand years, Set<String> targetRoles, WorkLocation location, MailTone tone, CvContextScope cvScope, List<String> languages
});




}
/// @nodoc
class __$CareerProfileCopyWithImpl<$Res>
    implements _$CareerProfileCopyWith<$Res> {
  __$CareerProfileCopyWithImpl(this._self, this._then);

  final _CareerProfile _self;
  final $Res Function(_CareerProfile) _then;

/// Create a copy of CareerProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? headline = null,Object? email = null,Object? notice = null,Object? salary = null,Object? signOff = null,Object? years = null,Object? targetRoles = null,Object? location = null,Object? tone = null,Object? cvScope = null,Object? languages = null,}) {
  return _then(_CareerProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,notice: null == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as String,signOff: null == signOff ? _self.signOff : signOff // ignore: cast_nullable_to_non_nullable
as String,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as YearsBand,targetRoles: null == targetRoles ? _self._targetRoles : targetRoles // ignore: cast_nullable_to_non_nullable
as Set<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as WorkLocation,tone: null == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as MailTone,cvScope: null == cvScope ? _self.cvScope : cvScope // ignore: cast_nullable_to_non_nullable
as CvContextScope,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
