fetch('https://api.weatherapi.com/v1/current.json?key=116e9a1a5c794f4894e02116242705&q=Buenos-Aires&lang=es')
.then(response => response.json())
.then(data => {
    const location = data.location;
    const current = data.current;
    const condition = current.condition;

    var ciudad = location.name;
    var pais = location.country;
    console.log(ciudad + "- " + pais + ", " + hora);
    const titulo = document.getElementById("titulo-clima");
    titulo.innerText = `${ciudad}, ${pais}`;
    
    var hora = location.localtime;
    const horaActual = document.getElementById("hora");
    horaActual.innerText = `Ultima actualización: ${hora}`;
    
    var icon = condition.icon;
    var conditionText = condition.text
    var temp = current.temp_c;
    var hum = current.humidity;
    var viento = current.wind_kph;
    var prec = parseFloat(current.precip_mm)*100;
    const imgDiv = document.getElementById("info-div");
    imgDiv.innerHTML = `<img src="https:${icon}" alt="icono clima">
                        <div class="d-flex justify-content-center align-content-center flex-column">
                        <h4 class="ps-3 m-0 fw-semibold">${conditionText}</h4>
                        <h4 class="ps-3 m-0 fw-semibold">${temp}°C</h4>
                        </div>`;
    
    const datosAdc = document.getElementById("datos_adicionales");
    datosAdc.innerHTML = `<p class="m-0"><span class="fw-bolder">Humedad</span>: ${hum}%
                            <p class="m-0"><span class="fw-bolder">Viento</span>: a ${viento} km/h</p>
                            <p class="m-0"><span class="fw-bolder">Prob. de precipitaciones</span>: ${prec}%</p>`;                
})
.catch(error => {
    console.log("Ocurrio un fallo en el llamado a la API: ", error);
})