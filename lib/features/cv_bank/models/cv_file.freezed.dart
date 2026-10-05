// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CvExperience {

 String get years; String get role; String get company; String get line;
/// Create a copy of CvExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CvExperienceCopyWith<CvExperience> get copyWith => _$CvExperienceCopyWithImpl<CvExperience>(this as CvExperience, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CvExperience&&(identical(other.years, years) || other.years == years)&&(identical(other.role, role) || other.role == role)&&(identical(other.company, company) || other.company == company)&&(identical(other.line, line) || other.line == line));
}


@override
int get hashCode => Object.hash(runtimeType,years,role,company,line);

@override
String toString() {
  return 'CvExperience(years: $years, role: $role, company: $company, line: $line)';
}


}

/// @nodoc
abstract mixin class $CvExperienceCopyWith<$Res>  {
  factory $CvExperienceCopyWith(CvExperience value, $Res Function(CvExperience) _then) = _$CvExperienceCopyWithImpl;
@useResult
$Res call({
 String years, String role, String company, String line
});




}
/// @nodoc
class _$CvExperienceCopyWithImpl<$Res>
    implements $CvExperienceCopyWith<$Res> {
  _$CvExperienceCopyWithImpl(this._self, this._then);

  final CvExperience _self;
  final $Res Function(CvExperience) _then;

/// Create a copy of CvExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? years = null,Object? role = null,Object? company = null,Object? line = null,}) {
  return _then(_self.copyWith(
years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CvExperience].
extension CvExperiencePatterns on CvExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CvExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CvExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CvExperience value)  $default,){
final _that = this;
switch (_that) {
case _CvExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CvExperience value)?  $default,){
final _that = this;
switch (_that) {
case _CvExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String years,  String role,  String company,  String line)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CvExperience() when $default != null:
return $default(_that.years,_that.role,_that.company,_that.line);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String years,  String role,  String company,  String line)  $default,) {final _that = this;
switch (_that) {
case _CvExperience():
return $default(_that.years,_that.role,_that.company,_that.line);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String years,  String role,  String company,  String line)?  $default,) {final _that = this;
switch (_that) {
case _CvExperience() when $default != null:
return $default(_that.years,_that.role,_that.company,_that.line);case _:
  return null;

}
}

}

/// @nodoc


class _CvExperience implements CvExperience {
  const _CvExperience({required this.years, required this.role, required this.company, required this.line});
  

@override final  String years;
@override final  String role;
@override final  String company;
@override final  String line;

/// Create a copy of CvExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CvExperienceCopyWith<_CvExperience> get copyWith => __$CvExperienceCopyWithImpl<_CvExperience>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CvExperience&&(identical(other.years, years) || other.years == years)&&(identical(other.role, role) || other.role == role)&&(identical(other.company, company) || other.company == company)&&(identical(other.line, line) || other.line == line));
}


@override
int get hashCode => Object.hash(runtimeType,years,role,company,line);

@override
String toString() {
  return 'CvExperience(years: $years, role: $role, company: $company, line: $line)';
}


}

