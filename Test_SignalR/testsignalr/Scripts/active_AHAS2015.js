//<![CDATA[
/***********************************************
* Highlight Table Cells Script- By Menexis.com
***********************************************/

//Specify highlight behavior. "TD" to highlight table cells, "TR" to highlight the entire row:
var highlightbehavior="TD"

var ns6=document.getElementById&&!document.all
var ie=document.all

function contains_ns6(master, slave) 
{ //check if slave is contained by master
    while (slave.parentNode)
    if ((slave = slave.parentNode) == master)
    return true;
    return false;
}

function PrintIt(month, day, hour, type, area)
{
	var prnt = document.getElementById("printer");
	var hrefprint = "http://www.usahas.com/print.aspx?month="+month+"&day="+day+"&hour="+hour+"&type="+type+"&NAME="+area;
	if(area=="")
	{
   		alert("Please Select a Flying Area"+area);
   	}
   	else
	{
   		var url = "http://www.usahas.com/print.aspx?month="+month+"&day="+day+"&hour="+hour+"&type="+type+"&NAME="+area;
    		var win1 = window.open(url, 'mynewwin', 'width=1000,height=600,directories=yes,toolbar=yes,menubar=yes,resizable=yes,scrollbars=yes');
    		win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
    		return false;
   	}    
}

function changeto(e,highlightcolor)
{
    source=ie? event.srcElement : e.target
    if (source.tagName=="TABLE")
    return
    while(source.tagName!=highlightbehavior && source.tagName!="HTML")
    source=ns6? source.parentNode : source.parentElement
    if (source.style.backgroundColor!=highlightcolor&&source.id!="ignore")
    source.style.backgroundColor=highlightcolor 
    source.style.color="#ffffff"
}

function changeback(e,originalcolor)
{
    if (ie&&(event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="ignore")||source.tagName=="TABLE")
    return
    else if (ns6&&(contains_ns6(source, e.relatedTarget)||source.id=="ignore"))
    return
    if (ie&&event.toElement!=source||ns6&&e.relatedTarget!=source)
    source.style.backgroundColor=originalcolor 
    source.style.color="#000000"
}

function changetoHeight(id,color)
{
    if(id == 'height')
    {
        element = document.getElementById(id);
        element.style.backgroundColor = color;
        tooltip.show('<strong>SOARING:</strong><br/> Height is only available when the AHAS risk is based on Soaring data.'); 
    } 
    else if (id == 'HELP' || id == 'table1')
    {
    
        var rMonth = document.getElementById('hiddenM');
        var rDay = document.getElementById('hiddenD');
        var rHour = document.getElementById('hiddenH');
        
        var cD = new Date();
        var cYear = cD.getFullYear();
        var cMonth = cD.getMonth()+1;
        var cDay = cD.getDate();
        var cHour = cD.getHours();
        
        var cYear2 = cYear += '';
        var cMonth2 = cMonth += '';
        var cDay2 = cDay += '';
        var cHour2 = cHour += '';
        
        var cD2 = new Date(cYear2 + '/' + cMonth2 + '/' + cDay2 + ' ' + cHour2 + ':00:00');
        
        //if the day and month are earlier than the current date, move to next year
        if (rMonth.value < cMonth) cYear = cYear + 1;
        if (rDay.value < cDay && rMonth.value == cMonth) cYear = cYear + 1;
        if (rHour.value < cHour && rDay.value == cDay && rMonth.value == cMonth) cYear = cYear + 1;

        //convert integers to strings        
        var cYstring = cYear += ''
        var rMstring = rMonth.value += ''
        var rDstring = rDay.value += ''
        var rHstring = rHour.value += ''
        
        //create the request date
        var tDate = Date.parse(cYstring + '/' + rMstring + '/' + rDstring + ' ' + rHstring + ':00:00');
        var rD = new Date(tDate);
        
        var Diff
        if (rD.getTime() == cD2.getTime()) Diff = 0;
        if (rD.getTime() !== cD2.getTime()) Diff = Math.ceil((rD.getTime()-cD2.getTime())/3600000);
        //alert('diff=' + Diff);
        
        var intHours
        if(cHour < 5) intHours = 12+(5-cHour);
        if(cHour >= 5 && cHour < 17) intHours = 24-(cHour-5);
        if(cHour >= 17) intHours = 24-(cHour-17);
        
        if (rMonth.value == cMonth && rDay.value == cDay && rHour.value == cHour)
        //if (Diff = 0)
        {
        tooltip.show('<img alt="" src="/images/tooltip1c.jpg "' + 'width="500"/>'); 
        }
        else if (Diff < intHours)
        {
        tooltip.show('<img alt="" src="/images/tooltip1f.jpg "' + 'width="500"/>'); 
        }
        else
        {
        tooltip.show('<img alt="" src="/images/tooltip1b.jpg "' + 'width="500"/>'); 
        }    
    } 
    else if (id == 'NA')
    {
        tooltip.show('<strong>SOARING:</strong><br/>Risk is not based on soaring model.<br/>No height is available.'); 
    } 
    else if (id == 'NO DATA')
    {
        tooltip.show('<strong>SOARING:</strong><br/>Soaring data is not currently available.'); 
    }   
    else
    {
        tooltip.show('<strong>SOARING:</strong><br/>Thermal depth in 100s of feet AGL.'); 
    }  
}

