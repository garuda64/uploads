var timeout = 0;
var url_banner = "";
var remaining = 0;
var dataTable = [];
var tipoSorteo = "";
var ArrayBanners = [];
var indexBanner = 0;
var isShuffle = false;

window.onload = function() 
{
    if(window.location.toString().includes("sorteo"))
    {
        ReadFileCSV();
    }
    
    if(window.location.toString().includes("portal"))
    {
        ArrayBanners = document.getElementById("banners").value.split(" ");
        startTimer();
    }
}

window.startTimer = function() 
{
    setInterval(displayNextImage, 10000);
}

window.displayNextImage = function() 
{
    document.getElementById("bannerImg").src = "/assets/" + ArrayBanners[indexBanner];
    if(indexBanner == 0)
    {
        indexBanner = 1;
    }
    else
    {
        indexBanner = 0;
    }
}

window.ShuffleIds = function()
{
    if(isShuffle == false)
    {        
        timeout = document.getElementById("timeout").value * 20;
        remaining = document.getElementById("timeout").value;
        
        (async () => {
            var timeTrans = 0;
            isShuffle = true;
            document.getElementById("btnImage").src = "/assets/Boton-confianza-ex.png";
            while (await new Promise(resolve => setTimeout(() => resolve(timeTrans++), 50)) < timeout)
            {
                var randomId = Math.floor(Math.random() * dataTable.length);                     
                //var values = dataTable[randomId];
                //added
                var values = sessionStorage.getItem(randomId).split(";"); 
                if(values[1] !== undefined)
                {
                    //console.log(values[1]);
                    document.getElementById("documento").innerHTML = values[1].replace(/.(?=.{4})/g, '');
                    document.getElementById("nombre").innerHTML = values[2];
                    document.getElementById("sede").innerHTML = values[3];
                    //document.getElementById("tiempo").innerHTML = Math.floor((remaining - (timeTrans / 20))) + 1;
                    given_seconds = Math.floor((remaining - (timeTrans / 20))) + 1;
                    hours = Math.floor(given_seconds / 3600);
                    minutes = Math.floor((given_seconds - (hours * 3600)) / 60); 
                    seconds = given_seconds - (hours * 3600) - (minutes * 60);
                    document.getElementById("tiempo").innerHTML = minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
                }
                else
                {
                    console.log("undefinied");
                }                
            }
            document.getElementById("tiempo").innerHTML = "00:00";
            isShuffle = false;
            document.getElementById("btnImage").src = "/assets/Boton-confianza.png";
        })();
    }    
}

window.GoToSorteoMejoraNacional = function()
{
    document.location.href="sorteo?id=3";
    tipoSorteo = "Sorteo Mejora Vivienda Nacional";
}

window.GoToSorteoMejora = function()
{
    document.location.href="sorteo?id=1";
    tipoSorteo = "Sorteo Mejora Vivienda";
}

window.GoToSorteoCasa = function()
{
    document.location.href="sorteo?id=2";
    tipoSorteo = "Sorteo Casa";
}

window.GoToPortal = function()
{
    document.location.href="portal";
}


window.ReadFileCSV = function()
{
    var file = "../CSV/" + document.getElementById("databaseName").value;
    console.log(file);
    var rawFile = new XMLHttpRequest(); // XMLHttpRequest (often abbreviated as XHR) is a browser object accessible in JavaScript that provides data in XML, JSON, but also HTML format, or even a simple text using HTTP requests.
    rawFile.open("GET", file, false); // open with method GET the file with the link file ,  false (synchronous)
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4) // readyState = 4: request finished and response is ready
        {
            if(rawFile.status === 200) // status 200: "OK"
            {
                var allText = rawFile.responseText; //  Returns the response data as a string
                GetValuesInTable(allText); // display text on the console
            }
        }
    }
    rawFile.send(null);
}

window.GetValuesInTable = function(allText)
{
    var lineas = allText.split("\n");
    var position = 1;
    lineas.forEach(function(linea) 
    {
        var values = linea.split(";");
        dataTable.push([values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7]]);
        //Added
        sessionStorage.setItem(position, linea.toString());
        position++;
    },
    this);
    //console.log(dataTable);
    //console.log(lineas); // display text on the console
}