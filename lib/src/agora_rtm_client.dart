// ignore_for_file: constant_identifier_names

import 'package:agora_rtc_engine/src/binding_forward_export.dart';
import 'package:agora_rtc_engine/src/rtm_new/agora_rtm_lock.dart';
import 'package:agora_rtc_engine/src/rtm_new/agora_rtm_storage.dart';
import 'package:agora_rtc_engine/src/rtm_new/agora_rtm_login.dart';

part 'agora_rtm_client.g.dart';

@JsonEnum(alwaysCreate: true)
enum RtmAreaCode {
  /// @nodoc
  @JsonValue(0x00000001)
  RtmAreaCodeCN,

  /// @nodoc
  @JsonValue(0x00000002)
  RtmAreaCodeNA,

  /// @nodoc
  @JsonValue(0x00000004)
  RtmAreaCodeEU,

  /// @nodoc
  @JsonValue(0x00000008)
  RtmAreaCodeAS,

  /// @nodoc
  @JsonValue(0x00000010)
  RtmAreaCodeJP,

  /// @nodoc
  @JsonValue(0x00000020)
  RtmAreaCodeIN,

  /// @nodoc
  @JsonValue(0xFFFFFFFF)
  RtmAreaCodeGLOB,
}

@JsonEnum(alwaysCreate: true)
enum RtmProxyType {
  /// @nodoc
  @JsonValue(0)
  RtmProxyTypeNone,

  /// @nodoc
  @JsonValue(1)
  RtmProxyTypeHttp,
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ProxyConfig {
  const ProxyConfig(
      {this.proxyType,
      required this.server,
      this.port,
      this.accout,
      this.password});

  @JsonKey(name: 'proxyType')
  final RtmProxyType? proxyType;

  @JsonKey(name: 'server')
  final String? server;

  @JsonKey(name: 'port')
  final int? port;

  @JsonKey(name: 'accout')
  final String? accout;

  @JsonKey(name: 'password')
  final String? password;
}

@JsonEnum(alwaysCreate: true)
enum RtmEncryptionMode {
  @JsonValue(0)
  RtmEncryptionModeNone,

  @JsonValue(1)
  RtmEncryptionMode128GCM,

