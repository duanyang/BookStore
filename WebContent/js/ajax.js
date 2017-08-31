// JavaScript Document
//ajax
function createXMLHttp(){
	var xmlhttp;
	try {
		xmlhttp = new XMLHttpRequest();
		return xmlhttp;
	} catch (trymicrosoft) {
		var xVer = [
			"Msxml2.XMLHTTP.5.0",
			"Msxml2.XMLHTTP.4.0",
			"Msxml2.XMLHTTP.3.0",
			"Msxml2.XMLHTTP",
			"Microsoft.XMLHTTP"
		];
		for(var j=0;j<xVer.length;j++){
			try {
				xmlhttp = new ActiveXObject(xVer[j]);
				return xmlhttp;
			} catch(e) {
				xmlhttp = false;
			}
		}
		return xmlhttp;
	}
}

var XMLrequest = createXMLHttp();
if (!XMLrequest){
  alert("你的浏览器不支持异步传输！");
}