/// @nodoc
abstract mixin class _$CvExperienceCopyWith<$Res> implements $CvExperienceCopyWith<$Res> {
  factory _$CvExperienceCopyWith(_CvExperience value, $Res Function(_CvExperience) _then) = __$CvExperienceCopyWithImpl;
@override @useResult
$Res call({
 String years, String role, String company, String line
});




}
/// @nodoc
class __$CvExperienceCopyWithImpl<$Res>
    implements _$CvExperienceCopyWith<$Res> {
  __$CvExperienceCopyWithImpl(this._self, this._then);

  final _CvExperience _self;
  final $Res Function(_CvExperience) _then;

/// Create a copy of CvExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? years = null,Object? role = null,Object? company = null,Object? line = null,}) {
  return _then(_CvExperience(
years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CvFile {

 String get id; String get name;/// "PDF" or "DOC", shown on the file thumbnail.
 String get ext; DateTime get addedAt; int get pages;/// What the reader found in the file. The lists below are the preview shown on screen.
 int get skillsCount; int get rolesCount; int get certsCount; int get usedIn;/// Whether the AI reads this file when it drafts mail or scores a posting.
/// Unchecking keeps the file without deleting it.
 bool get inContext; bool get isPrimary; List<String> get skills; List<CvExperience> get experience;
/// Create a copy of CvFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CvFileCopyWith<CvFile> get copyWith => _$CvFileCopyWithImpl<CvFile>(this as CvFile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CvFile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.skillsCount, skillsCount) || other.skillsCount == skillsCount)&&(identical(other.rolesCount, rolesCount) || other.rolesCount == rolesCount)&&(identical(other.certsCount, certsCount) || other.certsCount == certsCount)&&(identical(other.usedIn, usedIn) || other.usedIn == usedIn)&&(identical(other.inContext, inContext) || other.inContext == inContext)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.experience, experience));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,ext,addedAt,pages,skillsCount,rolesCount,certsCount,usedIn,inContext,isPrimary,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(experience));

@override
String toString() {
  return 'CvFile(id: $id, name: $name, ext: $ext, addedAt: $addedAt, pages: $pages, skillsCount: $skillsCount, rolesCount: $rolesCount, certsCount: $certsCount, usedIn: $usedIn, inContext: $inContext, isPrimary: $isPrimary, skills: $skills, experience: $experience)';
}


}

/// @nodoc
abstract mixin class $CvFileCopyWith<$Res>  {
  factory $CvFileCopyWith(CvFile value, $Res Function(CvFile) _then) = _$CvFileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String ext, DateTime addedAt, int pages, int skillsCount, int rolesCount, int certsCount, int usedIn, bool inContext, bool isPrimary, List<String> skills, List<CvExperience> experience
});




}
/// @nodoc
class _$CvFileCopyWithImpl<$Res>
    implements $CvFileCopyWith<$Res> {
  _$CvFileCopyWithImpl(this._self, this._then);

  final CvFile _self;
  final $Res Function(CvFile) _then;

/// Create a copy of CvFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ext = null,Object? addedAt = null,Object? pages = null,Object? skillsCount = null,Object? rolesCount = null,Object? certsCount = null,Object? usedIn = null,Object? inContext = null,Object? isPrimary = null,Object? skills = null,Object? experience = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,skillsCount: null == skillsCount ? _self.skillsCount : skillsCount // ignore: cast_nullable_to_non_nullable
as int,rolesCount: null == rolesCount ? _self.rolesCount : rolesCount // ignore: cast_nullable_to_non_nullable
as int,certsCount: null == certsCount ? _self.certsCount : certsCount // ignore: cast_nullable_to_non_nullable
as int,usedIn: null == usedIn ? _self.usedIn : usedIn // ignore: cast_nullable_to_non_nullable
as int,inContext: null == inContext ? _self.inContext : inContext // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as List<CvExperience>,
  ));
}

}


/// Adds pattern-matching-related methods to [CvFile].
extension CvFilePatterns on CvFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CvFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CvFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CvFile value)  $default,){
final _that = this;
switch (_that) {
case _CvFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CvFile value)?  $default,){
final _that = this;
switch (_that) {
case _CvFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String ext,  DateTime addedAt,  int pages,  int skillsCount,  int rolesCount,  int certsCount,  int usedIn,  bool inContext,  bool isPrimary,  List<String> skills,  List<CvExperience> experience)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CvFile() when $default != null:
return $default(_that.id,_that.name,_that.ext,_that.addedAt,_that.pages,_that.skillsCount,_that.rolesCount,_that.certsCount,_that.usedIn,_that.inContext,_that.isPrimary,_that.skills,_that.experience);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String ext,  DateTime addedAt,  int pages,  int skillsCount,  int rolesCount,  int certsCount,  int usedIn,  bool inContext,  bool isPrimary,  List<String> skills,  List<CvExperience> experience)  $default,) {final _that = this;
switch (_that) {
case _CvFile():
return $default(_that.id,_that.name,_that.ext,_that.addedAt,_that.pages,_that.skillsCount,_that.rolesCount,_that.certsCount,_that.usedIn,_that.inContext,_that.isPrimary,_that.skills,_that.experience);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String ext,  DateTime addedAt,  int pages,  int skillsCount,  int rolesCount,  int certsCount,  int usedIn,  bool inContext,  bool isPrimary,  List<String> skills,  List<CvExperience> experience)?  $default,) {final _that = this;
switch (_that) {
case _CvFile() when $default != null:
return $default(_that.id,_that.name,_that.ext,_that.addedAt,_that.pages,_that.skillsCount,_that.rolesCount,_that.certsCount,_that.usedIn,_that.inContext,_that.isPrimary,_that.skills,_that.experience);case _:
  return null;

}
}

}