function changebackHeight(id,color)
{
    if(id == 'height')
    {
    element = document.getElementById(id);
    element.style.backgroundColor = color;
    tooltip.hide();
    } 
    else if (id == 'HELP')
    {
//    element = document.getElementById(id);
//    element.style.backgroundColor = color;
    tooltip.hide();
    } 
    else
    {
    tooltip.hide(); 
    }  
}

function reLoad( v ) {
    var sma;
    var sma2;
    
    if (v == 'VR') sma = VR;
    else
        if (v == 'IR') sma = IR;
        else
            if (v == 'SR') sma = SR;
            else
                if (v == 'MOA') sma = MOA;
                else
                    if (v == 'MilAir') sma = MilAir;
                    else
                        if (v == 'ICAO') sma = ICAO;
                        else
                            if (v == 'Range') sma = Range;
                            else
                                if (v == 'AA') sma = AA;
                                else
                                    if (v == 'Unit') {
                                        sma = Unit;
                                        //alert("here");
                                        //document.getElementById("chkChart").checked = 0;
                                        //document.getElementById("Chart24").style.display = "none";
                                    }
                                    else
                                        if (v == 'Unit2') {
                                            sma = Unit2;
                                            //document.getElementById("chkChart").checked = 0;
                                            //document.getElementById("Chart24").style.display = "none";
                                        }
    // 
    var s = document.getElementById('area');
    var val;
	
    s.options.length = 0;
    
    if (v == 'ICAO') sma2 = ICAO2;
    else sma2 = sma;

    for (var i = 0; i < sma.length; i++ ) {
        s.options[i] = new Option( sma[i], sma2[i]);
    }
    
    //var sID = document.getElementById('hiddenID');
    var sType = document.getElementById('hiddenType');
    //var sQuery = document.getElementById('hiddenQuery');
    sType.value = v;
    //sQuery.value = 'Type='+v+'&area='+sID.value;
    
    //SetArea(sma2[0]);
}

function openNewPlusWin(type) {
    var e = document.getElementById("area");
    var sArea = e.options[e.selectedIndex].value;

    e = document.getElementById("lstMonth");
    var iMonth = GetMonthNumber(e.options[e.selectedIndex].value);

    e = document.getElementById("lstDay");
    var iDay = e.options[e.selectedIndex].value;

    e = document.getElementById("lstHour");
    var iHour = e.options[e.selectedIndex].value;

    var sType = document.getElementById('hiddenType').value;


    sArea2 = sArea.replace(/\s+/g, "");

    if (sArea == "") {
        alert("Please Select a Flying Area");
    }
    else {
        var url = "http://www.usahas.com/AHASplusRESULTS.aspx?area=" + sArea2 + "&month=" + iMonth + "&day=" + iDay + "&hour=" + iHour + "&type=" + sType;
        var win1 = window.open(url, 'mynewwin');
        win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
        return false;
    }
}

function SetArea( v ) {
    var sArea = document.getElementById('area');
    sArea.value = v;
}

function SetMonth2( v2 ) {
//This will catch the selected value in the javascript
    var s2 = document.getElementById('hiddenM');
    var v3
    //Need to convert Month Name to Month #
    if (v2 == 'Jan') v3 = 1;
    else if (v2 == 'Feb') v3 = 2;
    else if (v2 == 'Mar') v3 = 3;
    else if (v2 == 'Apr') v3 = 4;
    else if (v2 == 'May') v3 = 5;
    else if (v2 == 'Jun') v3 = 6;
    else if (v2 == 'Jul') v3 = 7;
    else if (v2 == 'Aug') v3 = 8;
    else if (v2 == 'Sep') v3 = 9;
    else if (v2 == 'Oct') v3 = 10;
    else if (v2 == 'Nov') v3 = 11;
    else if (v2 == 'Dec') v3 = 12;
    s2.value = v3;
    reLoad_Day2(v3);
}

function reLoad_Day2(v) {
    var days;
    var d = new Date();
    var NowYear = d.getFullYear();
    var NowMonth = d.getMonth() + 1;

    days = daysInMonth(v, NowYear);

    var s = document.getElementById('lstDay');

    s.options.length = 0;

    for (var i = 1; i <= days; i++) {
        s.options[i] = new Option(i, i);
    }
    SetDay(1);
}

