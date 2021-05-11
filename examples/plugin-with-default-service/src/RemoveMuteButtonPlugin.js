import React from "react";
import { FlexPlugin } from "flex-plugin";

const PLUGIN_NAME = "RemoveMuteButton";

export default class RemoveMuteButtonPlugin extends FlexPlugin {
  constructor() {
    super(PLUGIN_NAME);
  }

  init(flex) {
    flex.MainHeader.Content.remove("mute");
  }
}
