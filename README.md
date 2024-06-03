# TV Mate

## System Architecture

- Application which uses mDNS to find devices. The protocol to communicate with the devices is websocket.
- UI contains virtual remote controls which sends hex codes over the websocket. The device interprets the hex codes and fires the corresponding IR signal.

## Design Patterns

- Views do not contain any business logic and data models at all.
- All business logic and data models are put into a controller class in files suffixed with `_model.dart`.
    - This class will always extend `ChangeNotifier` so any view that needs access to the class will use `Provider` or `Consumer`.
- The only exception to the above is when business logic does not need to be shared outside of a view, so the view class extends `StatefulWidget` instead.

## Future Work

- Increased security to prevent device hacking.
- Increased security to prevent application hacking.