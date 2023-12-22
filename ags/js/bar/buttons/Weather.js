import Widget from "resource:///com/github/Aylur/ags/widget.js";
import WeatherService from "../../services/weather.js";
import PanelButton from "../PanelButton.js";
import HoverRevealer from "../../misc/HoverRevealer.js";
// import PopupWindow from "../../misc/PopupWindow.js";
import * as Utils from "resource:///com/github/Aylur/ags/utils.js";

const WeatherRevealer = () =>
  PanelButton({
    class_name: "weather",
    content: Widget.Box({
      children: [
        Widget.Box().hook(WeatherService, (box) => {
          box.children = [
            HoverRevealer({
              indicator: Widget.Label({
                binds: [["label", WeatherService, "city"]],
              }),
              child: Widget.Label({
                binds: [
                  [
                    "label",
                    WeatherService,
                    "weather_data",
                    (data) => data.current_condition[0].FeelsLikeC + "°C",
                  ],
                ],
              }),
            }),
          ];
        }),
      ],
    }),
  });

export default WeatherRevealer;
