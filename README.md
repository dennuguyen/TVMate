# TV Mate

## System Architecture

- Application which uses mDNS to find devices. The protocol to communicate with the devices is websocket.
- UI contains virtual remote controls which sends hex codes over the websocket. The device interprets the hex codes and fires the corresponding IR signal.

## Future Work

- Increased security to prevent device hacking.
- Increased security to prevent application hacking.