  @JsonValue(2)
  RtmEncryptionMode256GCM,
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtmEncryptionConfig {
  /// @nodoc
  RtmEncryptionConfig({required this.encryptionMode, this.encrytionKey});

  /// @nodoc
  @JsonKey(name: 'encrytionMode')
  final RtmEncryptionMode? encryptionMode;

  /// @nodoc
  @JsonKey(name: 'encrytionKey')
  final String? encrytionKey;
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtmConfig {
  /// @nodoc
  const RtmConfig(
      {required this.appId,
      required this.userId,
      this.eventHandler,
      this.areaCode,
      this.presenceTimeout,
      this.useStringUserId,
      this.logConfig,
      this.proxyConfig,
      this.encryptionConfig});

  /// @nodoc
  @JsonKey(name: 'appId')
  final String? appId;

  /// @nodoc
  @JsonKey(name: 'userId')
  final String? userId;

  /// @nodoc
  @JsonKey(name: 'areaCode')
  final RtmAreaCode? areaCode;

  /// @nodoc
  @JsonKey(name: 'preseceTimeout')
  final int? presenceTimeout;

  /// @nodoc
  @JsonKey(name: 'useStringUserId')
  final bool? useStringUserId;

  /// @nodoc
  @JsonKey(name: 'eventHandler')
  final RtmEventHandler? eventHandler;

  /// @nodoc
  @JsonKey(name: 'logConfig')
  final LogConfig? logConfig;

  /// @nodoc
  @JsonKey(name: 'proxConfig')
  final ProxyConfig? proxyConfig;

  /// @nodoc
  @JsonKey(name: 'encryptionProxy')
  final EncryptionConfig? encryptionConfig;

  /// @nodoc
  factory RtmConfig.fromJson(Map<String, dynamic> json) =>
      _$RtmConfigFromJson(json);

  /// @nodoc
  Map<String, dynamic> toJson() => _$RtmConfigToJson(this);
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class TopicInfo {
  /// @nodoc
  const TopicInfo(
      {this.topic,
      this.numOfPublisher,
      this.publisherUserIds,
      this.publisherMetas});

  /// @nodoc
  @JsonKey(name: 'topic')
  final String? topic;

  /// @nodoc
  @JsonKey(name: 'numOfPublisher')
  final int? numOfPublisher;

  /// @nodoc
  @JsonKey(name: 'publisherUserIds')
  final List<String>? publisherUserIds;

  /// @nodoc
  @JsonKey(name: 'publisherMetas')
  final List<String>? publisherMetas;

  /// @nodoc
  factory TopicInfo.fromJson(Map<String, dynamic> json) =>
      _$TopicInfoFromJson(json);

  /// @nodoc
  Map<String, dynamic> toJson() => _$TopicInfoToJson(this);
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum RtmErrorCode {
  /// @nodoc
  @JsonValue(10001)
  rtmErrTopicAlreadyJoined,

  /// @nodoc
  @JsonValue(10002)
  rtmErrExceedJoinTopicLimitation,

  /// @nodoc
  @JsonValue(10003)
  rtmErrInvalidTopicName,

  /// @nodoc
  @JsonValue(10004)
  rtmErrPublishTopicMessageFailed,

  /// @nodoc
  @JsonValue(10005)
  rtmErrExceedSubscribeTopicLimitation,

  /// @nodoc
  @JsonValue(10006)
  rtmErrExceedUserLimitation,

  /// @nodoc
  @JsonValue(10007)
  rtmErrExceedChannelLimitation,

  /// @nodoc
  @JsonValue(10008)
  rtmErrAlreadyJoinChannel,

  /// @nodoc
  @JsonValue(10009)
  rtmErrNotJoinChannel,
}

/// @nodoc
extension RtmErrorCodeExt on RtmErrorCode {
  /// @nodoc
  static RtmErrorCode fromValue(int value) {
    return $enumDecode(_$RtmErrorCodeEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$RtmErrorCodeEnumMap[this]!;
  }
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum RtmConnectionState {
  /// @nodoc
  @JsonValue(1)
  rtmConnectionStateDisconnected,

  /// @nodoc
  @JsonValue(2)
  rtmConnectionStateConnecting,

  /// @nodoc
  @JsonValue(3)
  rtmConnectionStateConnected,

  /// @nodoc
  @JsonValue(4)
  rtmConnectionStateReconnecting,

  /// @nodoc
  @JsonValue(5)
  rtmConnectionStateFailed,
}

/// @nodoc
extension RtmConnectionStateExt on RtmConnectionState {
  /// @nodoc
  static RtmConnectionState fromValue(int value) {
    return $enumDecode(_$RtmConnectionStateEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$RtmConnectionStateEnumMap[this]!;
  }
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum RtmConnectionChangeReason {
  /// @nodoc
  @JsonValue(0)
  rtmConnectionChangedConnecting,

  /// @nodoc
  @JsonValue(1)
  rtmConnectionChangedJoinSuccess,

  /// @nodoc
  @JsonValue(2)
  rtmConnectionChangedInterrupted,

  /// @nodoc
  @JsonValue(3)
  rtmConnectionChangedBannedByServer,

  /// @nodoc
  @JsonValue(4)
  rtmConnectionChangedJoinFailed,

  /// @nodoc
  @JsonValue(5)
  rtmConnectionChangedLeaveChannel,

  /// @nodoc
  @JsonValue(6)
  rtmConnectionChangedInvalidAppId,

  /// @nodoc
  @JsonValue(7)
  rtmConnectionChangedInvalidChannelName,

  /// @nodoc
  @JsonValue(8)
  rtmConnectionChangedInvalidToken,

  /// @nodoc
  @JsonValue(9)
  rtmConnectionChangedTokenExpired,

  /// @nodoc
  @JsonValue(10)
  rtmConnectionChangedRejectedByServer,

  /// @nodoc
  @JsonValue(11)
  rtmConnectionChangedSettingProxyServer,

  /// @nodoc
  @JsonValue(12)
  rtmConnectionChangedRenewToken,

  /// @nodoc
  @JsonValue(13)
  rtmConnectionChangedClientIpAddressChanged,

  /// @nodoc
  @JsonValue(14)
  rtmConnectionChangedKeepAliveTimeout,

  /// @nodoc
  @JsonValue(15)
  rtmConnectionChangedRejoinSuccess,

  /// @nodoc
  @JsonValue(16)
  rtmConnectionChangedLost,

  /// @nodoc
  @JsonValue(17)
  rtmConnectionChangedEchoTest,

  /// @nodoc
  @JsonValue(18)
  rtmConnectionChangedClientIpAddressChangedByUser,

  /// @nodoc
  @JsonValue(19)
  rtmConnectionChangedSameUidLogin,

  /// @nodoc
  @JsonValue(20)
  rtmConnectionChangedTooManyBroadcasters,
}

/// @nodoc
extension RtmConnectionChangeReasonExt on RtmConnectionChangeReason {
  /// @nodoc
  static RtmConnectionChangeReason fromValue(int value) {
    return $enumDecode(_$RtmConnectionChangeReasonEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$RtmConnectionChangeReasonEnumMap[this]!;
  }
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum RtmChannelType {
  /// @nodoc
  @JsonValue(0)
  rtmChannelTypeMessage,

  /// @nodoc
  @JsonValue(1)
  rtmChannelTypeStream,
}

/// @nodoc
extension RtmChannelTypeExt on RtmChannelType {
  /// @nodoc
  static RtmChannelType fromValue(int value) {
    return $enumDecode(_$RtmChannelTypeEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$RtmChannelTypeEnumMap[this]!;
  }
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum RtmPresenceType {
  /// @nodoc
  @JsonValue(0)
  rtmPresenceTypeRemoteJoinChannel,

  /// @nodoc
  @JsonValue(1)
  rtmPresenceTypeRemoteLeaveChannel,

  /// @nodoc
  @JsonValue(2)
  rtmPresenceTypeRemoteConnectionTimeout,

  /// @nodoc
  @JsonValue(3)
  rtmPresenceTypeRemoteJoinTopic,

  /// @nodoc
  @JsonValue(4)
  rtmPresenceTypeRemoteLeaveTopic,

  /// @nodoc
  @JsonValue(5)
  rtmPresenceTypeSelfJoinChannel,
}

/// @nodoc
extension RtmPresenceTypeExt on RtmPresenceType {
  /// @nodoc
  static RtmPresenceType fromValue(int value) {
    return $enumDecode(_$RtmPresenceTypeEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$RtmPresenceTypeEnumMap[this]!;
  }
}

/// @nodoc
@JsonEnum(alwaysCreate: true)
enum StreamChannelErrorCode {
  /// @nodoc
  @JsonValue(0)
  streamChannelErrorOk,

  /// @nodoc
  @JsonValue(1)
  streamChannelErrorExceedLimitation,

  /// @nodoc
  @JsonValue(2)
  streamChannelErrorUserNotExist,
}

/// @nodoc
extension StreamChannelErrorCodeExt on StreamChannelErrorCode {
  /// @nodoc
  static StreamChannelErrorCode fromValue(int value) {
    return $enumDecode(_$StreamChannelErrorCodeEnumMap, value);
  }

  /// @nodoc
  int value() {
    return _$StreamChannelErrorCodeEnumMap[this]!;
  }
}

/// @nodoc
class RtmEventHandler {
  /// @nodoc
  const RtmEventHandler({
    this.onMessageEvent,
    this.onPresenceEvent,
    this.onJoinResult,
    this.onLeaveResult,
    this.onJoinTopicResult,
    this.onLeaveTopicResult,
    this.onTopicSubscribed,
    this.onTopicUnsubscribed,
    this.onConnectionStateChange,
  });

  /// @nodoc
  final void Function(MessageEvent event)? onMessageEvent;

  /// @nodoc
  final void Function(PresenceEvent event)? onPresenceEvent;

  /// @nodoc
  final void Function(
          String channelName, String userId, StreamChannelErrorCode errorCode)?
      onJoinResult;

  /// @nodoc
  final void Function(
          String channelName, String userId, StreamChannelErrorCode errorCode)?
      onLeaveResult;

  /// @nodoc
  final void Function(String channelName, String userId, String topic,
      String meta, StreamChannelErrorCode errorCode)? onJoinTopicResult;

  /// @nodoc
  final void Function(String channelName, String userId, String topic,
      String meta, StreamChannelErrorCode errorCode)? onLeaveTopicResult;

  /// @nodoc
  final void Function(
      String channelName,
      String userId,
      String topic,
      UserList succeedUsers,
      UserList failedUsers,
      StreamChannelErrorCode errorCode)? onTopicSubscribed;

  /// @nodoc
  final void Function(
      String channelName,
      String userId,
      String topic,
      UserList succeedUsers,
      UserList failedUsers,
      StreamChannelErrorCode errorCode)? onTopicUnsubscribed;

  /// @nodoc
  final void Function(String channelName, RtmConnectionState state,
      RtmConnectionChangeReason reason)? onConnectionStateChange;
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MessageEvent {
  /// @nodoc
  const MessageEvent(
      {this.channelType,
      this.channelName,
      this.channelTopic,
      this.message,
      this.messageLength,
      this.publisher});

  /// @nodoc
  @JsonKey(name: 'channelType')
  final RtmChannelType? channelType;

  /// @nodoc
  @JsonKey(name: 'channelName')
  final String? channelName;

  /// @nodoc
  @JsonKey(name: 'channelTopic')
  final String? channelTopic;

  /// @nodoc
  @JsonKey(name: 'message', ignore: true)
  final Uint8List? message;

  /// @nodoc
  @JsonKey(name: 'messageLength')
  final int? messageLength;

  /// @nodoc
  @JsonKey(name: 'publisher')
  final String? publisher;

  /// @nodoc
  factory MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageEventFromJson(json);

  /// @nodoc
  Map<String, dynamic> toJson() => _$MessageEventToJson(this);
}

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PresenceEvent {
  /// @nodoc
  const PresenceEvent(
      {this.channelType,
      this.type,
      this.channelName,
      this.topicInfos,
      this.topicInfoNumber,
      this.userId});

  /// @nodoc
  @JsonKey(name: 'channelType')
  final RtmChannelType? channelType;

  /// @nodoc
  @JsonKey(name: 'type')
  final RtmPresenceType? type;

  /// @nodoc
  @JsonKey(name: 'channelName')
  final String? channelName;

  /// @nodoc
  @JsonKey(name: 'topicInfos')
  final List<TopicInfo>? topicInfos;

  /// @nodoc
  @JsonKey(name: 'topicInfoNumber')
  final int? topicInfoNumber;

  /// @nodoc
  @JsonKey(name: 'userId')
  final String? userId;

  /// @nodoc
  factory PresenceEvent.fromJson(Map<String, dynamic> json) =>
      _$PresenceEventFromJson(json);

  /// @nodoc
  Map<String, dynamic> toJson() => _$PresenceEventToJson(this);
}

/// @nodoc
enum RtmSubscribeChannelFeature {
  /// @nodoc
  @JsonValue(0)
  rtmSubscribeChannelFeatureNone,

  /// @nodoc
  @JsonValue(1)
  rtmSubscribeChannelFeaturePresence,

  /// @nodoc
  @JsonValue(1 << 1)
  rtmSubscribeChannelFeatureMetadata,

  /// @nodoc
  @JsonValue(1 << 2)
  rtmSubscribeChannelFeatureMessage,

  /// @nodoc
  @JsonValue(1 << 3)
  rtmSubscribeChannelFeatureLock,
}

/// @nodoc
class SubscribeOptions {
  /// @nodoc
  SubscribeOptions({required this.features});

  /// @nodoc
  @JsonKey(name: 'channelName')
  final RtmSubscribeChannelFeature features;
}

/// @nodoc
abstract class RtmClient {
  /// @nodoc
  Future<void> initialize(RtmConfig config);

  /// @nodoc
  Future<void> release();

  /// @nodoc
  Future<StreamChannel> createStreamChannel(String channelName);

  /// @nodoc
  Future<RtmLock> getLock();

  /// @nodoc
  Future<RtmStorage> getStorage();

  /// @nodoc
  Future<LoginResult> login(String token);

  /// @nodoc
  Future<void> logout();

  /// @nodoc
  Future<StreamChannel> subscribeChannel(
      String channelName, SubscribeOptions options);

  /// @nodoc
  Future<void> unsubscribeChannel(String channelName, SubscribeOptions options);
}
