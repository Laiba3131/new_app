import 'package:equatable/equatable.dart';

class PushNotificationsState extends Equatable {
  final bool allowNotifications;
  final bool likesNotifications;
  final bool commentsNotifications;
  final bool followersNotifications;
  final bool mentionsNotifications;
  final bool directMessagesNotifications;

  const PushNotificationsState({
    this.allowNotifications = false,
    this.likesNotifications = false,
    this.commentsNotifications = false,
    this.followersNotifications = false,
    this.mentionsNotifications = false,
    this.directMessagesNotifications = false,
  });

  PushNotificationsState copyWith({
    bool? allowNotifications,
    bool? likesNotifications,
    bool? commentsNotifications,
    bool? followersNotifications,
    bool? mentionsNotifications,
    bool? directMessagesNotifications,
  }) {
    return PushNotificationsState(
      allowNotifications: allowNotifications ?? this.allowNotifications,
      likesNotifications: likesNotifications ?? this.likesNotifications,
      commentsNotifications:
          commentsNotifications ?? this.commentsNotifications,
      followersNotifications:
          followersNotifications ?? this.followersNotifications,
      mentionsNotifications:
          mentionsNotifications ?? this.mentionsNotifications,
      directMessagesNotifications:
          directMessagesNotifications ?? this.directMessagesNotifications,
    );
  }

  @override
  List<Object?> get props => [
        allowNotifications,
        likesNotifications,
        commentsNotifications,
        followersNotifications,
        mentionsNotifications,
        directMessagesNotifications,
      ];
}
