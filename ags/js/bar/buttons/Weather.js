import Widget from "resource:///com/github/Aylur/ags/widget.js";
import WeatherService from "../../services/weather.js";
import PanelButton from "../PanelButton.js";
import HoverRevealer from "../../misc/HoverRevealer.js";
import PopupWindow from "../../misc/PopupWindow.js";

/**
 * @param {Object} o
 * @param {import('../../misc/HoverRevealer').HoverRevealProps['direction']=} o.direction
 */

const WeatherBox = () =>
  Widget.Box({
    class_name: "weather-container",
    spacing: 11,
    children: [
      Widget.Label({
        class_name: "weather-icon",
        binds: [["label", WeatherService, "icon"]],
      }),
      Widget.Label({
        class_name: "weather-temp",
        binds: [["label", WeatherService, "temp", (out) => out + "°C"]],
      }),
    ],
    binds: [["tooltip-markup", WeatherService, "description"]],
  });

// TODO: Add a popup window with more info
const WeatherAdditionalInfo = () =>
  Widget.Label({
    class_name: "weather-additional-info",
    binds: [
      [
        "label",
        WeatherService,
        "weather_data",
        (out) => {
          // const { current_condition, nearest_area, request } = out;
          // const { temp_C, FeelsLikeC, weatherDesc } = request[0];
          const { value: city } = out.nearest_area[0].areaName[0];
          // const { query } = request[0];
          return `${city}`;
        },
      ],
    ],
  });

const WeatherRevealer = ({ direction = "left" } = {}) =>
  HoverRevealer({
    class_name: "weather panel-button",
    direction,
    indicator: WeatherBox(),
    child: WeatherAdditionalInfo(),
  });

export default WeatherRevealer;
