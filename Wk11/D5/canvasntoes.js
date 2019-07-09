// html has a 
// <canvas> tag with id 'my-canvas'

//     inside javscript site 

document.addEventLIsten*"DomConetentLoaded", function () {
    const canvasEl = document.getElementById("my-canvas")
// will give access to my canvas
    canvasEl.width = 500;
    canvasEl.height = 500; 

    const ctx = canvasEl.getContext("2d");
    ctx.fillStyle = "purple"/
    ctx.fillRect(0, 0 , 500, 500);

    ctx.beginPath();
    ctx.arc(100, 100, 20, 0 , 2*matchMedia.PI, true);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle - "blue";
    ctx.fill();


}

// look up chrome experiments to learn more about canvas elements

// mdn  2dstyle javascritp