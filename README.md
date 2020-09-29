## AudioToggle

This is a copy of https://github.com/alongubkin/audiotoggle with some additions to toggle Speaker/Receiver modes on ios

### Supported Platforms

- Android
- iOS

### Usage

To set the current audio mode, use the `setAudioMode` method:

    AudioToggle.setAudioMode(AudioToggle.SPEAKER);
    // or
    AudioToggle.setAudioMode(AudioToggle.EARPIECE);

Android has the following additional options:

    AudioToggle.setAudioMode(AudioToggle.NORMAL);
    // and
    AudioToggle.setAudioMode(AudioToggle.RINGTONE);
