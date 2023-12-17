import Widget from "resource:///com/github/Aylur/ags/widget.js";
import WeatherService from "../../services/weather.js";
import PanelButton from "../PanelButton.js";

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

const WeatherButton = () =>
  PanelButton({
    class_name: "weather",
    window: "weather",
    // on_clicked: () => App.toggleWindow("weather"),
    content: WeatherBox(),
  });

export default WeatherButton;
