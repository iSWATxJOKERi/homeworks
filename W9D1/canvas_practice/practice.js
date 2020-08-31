document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.width = 500;
    canvas.height = 500;
    const ctx = canvas.getContext('2d');

    ctx.fillStyle = 'red';
    ctx.fillRect(0, 0, 150, 100);

    ctx.beginPath();
    ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
    ctx.strokeStyle = 'green';
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = 'gray';
    ctx.fill();

});
