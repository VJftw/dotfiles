BLE_SH_PATH="$HOME/.ble.sh/out/ble.sh"

if [ ! -f "$BLE_SH_PATH" ]; then
  return
fi

source "$BLE_SH_PATH"
