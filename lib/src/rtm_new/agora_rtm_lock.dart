import 'package:agora_rtc_engine/src/binding_forward_export.dart';

/// @nodoc
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RtmLock {
  /// @nodoc
  RtmLock({required this.encryptionMode, this.encrytionKey});

  /// @nodoc
  @JsonKey(name: 'encrytionMode')
  final RtmEncryptionMode? encryptionMode;

  /// @nodoc
  @JsonKey(name: 'encrytionKey')
  final String? encrytionKey;
}

class RtmLockResult {}
