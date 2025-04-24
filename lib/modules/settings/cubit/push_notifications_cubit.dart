import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'push_notifications_state.dart';

class PushNotificationsCubit extends Cubit<PushNotificationsState> {
  final SharedPreferences _prefs;
  static const String _allowNotificationsKey = 'allow_notifications';
  static const String _likesNotificationsKey = 'likes_notifications';
  static const String _commentsNotificationsKey = 'comments_notifications';
  static const String _followersNotificationsKey = 'followers_notifications';
  static const String _mentionsNotificationsKey = 'mentions_notifications';
  static const String _directMessagesNotificationsKey =
      'direct_messages_notifications';

  PushNotificationsCubit(this._prefs) : super(const PushNotificationsState()) {
    _loadSettings();
  }

  void _loadSettings() {
    emit(PushNotificationsState(
      allowNotifications: _prefs.getBool(_allowNotificationsKey) ?? false,
      likesNotifications: _prefs.getBool(_likesNotificationsKey) ?? false,
      commentsNotifications: _prefs.getBool(_commentsNotificationsKey) ?? false,
      followersNotifications:
          _prefs.getBool(_followersNotificationsKey) ?? false,
      mentionsNotifications: _prefs.getBool(_mentionsNotificationsKey) ?? false,
      directMessagesNotifications:
          _prefs.getBool(_directMessagesNotificationsKey) ?? false,
    ));
  }

  Future<void> toggleAllowNotifications(bool value) async {
    await _prefs.setBool(_allowNotificationsKey, value);
    emit(state.copyWith(allowNotifications: value));
  }

  Future<void> toggleLikesNotifications(bool value) async {
    await _prefs.setBool(_likesNotificationsKey, value);
    emit(state.copyWith(likesNotifications: value));
  }

  Future<void> toggleCommentsNotifications(bool value) async {
    await _prefs.setBool(_commentsNotificationsKey, value);
    emit(state.copyWith(commentsNotifications: value));
  }

  Future<void> toggleFollowersNotifications(bool value) async {
    await _prefs.setBool(_followersNotificationsKey, value);
    emit(state.copyWith(followersNotifications: value));
  }

  Future<void> toggleMentionsNotifications(bool value) async {
    await _prefs.setBool(_mentionsNotificationsKey, value);
    emit(state.copyWith(mentionsNotifications: value));
  }

  Future<void> toggleDirectMessagesNotifications(bool value) async {
    await _prefs.setBool(_directMessagesNotificationsKey, value);
    emit(state.copyWith(directMessagesNotifications: value));
  }

  Future<void> saveChanges() async {
    // Additional save logic can be added here if needed
    // For now, all changes are saved immediately when toggles are switched
  }
}
