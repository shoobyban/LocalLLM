# LocalLLM

A Swift application for running local Large Language Models on Apple devices. This app leverages the Spezi framework to provide on-device AI capabilities without requiring internet connectivity.

## Prerequisites

- Xcode 15.0 or later
- iOS 17.0+ / macOS 14.0+
- Swift 5.9 or later
- An Apple Developer account

## Installation

1. Clone the repository:
```bash
git clone https://github.com/shoobyban/LocalLLM.git
cd LocalLLM
```

2. Open the project in Xcode:
```bash
open LocalLLM.xcodeproj
```

3. Install dependencies (if using Swift Package Manager):
```bash
swift package resolve
```

## Compilation

1. Select the appropriate target device/simulator in Xcode.
2. Ensure your Apple Developer account is set up in Xcode preferences.
3. Build the project by pressing `Cmd+B` or by selecting `Product > Build` from the menu.
4. To run the app, press `Cmd+R` or select `Product > Run` from the menu.

## Switching Apple Developer Team Accounts

### In Xcode:

1. Open the project in Xcode.
2. Select the project file in the Project Navigator (the blue project icon).
3. Select the "LocalLLM" target in the Targets list.
4. Go to the "Signing & Capabilities" tab.
5. Click on "Team" dropdown and select your desired team.
6. If your desired team isn't listed:
   - Click "Add Account..." to sign in with a different Apple ID
   - Enter your Apple ID credentials
   - Select the newly added account from the Team dropdown

### Via Command Line:

You can also update the development team using the `update_development_team.sh` script:

```bash
./scripts/update_development_team.sh "Your Team ID"
```

To find your Team ID:
1. Log in to [Apple Developer Portal](https://developer.apple.com/account)
2. Go to "Membership" section
3. Your Team ID is listed alongside your team name

## App Distribution

### For TestFlight:

1. Ensure you've switched to the correct team.
2. Update the bundle identifier if needed.
3. Increment the build number.
4. Archive the app: `Product > Archive`.
5. In the Organizer window, select your archive and click "Distribute App".
6. Follow the prompts to upload to App Store Connect.

### For App Store:

1. Complete the TestFlight distribution steps.
2. Log in to App Store Connect.
3. Set up your app's metadata, screenshots, and pricing.
4. Submit for review.

## Notes

- Switching teams may require updating the app's bundle identifier to match your team's naming conventions.
- Model downloads may require a significant amount of storage space. Ensure your device has sufficient storage.
- Some features may require specific entitlements that need to be configured after switching teams.
