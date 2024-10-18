
async function checkWeather(){
    const city="london";
    const ApiKey="cb0017400bd0b6466ac8f027e7430516";
const result = await fetch("https://api.openweathermap.org/data/2.5/weather?" +`q=${city}`+`&appid=${ApiKey}`);

const object= await result.json();
console.log(object);
}
checkWeather();