# Memories

<img src="assets/logo/logo.png" alt="Logo" width="300">

This app is a small configurable quiz game written in flutter. It allows to build your own game by just adding your questions and providing images or texts that will be given to the user upon successful completion.

The game runs completely online and no data is shared with anyone.

The game was build with the intention of sharing memories in photos by asking questions.

## Prerequisites

Have flutter installed.

## Usage

1. Create a copy of `assets/questions.sample.json` into `assets/questions.json`. The structure of the file is as follows:

```json
    {
        "level": 1,
        "question": "When did something happen on x day of y year?",
        "correctAnswer": "nothing"
    },
    {
        "level": 2,
        "question": "How was something on other place?",
        "correctAnswer": "good",
        "gift": {
            "name": "You won a gift!",
            "conditions": "Only applies on x days."
        }
    },
```

If gift is provided no image will be looked up. Otherwise a folder with the number of the label containing images shall be placed in `assets/images_resized`. There is a python script in `tools` to resize the images. Having too large images will slow down the loading on old devices.

1. Configure the folders of the images you have added in the `pubspec.yaml`.
1. Build the app `flutter build apk --release`.
1. Copy the created bundle to the device, for example using adb `adb -s <your_device> install build\app\outputs\flutter-apk\app-release.apk`.

## Project status

This app was developed as a one time project, no active development is intended, it can be used as it is. Bugs may be reported, no new features are expected in the short term.

## Example

<img src="docs/screenshots/example.gif" alt="screenshot" width="500">
