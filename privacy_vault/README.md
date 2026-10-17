# Privacy Vault

A Flutter app for organizing purchase receipts, viewing warranty details, and
keeping a manual record of services that have your personal data.

## Run the app

From this directory, fetch dependencies and launch the app on a connected
device or emulator:

```sh
flutter pub get
flutter run
```

To launch in a browser, use `flutter run -d chrome`.

## Receipts

The receipt list and entry form are standalone assignment screens with sample
data. The entry form validates the product, store, purchase date, and price.
Page navigation, databases, and APIs are intentionally not included in this
assignment stage.

## Assignment deliverables

- `Privacy_Vault_Screen_Plan.docx` contains the five-screen plan and the
  `ReceiptRecord` main entity.
- The app's screens are implemented in `lib/`, with image assets in
  `assets/images/`.
- `test/widget_test.dart` checks the five screens and receipt form validation.