function SetDay(v2) {
    //This will catch the selected value in the javascript
    var s2 = document.getElementById('hiddenD');
    s2.value = v2;
    var s3 = document.getElementById('lstDay')
    s3.value = v2;
}

function daysInMonth(iMonth, iYear) {
    //alert('Month'+iMonth);
    return 32 - new Date(iYear, iMonth - 1, 32).getDate();
}

function confirmGEMap(type) {
    var answer = "";
    //alert('here')
    if (type == 'Unit' || type == 'Unit2') {
        alert("If your unit has a large number of areas, the google map will load more slowly and might not load all of your units areas.")
        return OnButtonGEMap()
    }
    else {
        return OnButtonGEMap()
    }
}

function OnButtonGEMap() {
    var e = document.getElementById("area");
    var sR = e.options[e.selectedIndex].value;

    e = document.getElementById("lstMonth");
    var sM = GetMonthNumber(e.options[e.selectedIndex].value);

    e = document.getElementById("lstDay");
    var sD = e.options[e.selectedIndex].value;

    e = document.getElementById("lstHour");
    var sH = e.options[e.selectedIndex].value;

    sUrl = "http://www.usahas.com/AHASMap.html?Area=" + sR;

    var win1 = window.open(sUrl, 'mynewwin', 'channelmode=yes,fullscreen=yes,location=no,menubar=no,resizable=yes,scrollbars=yes,titlebar=no,toolbar=no');
    win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
    return false;

}

function confirmationGE() {
    var answer = confirm("Only available to AHAS users that have Google Earth installed.  Click OK to continue or cancel to return to main page.")
    if (answer) {
        return GE()
    }
}

function GE() {
    var e = document.getElementById("area");
    var flyingArea = e.options[e.selectedIndex].value;

    if (flyingArea == 'Select a button above') {
        alert('Please select a flying area.');
        return false;
    }

    //var route = document.getElementById('hiddenType').value;
    var loc = 'kml/';
    //var loc2 = 'kmz/';

    //if (route == 'Unit') {
    //    loc = flyingArea.replace(/\s+/g, "") + '.kml';
    //    loc = '../GE/kml/' + loc.replace("/", "");
    //}
    //else {
        loc = flyingArea.replace(/\s+/g, "") + '.kml';
        loc = '../GE/kml/' + loc.replace("/", "");
    //}

    document.location = loc;

    return true;
}

//function reLoad_Day( v ) {
////alert('day'+v);
//    var days;
//    var d = new Date();
//    var NowYear = d.getFullYear();
//    var NowMonth = d.getMonth()+1;

//    if (v == NowMonth) days = d.getDate();
//    else days = daysInMonth(v,NowYear);

////alert('Month'+v+' '+NowYear+' '+NowMonth+' '+days);
        					
//    var s = document.getElementById('lstDay');
    	
//    s.options.length = 0;

//    for (var i = 1; i <= days; i++ ) {
//        s.options[i] = new Option( i, i);
//    }
//    SetDay(1);	

//}

//function SetHour( v2 ) {
////This will catch the selected value in the javascript
//    var s2 = document.getElementById('hiddenH');
//    s2.value = v2;
//}

//function scrollit() {
//  eldata=document.getElementById("DataTab");  
//  x=eldata.scrollLeft;  
//}

//function openNewWin(url,month,day,hour) {
//   if(url==""){
//   	alert("Please Select a Flying Area"+url);
//   }
//   else{
//   //	alert("wtf"+url);    
//    	url="http://www.usahas.com/diag2011/RESULTS.aspx?area="+url+"&month="+month+"&day="+day+"&hour="+hour;
//    	//alert(url);
//    	var win1 = window.open(url, 'mynewwin', 'width=1000,height=600,directories=yes,toolbar=yes,menubar=yes,resizable=yes,scrollbars=yes');
//    	win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
//    	return false;
//   }
//} 

//function openNewWin2(url) {
//    //var x = window.open(url, 'mynewwin', 'width=860,height=600,toolbar=1');
//    //x.focus();
//    url="http://www.usahas.com/diag2011/RESULTS.aspx?area="+url+"&service=2";
//    //alert(url);
//    var win1 = window.open(url, 'mynewwin', 'width=860,height=600,directories=yes,toolbar=yes,menubar=yes,resizable=yes,scrollbars=yes');
//    win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
//    return false;
//}

//function openNewChart(url,month,day) {
//    //var x = window.open(url, 'mynewwin', 'width=860,height=600,toolbar=1');
//    //x.focus();
//    if(url=="")
//	{
//	alert("Please Select a Flying Area");
//	}
//    else
//	{
    
