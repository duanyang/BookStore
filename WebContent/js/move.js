// JavaScript Document
//var ie=document.all;
var nn6=document.getElementById&&!document.all;
var isdrag=false;
var y,x;
var oDragObj;
var oZindex;

function myMoveMouse(evt) {
	if (isdrag) {
		evt = evt || window.event;
		oDragObj.style.top  =  (nTY + evt.clientY - y)+"px";
		oDragObj.style.left  =  (nTX + evt.clientX - x)+"px";
		return false;
	} 
} 

function initDrag(evt) {
	var oe = nn6 ? evt.target : event.srcElement;
	//var topElement = "HTML";
	while (oe.tagName!="HTML" && oe.style.position!="relative" && oe.style.position!="absolute"){
		oe = nn6 ? oe.parentNode : oe.parentElement;
	} 
	isdrag = true;
	if(!oDragObj){
		oZindex = oe.style.zIndex;
		oe.style.zIndex = 100;
	}
	if (oDragObj && oe!=oDragObj){
		oDragObj.style.zIndex = oZindex;
		oZindex = oe.style.zIndex;
		oe.style.zIndex = 100;
	}
	nTY = parseInt(oe.style.top+0);
	y = nn6 ? evt.clientY : event.clientY;
	nTX = parseInt(oe.style.left+0);
	x = nn6 ? evt.clientX : event.clientX;
	oDragObj = oe;
	document.onmousemove=myMoveMouse;
	return false;
} 
/*document.onmousedown=initDrag;
document.onmouseup=function(){
	isdrag=false;
}*/
function upDrag(){
	isdrag=false;
}