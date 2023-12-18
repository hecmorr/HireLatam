const express = require("express");
const axios = require("axios");
require("dotenv").config();

const app = express();
const port = 3000;

const API_KEY = process.env.WEATHER_API_KEY;

// Define a route for the root path of the application
app.get("/", (req, res) => {
  const city = req.query.city; // Read the city query parameter from the request
  const url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${API_KEY}`;
  console.log(url);

  // Make an HTTP GET request to the API using axios
  axios
    .get(url)
    .then((response) => {
      const data = response.data;
      const cityName = data.name;
      const description = data.weather[0].main;
      const temperature = data.main.temp;
      const code = data.weather[0].id;
      const message = {
        location: cityName,
        temperature: temperature,
        description: description,
        code: code,
      };

      //   console.log(data);
      console.log(message);
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
