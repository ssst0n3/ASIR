var DIV_WIDTH = document.getElementById('logo').offsetWidth + 300;
var DIV_HEIGHT = document.getElementById('logo').offsetHeight + 200;
var RADIUS = 10;
var MARGIN_TOP = 60;
var MARGIN_LEFT = 100;

digit =
    [
        [
            [0,0,1,1,1,1,0],
            [0,1,1,0,0,1,1],
            [1,1,0,0,0,0,0],
            [0,1,1,1,0,0,0],
            [0,0,0,1,1,1,0],
            [0,0,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [0,1,1,1,1,1,0],
            [0,0,1,1,1,0,0]
        ],//S-0
        [
            [1,1,0,0,0,0,1,1],
            [1,1,0,0,0,0,1,1],
            [1,1,0,0,0,0,1,1],
            [0,1,1,0,0,1,1,0],
            [0,0,1,1,1,1,0,0],
            [0,0,0,1,1,0,0,0],
            [0,0,0,1,1,0,0,0],
            [0,0,0,1,1,0,0,0],
            [0,0,0,1,1,0,0,0],
            [0,0,0,1,1,0,0,0]
        ],//Y-1
        [
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,0,0,0,1,1],
            [1,1,1,1,1,1,1],
            [0,1,1,1,1,1,0]
        ],//U-2	
		[
		    [0,0,0,1,1,1,0,0,0],
            [0,0,1,1,0,1,1,0,0],
		    [0,1,1,0,0,0,1,1,0],
            [0,1,1,0,0,0,1,1,0],
		    [1,1,0,0,0,0,0,1,1],
            [1,1,1,1,1,1,1,1,1],
		    [1,1,0,0,0,0,0,1,1],
            [1,1,0,0,0,0,0,1,1],
		    [1,1,0,0,0,0,0,1,1],
            [1,1,0,0,0,0,0,1,1],
        ],//A-3	
        [
            [1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1],
            [0,0,1,1,1,0,0],
            [0,0,1,1,1,0,0],
            [0,0,1,1,1,0,0],
            [0,0,1,1,1,0,0],
            [0,0,1,1,1,0,0],
            [0,0,1,1,1,0,0],
            [1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1]
        ],//I-4		
		[
		    [0,1,1,1,1,1,1,0],
            [1,1,0,0,0,0,1,1],
            [1,1,0,0,0,0,1,1],
            [1,1,0,0,0,1,1,1],
            [1,1,1,1,1,1,1,0],
            [1,1,1,1,0,0,0,0],
            [1,1,0,1,1,0,0,0],
            [1,1,0,0,1,1,0,0],
            [1,1,0,0,0,1,1,0],
            [1,1,0,0,0,0,1,1]
        ],//R-5
    ];

window.onload = function(){

    MARGIN_LEFT = Math.round(DIV_WIDTH /4);
    RADIUS = Math.round(DIV_WIDTH * 4 / 5 / 108)-1 ;

    MARGIN_TOP = Math.round(DIV_HEIGHT /7);

    var canvas = document.getElementById('canvas');
    var context = canvas.getContext("2d");

    canvas.width = DIV_WIDTH;
    canvas.height = DIV_HEIGHT;

	render( context );
}


function render( cxt ){

    renderLogo( MARGIN_LEFT , MARGIN_TOP , 3 , cxt , true);
    renderLogo( MARGIN_LEFT + 20*(RADIUS+1) , MARGIN_TOP , 0 , cxt , true );
    renderLogo( MARGIN_LEFT + 38*(RADIUS + 1) , MARGIN_TOP , 4 , cxt, true );
    renderLogo( MARGIN_LEFT + 56*(RADIUS+1) , MARGIN_TOP , 5 , cxt, true);
	
    renderLogo( MARGIN_LEFT + 15*(RADIUS+1) , 4* MARGIN_TOP , 0 , cxt, false );
    renderLogo( MARGIN_LEFT + 25*(RADIUS+1) , 4* MARGIN_TOP , 1 , cxt , false );
    renderLogo( MARGIN_LEFT + 35*(RADIUS + 1) , 4* MARGIN_TOP , 0 , cxt, false );
    renderLogo( MARGIN_LEFT + 45*(RADIUS+1) , 4* MARGIN_TOP , 2 , cxt, false );

}

function renderLogo( x , y , num , cxt , judge){

    cxt.fillStyle = "black";
	var r = (judge == true)? RADIUS : 0.5 * RADIUS;
    for( var i = 0 ; i < digit[num].length ; i ++ )
        for(var j = 0 ; j < digit[num][i].length ; j ++ )
            if( digit[num][i][j] == 1 ){
                cxt.beginPath();
                cxt.arc( x+j*2*(r+1)+(r+1) , y+i*2*(r+1)+(r+1) , r , 0 , 2*Math.PI );
                cxt.closePath();
                cxt.fill();
            }
}