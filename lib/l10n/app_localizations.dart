import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @workspace.
  ///
  /// In en, this message translates to:
  /// **'Workspace'**
  String get workspace;

  /// No description provided for @noAvailableAccount.
  ///
  /// In en, this message translates to:
  /// **'No available Account'**
  String get noAvailableAccount;

  /// No description provided for @addAcountTip.
  ///
  /// In en, this message translates to:
  /// **'Please add account'**
  String get addAcountTip;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get network;

  /// No description provided for @backup_sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get backup_sync;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get add;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addAccount;

  /// No description provided for @alias.
  ///
  /// In en, this message translates to:
  /// **'Alias'**
  String get alias;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @displayAccountDetail.
  ///
  /// In en, this message translates to:
  /// **'Display account information'**
  String get displayAccountDetail;

  /// No description provided for @replaceAccountDetail.
  ///
  /// In en, this message translates to:
  /// **'Replace sensitive information'**
  String get replaceAccountDetail;

  /// No description provided for @builtinEndpoints.
  ///
  /// In en, this message translates to:
  /// **'Builtin endpoints'**
  String get builtinEndpoints;

  /// No description provided for @bulitinEndpointsDecription.
  ///
  /// In en, this message translates to:
  /// **'Enable builtin endpoints'**
  String get bulitinEndpointsDecription;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @backupDescription.
  ///
  /// In en, this message translates to:
  /// **'Back up data through WebDAV'**
  String get backupDescription;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @restoreDescription.
  ///
  /// In en, this message translates to:
  /// **'Recovering data through WebDAV'**
  String get restoreDescription;

  /// No description provided for @legalese.
  ///
  /// In en, this message translates to:
  /// **'Flyoo is an auxiliary control software that benchmarks the AIA internship platform, providing various functions that facilitate users to upgrade their user experience.\n\nDisclaimers\n\nThis software is only for non-commercial purposes such as learning, communication, scientific research, etc. It is strictly prohibited to use this software for commercial purposes. Any commercial activities are unrelated to this software.\n©  2025 Flyoo, all rights reserved.'**
  String get legalese;

  /// No description provided for @emptyAlias.
  ///
  /// In en, this message translates to:
  /// **'Alias can\'t be empty'**
  String get emptyAlias;

  /// No description provided for @emptyUserName.
  ///
  /// In en, this message translates to:
  /// **'Username can\'t be empty'**
  String get emptyUserName;

  /// No description provided for @emptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get emptyPassword;

  /// No description provided for @notRegularPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Not a regular phone number'**
  String get notRegularPhoneNumber;

  /// No description provided for @clockIn.
  ///
  /// In en, this message translates to:
  /// **'Clock In'**
  String get clockIn;

  /// No description provided for @clockOut.
  ///
  /// In en, this message translates to:
  /// **'Clock out'**
  String get clockOut;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @accountDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get accountDeleteConfirm;

  /// No description provided for @contentOrPrompt.
  ///
  /// In en, this message translates to:
  /// **'Content / Prompt'**
  String get contentOrPrompt;

  /// No description provided for @generateContent.
  ///
  /// In en, this message translates to:
  /// **'Generate Content'**
  String get generateContent;

  /// No description provided for @saveAsDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as Draft'**
  String get saveAsDraft;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @dailyLog.
  ///
  /// In en, this message translates to:
  /// **'Daily Log'**
  String get dailyLog;

  /// No description provided for @weeklyLog.
  ///
  /// In en, this message translates to:
  /// **'Weekly Log'**
  String get weeklyLog;

  /// No description provided for @monthlyLog.
  ///
  /// In en, this message translates to:
  /// **'Monthly Log'**
  String get monthlyLog;

  /// No description provided for @visibilityLow.
  ///
  /// In en, this message translates to:
  /// **'Visible to Teachers Only'**
  String get visibilityLow;

  /// No description provided for @visibilityMiddle.
  ///
  /// In en, this message translates to:
  /// **'Visible to Teachers and Students Only'**
  String get visibilityMiddle;

  /// No description provided for @visibilityHigh.
  ///
  /// In en, this message translates to:
  /// **'Visible to Everyone'**
  String get visibilityHigh;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @accountDetail.
  ///
  /// In en, this message translates to:
  /// **'Account detail'**
  String get accountDetail;

  /// No description provided for @clockInAndClockOut.
  ///
  /// In en, this message translates to:
  /// **'Clock in & clock out'**
  String get clockInAndClockOut;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @joinGroup.
  ///
  /// In en, this message translates to:
  /// **'Join in chat'**
  String get joinGroup;

  /// No description provided for @locate.
  ///
  /// In en, this message translates to:
  /// **'Locate'**
  String get locate;

  /// No description provided for @editLog.
  ///
  /// In en, this message translates to:
  /// **'Write log'**
  String get editLog;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
