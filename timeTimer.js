const numObjects = 12;
const angleObject = 360/numObjects;


function centerX(width){
    return width/2 -10
}

function centerY(height){
    return height/2 -22
}

function getPosX(i, width) {

    const distance = centerX(width) - 15
    const posX = centerX(width) + (Math.cos(((30 * i)-60)*Math.PI/180 )*distance);
    return posX
}

function getPosY(i, height) {
    const distance = centerY(height) -3
    const posY = centerY(height) + (distance* Math.sin(((30 * i)-60)*Math.PI/180 ));
    return posY;
}
