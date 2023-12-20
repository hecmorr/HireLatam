const express = require("express");
const axios = require("axios");
require("dotenv").config();

const app = express();
const port = 3000;

const API_KEY = process.env.WEATHER_API_KEY;

// Define a route for the root path of the application
app.get("/", (req, res) => {
  const city = req.query.city; // Read the city query parameter from the request
  const lat = req.query.lat;
  const lon = req.query.lon;

  const params = new URLSearchParams();
  if (lat) {
    params.set("lat", lat);
  }

  if (lon) {
    params.set("lon", lon);
  }

  if (city) {
    params.set("q", city);
  }

  const paramsString = params.toString();

  const url = `http://api.openweathermap.org/data/2.5/weather?${paramsString}&units=metric&appid=${API_KEY}`;
  console.log(url);

  // Make an HTTP GET request to the API using axios
  axios
    .get(url)
    .then((response) => {
      const data = response.data;
      const cityName = data.name;
      const description = data.weather[0].main;
      const time = data.timezone;
      const temperature = data.main.temp;
      const code = data.weather[0].id;

      const weatherData = {
        areaName: cityName,
        temperature: temperature,
        weatherMain: description,
        time: time,
        weatherConditionCode: code,
      };

      if (res.status == 400) {
        return "City not found";
      } else if (res.status == 500) {
        return "The name of the city was not introduced properly";
      }

      const finalData = {
        status: res.status,
        body: weatherData,
      };

      //   console.log(data);
      console.log(weatherData);
      res.send(weatherData);

      return finalData;
    })
    .catch((error) => {
      console.error(error);
      res.status(500).send("Error occurred while fetching weather data");
    });
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