/// @nodoc


class _CvFile extends CvFile {
  const _CvFile({required this.id, required this.name, required this.ext, required this.addedAt, required this.pages, required this.skillsCount, required this.rolesCount, required this.certsCount, required this.usedIn, required this.inContext, this.isPrimary = false, final  List<String> skills = const <String>[], final  List<CvExperience> experience = const <CvExperience>[]}): _skills = skills,_experience = experience,super._();
  

@override final  String id;
@override final  String name;
/// "PDF" or "DOC", shown on the file thumbnail.
@override final  String ext;
@override final  DateTime addedAt;
@override final  int pages;
/// What the reader found in the file. The lists below are the preview shown on screen.
@override final  int skillsCount;
@override final  int rolesCount;
@override final  int certsCount;
@override final  int usedIn;
/// Whether the AI reads this file when it drafts mail or scores a posting.
/// Unchecking keeps the file without deleting it.
@override final  bool inContext;
@override@JsonKey() final  bool isPrimary;
 final  List<String> _skills;
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<CvExperience> _experience;
@override@JsonKey() List<CvExperience> get experience {
  if (_experience is EqualUnmodifiableListView) return _experience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_experience);
}


/// Create a copy of CvFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CvFileCopyWith<_CvFile> get copyWith => __$CvFileCopyWithImpl<_CvFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CvFile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.skillsCount, skillsCount) || other.skillsCount == skillsCount)&&(identical(other.rolesCount, rolesCount) || other.rolesCount == rolesCount)&&(identical(other.certsCount, certsCount) || other.certsCount == certsCount)&&(identical(other.usedIn, usedIn) || other.usedIn == usedIn)&&(identical(other.inContext, inContext) || other.inContext == inContext)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._experience, _experience));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,ext,addedAt,pages,skillsCount,rolesCount,certsCount,usedIn,inContext,isPrimary,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_experience));

@override
String toString() {
  return 'CvFile(id: $id, name: $name, ext: $ext, addedAt: $addedAt, pages: $pages, skillsCount: $skillsCount, rolesCount: $rolesCount, certsCount: $certsCount, usedIn: $usedIn, inContext: $inContext, isPrimary: $isPrimary, skills: $skills, experience: $experience)';
}


}

/// @nodoc
abstract mixin class _$CvFileCopyWith<$Res> implements $CvFileCopyWith<$Res> {
  factory _$CvFileCopyWith(_CvFile value, $Res Function(_CvFile) _then) = __$CvFileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String ext, DateTime addedAt, int pages, int skillsCount, int rolesCount, int certsCount, int usedIn, bool inContext, bool isPrimary, List<String> skills, List<CvExperience> experience
});




}
/// @nodoc
class __$CvFileCopyWithImpl<$Res>
    implements _$CvFileCopyWith<$Res> {
  __$CvFileCopyWithImpl(this._self, this._then);

  final _CvFile _self;
  final $Res Function(_CvFile) _then;

/// Create a copy of CvFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ext = null,Object? addedAt = null,Object? pages = null,Object? skillsCount = null,Object? rolesCount = null,Object? certsCount = null,Object? usedIn = null,Object? inContext = null,Object? isPrimary = null,Object? skills = null,Object? experience = null,}) {
  return _then(_CvFile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,skillsCount: null == skillsCount ? _self.skillsCount : skillsCount // ignore: cast_nullable_to_non_nullable
as int,rolesCount: null == rolesCount ? _self.rolesCount : rolesCount // ignore: cast_nullable_to_non_nullable
as int,certsCount: null == certsCount ? _self.certsCount : certsCount // ignore: cast_nullable_to_non_nullable
as int,usedIn: null == usedIn ? _self.usedIn : usedIn // ignore: cast_nullable_to_non_nullable
as int,inContext: null == inContext ? _self.inContext : inContext // ignore: cast_nullable_to_non_nullable
as bool,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,experience: null == experience ? _self._experience : experience // ignore: cast_nullable_to_non_nullable
as List<CvExperience>,
  ));
}


}

// dart format on
