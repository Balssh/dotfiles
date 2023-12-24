import Service from "resource:///com/github/Aylur/ags/service.js";
import Soup from "gi://Soup?version=3.0";
import GLib from "gi://GLib";
import { interval } from "resource:///com/github/Aylur/ags/utils.js";
import icons from "../icons.js";

class WeatherService extends Service {
  static registerService() {
    Service.register(
      this,
      {},
      {
        "feels-like": ["int"],
        temp: ["int"],
        icon: ["string"],
        description: ["string"],
        city: ["string"],
        "weather-data": ["jsobject"],
      }
    );
  }

  _feelsLike = 0;
  _temp = 0;
  _description = "";
  _icon = "";
  _city = "";
  _weatherData = {};
  _url = "http://wttr.in/?format=j1";
  _decoder = new TextDecoder();

  get feelsLike() {
    return this._feelsLike;
  }
  get temp() {
    return this._temp;
  }
  get icon() {
    return this._icon;
  }
  get description() {
    return this._description;
  }
  get weatherData() {
    return this._weatherData;
  }
  get city() {
    return this._city;
  }

  constructor() {
    super();
    interval(900000, this._getWeather.bind(this)); // every 15 min
  }

  _getWeather() {
    const session = new Soup.Session();
    const message = new Soup.Message({
      method: "GET",
      uri: GLib.Uri.parse(this._url, GLib.UriFlags.NONE),
    });

    session.send_and_read_async(
      message,
      GLib.DEFAULT_PRIORITY,
      null,
      (_, result) => {
        const resp = this._decoder.decode(
          session.send_and_read_finish(result).get_data()
        );
        const { current_condition, weather, nearest_area } = JSON.parse(resp);
        const weatherData = current_condition[0];
        const weatherCode = weatherData.weatherCode;
        const sunriseHour = weather[0].astronomy[0].sunrise.split(":")[0];
        const sunsetHour = weather[0].astronomy[0].sunset.split(":")[0];
        const city = nearest_area[0].areaName[0].value;

        this.updateProperty("weather-data", weatherData);
        this.updateProperty("feels-like", Number(weatherData.FeelsLikeC));
        this.updateProperty("temp", Number(weatherData.temp_C));
        this.updateProperty("description", weatherData.weatherDesc[0].value);
        this.updateProperty("city", city);
        this.updateProperty("icon", icons.weather[weatherCode] || "");
      }
    );
  }
}

WeatherService.registerService();

const service = new WeatherService();
export default service;
