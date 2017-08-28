function disable-xcode-plugin {
  PLUGIN_PATH=$HOME/Library/Application\ Support/Developer/Shared/Xcode
  mv $PLUGIN_PATH/Plug-ins $PLUGIN_PATH/Plug-ins.tmp
  mkdir -p $PLUGIN_PATH/Plug-ins
  echo "Your Plug-ins directory is now clean (empty)"
}

function enable-xcode-plugin {
  PLUGIN_PATH=$HOME/Library/Application\ Support/Developer/Shared/Xcode
  if ls $PLUGIN_PATH/Plug-ins.tmp; then;
    rmdir $PLUGIN_PATH/Plug-ins
    mv $PLUGIN_PATH/Plug-ins.tmp $PLUGIN_PATH/Plug-ins
    echo "Recovered Plug-ins directory"
  fi
}