//    	url="http://www.usahas.com/diag2011/Chart.aspx?area='"+url+"'&iMonth="+month+"&iDay="+day;
//    	//url="http://www.usahas.com/diag2011/Chart2.aspx";
//    	//alert(url);
//    	var win1 = window.open(url, 'mynewwin', 'width=860,height=600,directories=yes,toolbar=yes,menubar=yes,resizable=yes,scrollbars=yes');
//    	win1.name = ''; // this should ensure that we don't overwrite a window that we've previously opened
//    	return false;
//	}
//}

//function confirmation(url,month,day,type){
//	//var answer = confirm("Only available for Airfields. Click OK to continue or cancel to return to main page.")
	
//	if (type=="MilAir"){
//		openNewChart(url,month,day)
//	}
//	else{
//	alert("Only available with Airfields");		
//	}
//}

//function confirmation2(route){
//	var answer = "";	

//	if (route == 'Unit' || route == 'Unit2' || route == 'AA') {
//		alert("Not available for Unit and Alert Area options.")
//		}
//	else {
//		return OnButton2()
//		}	
//}



//var tooltip=function(){
//	var id = 'tt';
//	var top = 1;
//	var left = 1;
//	var maxw = 600;
//	var speed = 10;
//	var timer = 20;
//	var endalpha = 95;
//	var alpha = 0;
//	var tt,t,c,b,h;
//	var ie = document.all ? true : false;
//	return{
//		show:function(v,w){
//			if(tt == null){
//				tt = document.createElement('div');
//				tt.setAttribute('id',id);
//				t = document.createElement('div');
//				t.setAttribute('id',id + 'top');
//				c = document.createElement('div');
//				c.setAttribute('id',id + 'cont');
//				b = document.createElement('div');
//				b.setAttribute('id',id + 'bot');
//				tt.appendChild(t);
//				tt.appendChild(c);
//				tt.appendChild(b);
//				document.body.appendChild(tt);
//				tt.style.opacity = 0;
//				tt.style.filter = 'alpha(opacity=0)';
//				document.onmousemove = this.pos;
//			}
//			tt.style.display = 'block';
//			c.innerHTML = v;
//			tt.style.width = w ? w + 'px' : 'auto';
//			if(!w && ie){
//				t.style.display = 'none';
//				b.style.display = 'none';
//				tt.style.width = tt.offsetWidth;
//				t.style.display = 'block';
//				b.style.display = 'block';
//			}
//			if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
//			h = parseInt(tt.offsetHeight) + top;
//			clearInterval(tt.timer);
//			tt.timer = setInterval(function(){tooltip.fade(1)},timer);
//		},
//		pos:function(e){
//			var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
//			var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
//			tt.style.top = (u - h) + 'px';
//			tt.style.left = (l + left) + 'px';
//		},
//		fade:function(d){
//			var a = alpha;
//			if((a != endalpha && d == 1) || (a != 0 && d == -1)){
//				var i = speed;
//				if(endalpha - a < speed && d == 1){
//					i = endalpha - a;
//				}else if(alpha < speed && d == -1){
//					i = a;
//				}
//				alpha = a + (i * d);
//				tt.style.opacity = alpha * .01;
//				tt.style.filter = 'alpha(opacity=' + alpha + ')';
//			}else{
//				clearInterval(tt.timer);
//				if(d == -1){tt.style.display = 'none'}
//			}
//		},
//		hide:function(){
//			clearInterval(tt.timer);
//			tt.timer = setInterval(function(){tooltip.fade(-1)},timer);
//		}
//	};
//}();

//function SetAreaTest( v ) {
////This will catch the selected value in the javascript
//alert(v);
//    var s = document.getElementById('hiddenID');
//    //var s2 = document.getElementById('hidden3');
//    s.value = v;

//    var sType = document.getElementById('hiddenType');
//    var sArea = document.getElementById('area');
//    //alert('setarea'+s.value);
//    var sQuery = document.getElementById('hiddenQuery');
//    sQuery.value = 'Type='+sType.value+'&area='+s.value;
//    sArea.value = v;

//    //s2.value = v2;
//}

//function SetMonth( v2 ) {
////This will catch the selected value in the javascript
////alert('month'+v2);
//    var s2 = document.getElementById('hiddenM');
//    var v3
//    //Need to convert Month Name to Month #
//    if (v2 == 'January') v3 = 1;
//    else if (v2 == 'February') v3 = 2;
//    else if (v2 == 'March') v3 = 3;
//    else if (v2 == 'April') v3 = 4;
//    else if (v2 == 'May') v3 = 5;
//    else if (v2 == 'June') v3 = 6;
//    else if (v2 == 'July') v3 = 7;
//    else if (v2 == 'August') v3 = 8;
//    else if (v2 == 'September') v3 = 9;
//    else if (v2 == 'October') v3 = 10;
//    else if (v2 == 'November') v3 = 11;
//    else if (v2 == 'December') v3 = 12;
//    s2.value = v3;
//    reLoad_Day(v3);
//}