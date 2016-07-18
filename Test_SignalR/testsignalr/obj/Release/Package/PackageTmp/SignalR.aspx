<%@ Page Language="vb" AutoEventWireup="false" CodeFile="SignalR.aspx.vb" Inherits="AHAS" Debug="true" EnableEventValidation="false" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>United States Air Force Avian Hazard Advisory System</title>
        <meta name="Description" content="A geospatial predictive risk model supporting United States Air Force pilots, airspace planners, schedulers, and environmental planners."/>
        <meta name="Keywords" content="usaf, air, force, bird, strike, avoidance, model, ims, internet, map, server, bash, bam, usafa, academy, pilot, plan"/>  
        <link rel="stylesheet" type="text/css" href="styleSignalR.css" />  
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="favicon.ico" type="image/x-icon"/>

        <script src="/SignalR/Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script src="/SignalR/Scripts/jquery.signalR-2.2.0.min.js" type="text/javascript"></script>
        <script src="/SignalR/signalr/hubs" type="text/javascript"></script>
    
        <script type="text/javascript" src="/SignalR/Scripts/active_AHAS2015.js"></script>
        <script type="text/javascript" src="/SignalR/Scripts/Unit.js"></script>        
      
</head>

<body style='text-align:center'>
    <h1>AHAS</h1>  
    <form id="form1" runat="server">
        <script type="text/javascript">
            document.getElementById("tablelinks").onmouseover = function () { changeto(event, '#273B53') };
            document.getElementById("tablelinks").onfocus = function () { changeto(event, '#273B53') };
            document.getElementById("tablelinks").onmouseout = function () { changeback(event, '#cccc99') };
            document.getElementById("tablelinks").onblur = function () { changeback(event, '#cccc99') };
            document.getElementById("table1").onmouseover = function () { changetoHeight('table1', '#cccc99') };
            document.getElementById("table1").onfocus = function () { changetoHeight('table1', '#cccc99') };
            document.getElementById("table1").onmouseout = function () { changebackHeight('table1', '#344551') };
            document.getElementById("table1").onblur = function () { changebackHeight('table1', '#344551') };
            document.getElementById("btnPrint").onclick = function () { PrintIt(hiddenM.value, hiddenD.value, hiddenH.value, hiddenType.value, hiddenID.value) };
            document.getElementById("btnPrint").onkeypress = function () { PrintIt(hiddenM.value, hiddenD.value, hiddenH.value, hiddenType.value, hiddenID.value) };
            
        </script>
        <div id="skip">
            <a href="#navlinks">[Skip to Content]</a>
        </div>        
        <table id="navlinks" align= "center" width="1000" border="0" summary="Navigation Links">
            <tbody>
                <tr>
	                <td valign="top" colspan="2" class="style1" height="120">
                        <!--start of TABLE 2-->
					    <table id="tablelinks" cellspacing="0" cellpadding="0" width="820" border="0">
					        <tbody>
							    <tr id="element">
						    <td title="Home" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Home" class="changeLink" href="home/">HOME</a></td>
                            <td title="Ahas" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="AHAS" class="changeLink" href="default.aspx">AHAS</a></td>
                            <td title="About" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="About" class="changeLink" href="about/">ABOUT</a></td>
                            <td title="Instructions" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Instructions" class="changeLink" href="instructions/">INSTRUCTIONS</a></td>
                            <td title="Faq" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="FAQ" class="changeLink" href="faq/">FAQ</a></td>
                            <td title="Gallery" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Gallery" class="changeLink" href="gallery/">GALLERY</a></td>
                            <td title="Downloads" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Downloads" class="changeLink" href="downloads/">DOWNLOADS</a></td>
                            <td title="Terms" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Terms" class="changeLink" href="terms/">TERMS</a></td>
                            <td title="Contact" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Contact" class="changeLink" href="contact/">CONTACT</a></td>
                            <td title="Sitemap" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Sitemap" class="changeLink" href="home/sitemap.aspx">SITEMAP</a></td>
                            <td title="Privacy" align="center" valign="middle" width="90" bgcolor="#cccc99" style="border-right: black 1px solid; border-top: black 1px solid; margin: 0px; border-left: black 1px solid; border-bottom: black 1px solid; height: 25px;"> <a title="Privacy" class="changeLink" href="home/privacy.aspx">PRIVACY</a></td>     
							    </tr>
						    </tbody>
					    </table>
					    <!--end of TABLE 2-->

                        <!--start of TABLE 3-->
                        <a href="home/">
					    <img alt="Ahas header" src="images/header03.jpg" title="Avian Hazard Advisory System Banner" width="100%" height="107" border="1"/></a></td>
	            </tr>
                <tr>
			        <td id="content2" style="text-align: center; vertical-align: top;">
					    <!-- kyler added a table because we need the map to show up to the right of this stuff. R2 added valign -->
					    <table id="arisk">
						    <tr>
							    <td style="width:100%; FONT-WEIGHT: normal; color: White; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;"> <asp:Label ID="lbl1" Text="Determine AHAS Risk" runat="server"/> 
                                </td>
						    </tr>
						    <tr>
							    <td style="margin-left: 2px; margin-right: 2px; FONT-WEIGHT: normal; BACKGROUND-COLOR: #344551;">
								    <!--Second TABLE that contains selection options R2 added valign-->
								    <table id="chooseareas">
									    <tbody>
									        <%--This RadioButtonList has no "border" issue as long as there is nothing in the list %>
                                                        This has nothing to do with the javascript, because the error occurs without the javascript %>--%>
                                            <tr>	
									            <td colspan="3" class="text" style="background-color: #ededcd; text-align:left;">
                                                        
												        <b>Select Area Type Below </b>                       
                                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" BorderStyle="None" RepeatLayout="Flow">
                                                            <asp:ListItem Selected="True" Value="VR" Text="Visual Routes" onClick="reLoad('VR');" onkeypress="reLoad('VR');"></asp:ListItem> 
                                                            <asp:ListItem Value="IR" Text="Instrument Routes" onClick="reLoad('IR');" onkeypress="reLoad('IR');"></asp:ListItem>
                                                            <asp:ListItem value="SR" Text="Slow Routes" onClick="reLoad('SR');" onkeypress="reLoad('SR');"></asp:ListItem>
                                                            <asp:ListItem value="MilAir" Text="Airfields" onClick="reLoad('MilAir');" onkeypress="reLoad('MilAir');"></asp:ListItem>
                                                            <asp:ListItem value="ICAO" Text="ICAO" onClick="reLoad('ICAO');" onkeypress="reLoad('ICAO');"></asp:ListItem>
                                                            <asp:ListItem value="MOA" Text="MOAs" onClick="reLoad('MOA');" onkeypress="reLoad('MOA');"></asp:ListItem>
                                                            <asp:ListItem value="Range" Text="Ranges" onClick="reLoad('Range');" onkeypress="reLoad('Range');"></asp:ListItem>
                                                            <asp:ListItem value="AA" Text="Alert Areas" onClick="reLoad('AA');" onkeypress="reLoad('AA');"></asp:ListItem>
                                                            <asp:ListItem value="Unit" Text="Air Force Units" onClick="reLoad('Unit');" onkeypress="reLoad('Unit');"></asp:ListItem>
                                                            <asp:ListItem value="Unit2" Text="Other Units" onClick="reLoad('Unit2');" onkeypress="reLoad('Unit2');"></asp:ListItem>
                                                        </asp:RadioButtonList>

                                                        <asp:HiddenField ID="hiddenID" runat="server" value="1"/>
                                                        <asp:HiddenField ID="hiddenType" runat="server" value="1"/>
                                                        <asp:HiddenField ID="hiddenM" runat="server" value="1"/>
                                                        <asp:HiddenField ID="hiddenD" runat="server" value="1"/>
                                                        <asp:HiddenField ID="hiddenVR" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenIR" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenSR" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenMOA" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenAA" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenRANGE" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenMILAIR" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenUNIT" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenUNIT2" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenICAO1" runat="server" Value="" />
                                                        <asp:HiddenField ID="hiddenICAO2" runat="server" Value="" />                                                          
                                                         
                                                </td>
									        </tr>
									        <tr>	
									            <td colspan="3" class="text" style="background-color: #ededcd; text-align: center;">                                            
									            </td>
									        </tr>
									        <tr>	
									            <td colspan="3" class="text" style="background-color: #ededcd; text-align: left;">
                                                    <label for="area" title="area"> Select a Flying Area
												    <asp:DropDownList ID="area" runat="server" AutoPostBack="False" Width="272px">
                                                        <asp:ListItem Selected="True" >Select a Flying Area</asp:ListItem>
                                                    </asp:DropDownList> 
                                                    </label>                                        
											    </td>
									        </tr>
									  
									        <tr>	
									            <td class="text" style="background-color: #ededcd; text-align: center;">
                                                    <label for="lstMonth" title="lstMonth"> Select Month
												    <asp:DropDownList ID="lstMonth" runat="server" onChange="SetMonth2(this.value);" AutoPostBack="False" AppendDataBoundItems="True">
                                                        <asp:ListItem Selected="True" value=""></asp:ListItem>
                                                    </asp:DropDownList> 
                                                    </label>                                               
											    </td>	
									            <td class="text" style="background-color: #ededcd; text-align: center;">
                                                    <label for="lstDay" title="lstDay"> Select Day
												    <asp:DropDownList ID="lstDay" runat="server" AutoPostBack="False" AppendDataBoundItems="True">
                                                        <asp:ListItem Selected="True" value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    </label>                                                
											    </td>	
									            <td class="text" style="background-color: #ededcd; text-align: center;">
												    <label for="lstHour" title="lstHour"> Select Z Hour
                                                    <asp:DropDownList ID="lstHour" runat="server" AutoPostBack="False" AppendDataBoundItems="True">
                                                        <asp:ListItem Selected="True" value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    </label>                                                
											    </td>
									        </tr>
									        <tr>	
									            <td colspan="3" class="text" style="background-color: #ededcd; text-align: center; vertical-align:middle;">
                                                        <input class="btn1" name="AHAS RISK button" id="Button1" type="button" value="AHAS RISK" onkeypress="loadXMLDoc();" onclick="loadXMLDoc();"/>
                                                        <input class="btn1" name="GOOGLE MAP button" id="Button2" type="button" value="GOOGLE MAP" onclick="return confirmGEMap(hiddenType.value);" onkeypress="return confirmGEMap(hiddenType.value);"/><br />
                                                        <input class="btn1" name="12HR RISK BAM button" id="Button4" type="button" value="12HR RISK" onkeypress="loadXMLDoc12();" onclick="loadXMLDoc12();"/>
                                                        <input class="btn1" name="GOOGLE EARTH button" id="Button3" type="button" value="GOOGLE EARTH" onclick="return confirmationGE();" onkeypress="return confirmationGE();" />
												        <input class="btn1" name="AHASplus" id="Button6" type="button" value="AHAS plus" onclick="openNewPlusWin();" onkeypress="openNewWin(hiddenID.value,hiddenM.value,hiddenD.value,hiddenH.value);"/>
                                                        <asp:CheckBox ID="chkChart" runat="server" Text="  Show Chart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
												</td>
									        </tr>
									        <tr>	
											    <td colspan="3" class="text" style="background-color: #ededcd; text-align: center;">
												    <img id="PatchImage" alt="Patch Image" width="202" height="202" title="Air Force Safety Patch" class="print" src="images/patches/Default.jpg" />
                                                    <br />
                                                    <div id ="DivUsers">
                                                        AHAS users online =
                                                    </div>
												</td>
										    </tr>
										    <%--<tr>	
											    <td colspan="3" class="text" style="background-color: #ededcd; text-indent: 5pt; text-align: center;">
												        
											    </td>
										    </tr>
										    <tr>
										        <td colspan="3" id="images" style="background-color: #ededcd; text-indent: 5pt; text-align: center;">
										                
										        </td>
										    </tr>--%>
									    </tbody>
								    </table>
							    </td>
						    </tr>
					    </table>
					    <br />  
			        </td>

                    <td style="margin-left: 2px; margin-right: 2px; text-align: left; vertical-align: top; text-align:left;">
			            <input name="Printer Friendly button" id="btnPrint" title="Printer Friendly button" runat="server" value="Printer Friendly" onclick="PrintIt(hiddenM.value, hiddenD.value, hiddenH.value, hiddenType.value, hiddenID.value)" onkeypress="PrintIt(hiddenM.value,hiddenD.value,hiddenH.value,hiddenType.value,hiddenID.value)" style="cursor: pointer; color: blue; border-top-style: none; border-right-style: none; border-left-style: none; background-color: transparent; border-bottom-style: none" />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>&nbsp;<div id="Print" class="print">
			            <div id = "Div1" font-family: 'Times New Roman';"></div>
                        <div id = "ResultTable">
                            <table id="table1" style="border-style:solid; border-color:Black; border-width:1px; font-family:Verdana; font-size:small; color:#404040; font-weight:bold; width:auto;">
                                <tr style="vertical-align: top; text-align: center;">
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">SEGMENT</td>
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">DateTime</td>
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">NEXRAD</td>
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">BASED ON</td>
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">Height<%--<br />--%>(100ft AGL)</td>
                                    <td style="color: white; background-color: #344551; border-right: black thin double; border-top: black thin double; border-left: black thin double; border-bottom: black thin double;">AHAS RISK</td>
                                </tr>
                            </table>
                        </div>
                        <br />                                
                        <div id="Chart24" runat="server" style="text-align:center; float:left; left: auto;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                <ContentTemplate>
                                    <asp:Chart ID="Chart1"  runat="server" DataSourceID="ds1" Height="300px" Width="635px" Visible="False">
                                        <Series>
                                            <asp:Series ChartType="Line" Color="Gray" Legend="Legend1" 
                                                LegendText="Previous Day" Name="Yesterday" ToolTip="#VALY{G}" XValueMember="hour" 
                                                YValueMembers="Risk1">
                                            </asp:Series>
                                            <asp:Series ChartArea="ChartArea1" ChartType="Line" 
                                                Color="Black" Legend="Legend1" LegendText="Selected Day" Name="Today" 
                                                ToolTip="#VALY{G}" XValueMember="hour" YValueMembers="Risk2">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea BackColor="Silver" BackGradientStyle="TopBottom" Name="ChartArea1">
                                                <AxisY Maximum="50" Title="Probability * Severity" 
                                                    TitleFont="Microsoft Sans Serif, 8pt">
                                                    <MajorGrid LineColor="Gainsboro" />
                                                    <StripLines>
                                                        <asp:StripLine BorderColor="Green" BorderWidth="2" Interval="26.0206" 
                                                            Text="MODERATE" />
                                                        <asp:StripLine BorderColor="Red" BorderWidth="2" Interval="37.7815" 
                                                            Text="SEVERE" />
                                                    </StripLines>
                                                </AxisY>
                                                <AxisX Minimum="0" Title="Time of Day" 
                                                    TitleFont="Microsoft Sans Serif, 8pt, style=Bold">
                                                    <MajorGrid LineColor="Gainsboro" />
                                                </AxisX>
                                                <Area3DStyle Enable3D="False" />
                                            </asp:ChartArea>
                                        </ChartAreas>
                                        <Legends>
                                            <asp:Legend Docking="Bottom" Name="Legend1">
                                            </asp:Legend>
                                        </Legends>
                                    </asp:Chart>                                            
                                    <asp:SqlDataSource ID="ds1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ARCHIVEConnectionString %>" 
                                        SelectCommand="spAHAS24Log10" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="" Name="Route" SessionField="Area" 
                                                Type="String" />
                                            <asp:SessionParameter DefaultValue="" Name="Month" SessionField="Mon" 
                                                Type="Int32" />
                                            <asp:SessionParameter DefaultValue="" Name="Day1" SessionField="YDay" 
                                                Type="Int32" />
                                            <asp:SessionParameter DefaultValue="" Name="Day2" SessionField="TDay" 
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> 
                                    <br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    <br /> 
                                    <br /> 
                                    <br /> 
                                    <br /> 
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnShowChart" runat="server" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel> 
                                                              
                        </div> 
                                                           
                        <div id = "alts" style="text-align:left; visibility:hidden;">
                            <b>Alternate Routes:<input class="altroutes" id="alt1" type="button" value="Alt1" onkeypress="NewArea(1);" onclick="NewArea(1);"/><input class="altroutes" id="alt2" type="button" value="Alt2" onkeypress="NewArea(2);" onclick="NewArea(2);"/><input class="altroutes" id="alt3" type="button" value="Alt3" onkeypress="NewArea(3);" onclick="NewArea(3);"/><input class="altroutes" id="alt4" type="button" value="Alt4" onkeypress="NewArea(4);" onclick="NewArea(4);"/><input class="altroutes" id="alt5" type="button" value="Alt5" onkeypress="NewArea(5);" onclick="NewArea(5);"/></b>
                        </div>
                        <div id = "hazards" style="text-align:left; font-family: 'Times New Roman';">
                            <div id='hazardText' style="text-align:left; font-family: 'Times New Roman';"> 
                            <%--<a id='hazardText' target='_blank'> --%>
                            <b><span class="text">Feb 19th 2014</span></b><br />
                            <span class="text"><strong>
                            NEW Google Map button replaces the old "MAP(BAM)" button<br />
                            </strong></span>
                            The new Google Map page provides the same information as the old map, in a more user friendly format.
                            <br /><br />
                            <b><span class="text">Mar 7th 2014</span></b><br />
                            <span class="text"><strong>
                            Google Earth<br />
                            </strong></span>
                            Google Earth can be used by Air Force units as long as they connect to the NGA instance of the globe.  You can download Google Earth at: <br />
                            <a href="https://home.gvs.nga.mil/home/google-earth">https://home.gvs.nga.mil/home/google-earth</a>
                                        
                            </div><br />
                            <a id='dams'> </a><br /><br />
                            <a id='landfills'> </a>
                            <br /><br />
                            <a id='golf'> </a><br /><br />
                            <a id='strikes'> </a><br />
                            <br />
                        </div> 
			        </td>
                </tr>
		        <tr>
		            <td colspan="2">
		                <b>Warning:</b>The Avian Hazard Advisory System (AHAS) was constructed with the best available geospatial bird data to reduce the risk of bird collisions with aircraft. Its use for flight planning can reduce the likelihood of a bird collision but will not eliminate the risk. The AHAS organizations are not liable for losses incurred as a result of bird strikes.
		                <br /><br />
			            <img alt='Air Force, BASH, Air National Guard, FAA Patches' 
                            src='images/af_bash_faa.gif' width="360" height="78"
                            title='Air Force, BASH, Air National Guard, FAA Logos' /><br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="http://dodcio.defense.gov/DoDSection508/Std_Stmt.aspx" 
                            ToolTip="Section 508 Info" Font-Size="Smaller">The U.S. Department of Defense is committed to making its electronic and Information technologies accessible to individuals with disabilities in accordance with Section 508 of the Rehabilitation Act (29 U.S.C. § 794d), as amended in 1999. Send feedback or concerns related to the accessibility of this website to: DoDSection508@osd.mil. For more information about Section 508, please visit the DoD Section 508 website.</asp:HyperLink><br /><br /><br /><br /><br />   
                                
                            <asp:HyperLink ID="dodlinks" runat="server" NavigateUrl="~/about/DODlinks.aspx" ToolTip="DoD Website Links" Font-Size="Smaller">DOD Website Links</asp:HyperLink>                 
		            </td>
		        </tr>
            </tbody>
        </table>
        <a class="testtext" href="home/search.aspx">sear<asp:Button ID="btnShowChart" runat="server" BackColor="#273B53" ForeColor="#273B53" Height="16px" Text="Button" Width="41px" /></a> 
    </form>

    <script>
        var ahas = $.connection.ahasHub;
        $.connection.hub.logging = true
        //alert("logging");

        ahas.client.broadcastMessage = function (id, msg) {
            //broadcastMessage fires every time the sql database is updated
            //then SignalR uploads the data to the web page.
            //alert(id);
            SignalR(msg);
        };

        $.connection.hub.start().done(function () {
            //whenever the web page is opened
            //the user joins the hub
            //and executes the send sub.
            ahas.server.send();
        });

        ahas.client.log = function (message) {
            //log event 
        };
        ahas.client.showUsersOnLine = function (data) {
            //showUsersOnLine event 
            var e = document.getElementById("DivUsers");
            e.innerHTML = "AHAS users online = " + data;
        };

        function SignalR(msg) {
            //alert("signalR " + msg);
            var e = document.getElementById("area");
            var sA = e.options[e.selectedIndex].value;

            e = document.getElementById("lstMonth");
            var sM = e.options[e.selectedIndex].value;

            e = document.getElementById("lstDay");
            var sD = e.options[e.selectedIndex].value;

            e = document.getElementById("lstHour");
            var sH = e.options[e.selectedIndex].value;
            
            var dtNow = new Date();
            var dtNowMonthNo = dtNow.getMonth() + 1
            var dtNowMonth = GetMonthName(dtNow.getMonth() + 1);
            var dtNowDay = dtNow.getDate();
            var dtNowHour = dtNow.getHours();
            var selectedHour = document.getElementById("lstHour");
            var selectedDay = document.getElementById("lstDay");
            var selectedMonth = document.getElementById("lstMonth");

            //alert('month' + sM + dtNowMonth + ' day' + sD + dtNowDay + ' hour' + sH + dtNowHour)
            if (sH == 23 && dtNowHour == 0) {
                //advance selected hour, day and month 
                selectedMonth.selectedIndex = dtNowMonthNo;
                selectedDay.selectedIndex = dtNowDay;
                selectedHour.selectedIndex = 0;
            }
            else if (sM == dtNowMonth && sD == dtNowDay && (+sH + +1) == dtNowHour) {
                //advance selected hour to the next hour.
                selectedHour.selectedIndex = +sH + +2;
                //loadXMLDoc();
            }
            else {
                //alert("nope" + sA + ',' + sM + ',' + sD + ',' + sH);
            }

            loadXMLDoc();
        }
    </script>  

    <script>
        //all of the ahas scripts?
        var ICAO = [];
        var ICAO2 = [];
        var VR = [];
        var SR = [];
        var IR = [];
        var MilAir = [];
        var Range = [];
        var MOA = [];
        var AA = [];
        var Unit = [];
        var Unit2 = [];
        var ListString = document.getElementById('hiddenVR').value;
        VR = ListString.split("*");
        ListString = document.getElementById('hiddenIR').value;
        IR = ListString.split("*");
        ListString = document.getElementById('hiddenSR').value;
        SR = ListString.split("*");
        ListString = document.getElementById('hiddenMOA').value;
        MOA = ListString.split("*");
        ListString = document.getElementById('hiddenMILAIR').value;
        MilAir = ListString.split("*");
        ListString = document.getElementById('hiddenRANGE').value;
        Range = ListString.split("*");
        ListString = document.getElementById('hiddenAA').value;
        AA = ListString.split("*");
        ListString = document.getElementById('hiddenUNIT').value;
        Unit = ListString.split("*");
        ListString = document.getElementById('hiddenUNIT2').value;
        Unit2 = ListString.split("*");
        ListString = document.getElementById('hiddenICAO1').value;
        ICAO = ListString.split("*");
        ListString = document.getElementById('hiddenICAO2').value;
        ICAO2 = ListString.split("*");

        var valt1;
        var valt2;
        var valt3;
        var valt4;
        var valt5;
        
        var sType = document.getElementById('hiddenType').value;
        //alert("type=" + sType);
        reLoad(sType);

        var sID = document.getElementById('hiddenID').value;
        var sAreaValue = document.getElementById('area');
        //alert("id=" + sID);
        sAreaValue.value = sID;
        //alert("id=" + sAreaValue.value);

        //if there is a query string
        //runit
        var results = window.location.href;  //get string
        var posn = results.indexOf("%20");   //find first %20
        while (posn > -1)                    //while there is a %20
        {
            results = results.substring(0, posn) + " " + results.substring(posn + 3);
            posn = results.indexOf("%20");       //find next %20
        };

        //alert(results);
        var hashes = results.slice(results.indexOf('?') + 1).split('&');
        if (hashes.length > 1) {
            //alert("query");
            loadXMLDoc();
        }

        //AHAS functions
        function loadXMLDoc() {
            
            document.getElementById("Div1").innerHTML = "<font color='red'>PLEASE WAIT WHILE THE DATA LOADS</font>";
            document.getElementById('table1').style.visibility = "visible";
            document.getElementById('dams').innerHTML = "";
            document.getElementById('landfills').innerHTML = "";
            document.getElementById('golf').innerHTML = "";
            document.getElementById('strikes').innerHTML = "";
            document.getElementById('hazardText').innerHTML = "";

            var e = document.getElementById("area");
            var sArea = e.options[e.selectedIndex].value;
            //alert("new data" + sArea);

            var eM = document.getElementById("lstMonth");
            var iMonth = GetMonthNumber(eM.options[eM.selectedIndex].value);
            var sMonth = eM.options[eM.selectedIndex].value

            eD = document.getElementById("lstDay");
            var iDay = eD.options[eD.selectedIndex].value;

            eH = document.getElementById("lstHour");
            var iHour = eH.options[eH.selectedIndex].value;

            var IP = 123;

            var sArea2;

            sType = document.getElementById('hiddenType').value;
            var nocacheurl;

            //alert(sArea+iMonth+iDay+iHour);
            //Now I just need to get the wcf service instead of the web service
            if (sArea == "") {
                alert("Please Select an Area")
            }
            else {
                sPicture = document.getElementById('PatchImage'); //this line is good
                sArea2 = sArea.replace(/\s+/g, "");
                //wcfpara = "Area=" + sArea2 + "&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;

                if (stype == 'Unit' || stype == 'Unit2' || sArea2 == 'UTTR' || sArea2 == 'NTTR') {
                    sPicture.src = "images/patches/" + sArea2 + ".jpg";
                    sPicture.title = sArea2 + " unit patch";

                    //wcfurl = "http://www.usahas.com/wcf/service1.svc/GetUNITRisk";
                    nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetUNITRisk?IP='" + IP + "'&Area='" + sArea2 + "'&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;
                    //alert(nocacheurl);
                }
                else {
                    sPicture.src = "images/patches/default.jpg";
                    sPicture.title = "Air Force Safety Patch";

                    //wcfurl = "http://www.usahas.com/wcf/service1.svc/GetAHASRisk";
                    //wcfurl = "http://www.usahas.com/wcf/service1.svc/GetAHASRiskXML?Area='" + sArea + "'&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;
                    nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetAHASRisk?IP='" + IP + "'&Area='" + sArea + "'&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;
                }
            }
            
            AddImages(sArea2);

            //start of new wcf code
            //$(document).ready(function () {
            //    //Calling WCF Service using jQuery ajax method
            //    $.ajax({
            //        type: "GET",
            //        async: "false",
            //        url: wcfurl,
            //        data: wcfpara,
            //        contentType: "application/json; charset=utf-8",
            //        //contentType: "text/xml; charset=utf-8", //post only likes this, get likes both, either way, still get the bad request error.
            //        dataType: "json",
            //        processData: true,
            //        success: function (result) {
            //            AjaxSucceeded(result);

            //            //parse the json string
            //            //var obj = json.parse(result);


            //        },
            //        error: AjaxFailed
            //    });

            //    //Additional way of calling WCF service using getJSON() JQuery method
            //    //$.getJSON(wcfurl + '?' + wcfpara, {},
            //	//	function (data) {
            //	//	    alert(data);
            //	//	});
            //});

            ////End of new wcf code  

            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    //var x=xmlDoc.childNodes;  //comes up with 1
                    var x = xmlDoc.getElementsByTagName("Table");  //This works, it finds the 240 table "nodes"
                    //alert("count"+x.length);

                    ClearRows();
                    if (stype == 'MilAir' || stype == 'ICAO') {
                        document.getElementById("Div1").innerHTML = "<b><font color='#344551'>AHAS RISK FOR " + sArea + "</font></b><br /><font color='#FF0000'><strong>AHAS SHALL NOT BE USED TO DETERMINE BWC ON THE AIRFIELD<br />USE THE AHAS RISK FIELD TO DETERMINE RISK</strong></font>";
                    }
                    else {
                        document.getElementById("Div1").innerHTML = "<b><font color='#344551'>AHAS RISK FOR " + sArea + "</font></b><br /><font color='#FF0000'><strong>USE THE AHAS RISK FIELD TO DETERMINE RISK</strong></font>";
                    }

                    var tbl = document.getElementById('table1');
                    //                if(tbl.rows.length)>0)
                    //                {
                    tbl.deleteRow(0)
                    //                }                           
                    //                var lastRow = tbl.rows.length;
                    //                var iteration = lastRow;
                    var row; // = tbl.insertRow(lastRow); 
                    var Bgcolor = "#EDEDCD";
                    var Border = "nada";

                    var sLastRoute = 'empty1';
                    var sRoute = 'empty';

                    var iteration = 0;

                    for (i = 0; i < x.length; i++) {
                        sRoute = (x[i].getElementsByTagName("Route")[0].childNodes[0].nodeValue);
                        var sName = (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue);
                        var sDate = (x[i].getElementsByTagName("DateTime")[0].childNodes[0].nodeValue);
                        var sNEXRAD = (x[i].getElementsByTagName("NEXRADRISK")[0].childNodes[0].nodeValue);
                        var sSOAR = (x[i].getElementsByTagName("SOARRISK")[0].childNodes[0].nodeValue);
                        var sAHAS = (x[i].getElementsByTagName("AHASRISK")[0].childNodes[0].nodeValue);
                        var sBased = (x[i].getElementsByTagName("BasedON")[0].childNodes[0].nodeValue);
                        var sHeight = (x[i].getElementsByTagName("TIDepth")[0].childNodes[0].nodeValue);

                        if (Bgcolor == "#EDEDCD") Bgcolor = "#cccc99";
                        else
                            if (Bgcolor == "#cccc99") Bgcolor = "#EDEDCD";

                        if (sRoute !== sLastRoute && stype == 'Unit2' || sRoute !== sLastRoute && stype == 'Unit' || stype !== 'Unit' && i == 0) {
                            //Border="set";
                            Bgcolor == "#344551";
                            row = tbl.insertRow(iteration);
                            row.style.backgroundColor = "#344551";
                            row.style.color = 'white';
                            var head1 = row.insertCell(0)
                            head1.colSpan = "6";
                            var headNode = document.createTextNode(sRoute);
                            head1.appendChild(headNode);

                            iteration = iteration + 1;

                            row = tbl.insertRow(iteration);
                            row.style.backgroundColor = "#344551";
                            row.style.color = 'white';
                            head1 = row.insertCell(0)
                            headNode = document.createTextNode("SEGMENT");
                            head1.appendChild(headNode);

                            head1 = row.insertCell(1)
                            headNode = document.createTextNode("DateTime");
                            head1.appendChild(headNode);

                            head1 = row.insertCell(2)
                            headNode = document.createTextNode("NEXRAD");
                            head1.appendChild(headNode);

                            head1 = row.insertCell(3)
                            headNode = document.createTextNode("BASED ON");
                            head1.appendChild(headNode);

                            head1 = row.insertCell(4)
                            headNode = document.createTextNode("HEIGHT (Ft AGL)");
                            head1.appendChild(headNode);

                            head1 = row.insertCell(5)
                            head1.style.color = 'red'
                            headNode = document.createTextNode("AHAS RISK");
                            head1.appendChild(headNode);

                            iteration = iteration + 1;
                            Bgcolor = "#EDEDCD";
                        }

                        row = tbl.insertRow(iteration);
                        row.style.backgroundColor = Bgcolor;

                        /////////////////
                        // 1 cell SEGMENT 
                        var cell1 = row.insertCell(0);
                        //if(Border == "set")cell1.style.borderTop="solid #344551 20px";
                        var textNode = document.createTextNode(sName);  //somehow we can get the xml into this variable
                        cell1.appendChild(textNode);

                        // 2 cell DATE/TIME
                        //var sDate = new date(x[i].getElementsByTagName("Date_Z")[0].childNodes[0].nodeValue);
                        var dDate;
                        var sDateSplit = sDate.split("-");
                        var sDateYear = sDateSplit[0]; //sDate.substr(0,4);
                        var sDateMonth = sDateSplit[1]; //sDate.substr(5,2);
                        var sDateDay = sDateSplit[2]; //sDate.substr(8,2);
                        var sDateTime = sDateDay.substr(2, 8); //sDate.substr(11,8);
                        sDateDay = sDateDay.substr(0, 2);
                        if (sDateMonth.length == 1) sDateMonth = "0" + sDateMonth;
                        if (sDateDay.length == 1) sDateDay = "0" + sDateDay;

                        if (sNEXRAD !== "NO DATA") {
                            dDate = sDateYear + '/' + sDateMonth + '/' + sDateDay + ' ' + sDateTime + 'Z';
                            //                           alert(sDate+'*'+(x[i].getElementsByTagName("Date_Z")[0].childNodes[0].nodeValue));                    
                        }
                        else {
                            var sHourTemp = iHour;
                            if (iHour <= 9) sHourTemp = "0" + iHour;
                            dDate = sDateYear + '/' + sDateMonth + '/' + sDateDay + ' ' + sHourTemp + 'Z';
                        }

                        var cell2 = row.insertCell(1);
                        //if(Border == "set")cell2.style.borderTop="solid #344551 20px";
                        var textNode = document.createTextNode(dDate);
                        cell2.appendChild(textNode);

                        // 3 cell NEXRAD RISK
                        var cell3 = row.insertCell(2);
                        //if(Border == "set")cell3.style.borderTop="solid #344551 20px";
                        var textNode = document.createTextNode(sNEXRAD);
                        cell3.appendChild(textNode);

                        // 4 cell BASED ON
                        var cell4 = row.insertCell(3);
                        //if(Border == "set")cell5.style.borderTop="solid #344551 20px";
                        var textNode = document.createTextNode(sBased);
                        cell4.appendChild(textNode);

                        // 5 cell HEIGHT
                        var cell5 = row.insertCell(4);
                        //if(Border == "set")cell6.style.borderTop="solid #344551 20px";
                        if (isNaN(sHeight)) {
                            //do nothing
                        }
                        else {
                            //divide by 100
                            sHeight = parseInt(sHeight); // / 100;
                        }
                        if (sBased == 'NEXRAD' || sBased == 'BAM') {
                            if (sSOAR == 'NO DATA') {
                                sHeight = 'NO DATA';
                            }
                            else {
                                sHeight = 'NA';
                            }
                        }

                        var textNode = document.createTextNode(sHeight);
                        cell5.appendChild(textNode);

                        // 6 cell AHAS RISK
                        var cell6 = row.insertCell(5);
                        var cell6Color;
                        if (sAHAS.toUpperCase() == 'LOW') {
                            cell6Color = 'green';
                        }
                        else if (sAHAS.toUpperCase() == 'MODERATE') {
                            cell6Color = 'yellow';
                        }
                        else {
                            cell6Color = 'red';
                        }
                        cell6.style.backgroundColor = cell6Color;
                        var textNode = document.createTextNode(sAHAS);
                        cell6.appendChild(textNode);

                        sLastRoute = sRoute;
                        iteration = iteration + 1;

                    } //end for

                    //alert(stype);
                    var ele = document.getElementById("alts");
                    if (sType == 'IR' || sType == 'SR' || sType == 'VR') {
                        valt1 = (x[1].getElementsByTagName("Alt1")[0].childNodes[0].nodeValue);
                        valt2 = (x[1].getElementsByTagName("Alt2")[0].childNodes[0].nodeValue);
                        valt3 = (x[1].getElementsByTagName("Alt3")[0].childNodes[0].nodeValue);
                        valt4 = (x[1].getElementsByTagName("Alt4")[0].childNodes[0].nodeValue);
                        valt5 = (x[1].getElementsByTagName("Alt5")[0].childNodes[0].nodeValue);

                        if (ele.style.visibility == "hidden") {
                            ele.style.visibility = "visible";
                        }

                        //document.getElementById('alt1').innerHTML = valt1;
                        //document.getElementById('alt2').innerHTML = valt2;
                        //document.getElementById('alt3').innerHTML = valt3;
                        //document.getElementById('alt4').innerHTML = valt4;
                        //document.getElementById('alt5').innerHTML = valt5;

                        //alert(valt1);
                        document.getElementById('alt1').value = valt1;
                        document.getElementById('alt2').value = valt2;
                        document.getElementById('alt3').value = valt3;
                        document.getElementById('alt4').value = valt4;
                        document.getElementById('alt5').value = valt5;
                    }
                    else {
                        if (ele.style.visibility == "visible") {
                            ele.style.visibility = "hidden";
                        }
                    }
                } //end if
                else {
                    document.getElementById("Div1").innerHTML = "<font color='red'>PLEASE WAIT WHILE THE DATA LOADS</font>";
                } //end else
            }

            if (!xmlhttp) {
                alert("Error creating the XMLHttpRequest object.");
            }
            xmlhttp.send(null);

            var ele2 = document.getElementById("hazards");
            if (stype == 'Unit' || stype == 'Unit2') {
                document.getElementById("hazardText").innerHTML = "";
                ele2.style.visibility == "hidden"
                //ele2.innerHTML= "Not Available with Unit option";
            }
            else {
                document.getElementById('hazardText').innerHTML = "<b><u>HAZARDS</u></b>";
                LoadDAMS(sArea);
                LoadLANDFILLS(sArea);
                LoadGOLF(sArea);
                LoadStrikes(sArea);

                if (ele2.style.visibility == "hidden") {
                    ele2.style.visibility = "visible";
                }
            }
            //simulate click of button for firing chart event and show or hide the DIV holding the chart if checkbox is checked
            if (stype == "Unit" | stype == "Unit2") {
                document.getElementById("chkChart").checked = 0;
                document.getElementById("Chart24").style.display = "none";
            }
            else {
                
                if (document.getElementById("chkChart").checked) {
                    //var chDisplay = document.getElementById("Chart1");
                    ////create a date based on the month and day
                    ////then subtract a day
                    //var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                    //"Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                    //var dY = new Date();
                    //var sYear = dY.getFullYear();
                    //var dtReq = new Date(sYear, (+iMonth - +1), iDay);
                    //var dtBefore = new Date();
                    //dtBefore.setDate(dtReq.getDate() - 1);
                    //alert("checked");
                    //document.getElementById("Label7").innerHTML = "Previous Day= " + monthNames[+iMonth - +1] + " " + dtBefore.getDate() + ", " + "Selected Day= " + sMonth + " " + iDay
                    document.getElementById('<%=btnShowChart.ClientID%>').click();
                    document.getElementById("Chart24").style.display = "inline";
                    //alert("checked");
                    
                                  
                }
                else {
                    //alert("not checked");
                    document.getElementById("Chart24").style.display = "none";
                }
            }

        } //end of loadxml function

        function NewArea(sArea) {
            //set the route
            var sNew;
            switch (sArea) {
                case 1:
                    sNew = valt1;
                    break;
                case 2:
                    sNew = valt2;
                    break;
                case 3:
                    sNew = valt3;
                    break;
                case 4:
                    sNew = valt4;
                    break;
                case 5:
                    sNew = valt5;
                    break;
            }

            //set the flying area to the new route
            //alert("setit" + sNew);
            var sArea = document.getElementById('area');
            sArea.value = sNew;
            loadXMLDoc();
        }

        function LoadDAMS(sArea) {
            var nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetDAMS?Area='" + sArea + "'";
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                //gets in here
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    var x = xmlDoc.getElementsByTagName("Table");  //This works, it finds the 240 table "nodes"

                    var sDAMS = "<b>DAMS:</b><br />";

                    if (x.length > 0) {
                        for (i = 0; i < x.length; i++) {
                            if (i > 0) sDAMS = sDAMS + "<br />";
                            sDAMS = sDAMS + (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue) + ': ' + (x[i].getElementsByTagName("DAM_NAME")[0].childNodes[0].nodeValue);
                        } //end for
                    }
                    else {
                        sDAMS = sDAMS + "NONE"
                    }
                } //end if

                //Assign values
                document.getElementById('dams').innerHTML = sDAMS;
            }

            var ele = document.getElementById("dams");
            if (ele.style.visibility == "hidden") {
                ele.style.visibility = "visible";
            }
        }

        function LoadLANDFILLS(sArea) {
            var nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetLANDFILLS?Area='" + sArea + "'";
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                //gets in here
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    var x = xmlDoc.getElementsByTagName("Table");  //This works, it finds the 240 table "nodes"
                    var sDAMS = "<b>LANDFILLS:</b><br />";

                    if (x.length > 0) {
                        for (i = 0; i < x.length; i++) {
                            if (i > 0) sDAMS = sDAMS + "<br />";
                            sDAMS = sDAMS + (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue) + ': ' + (x[i].getElementsByTagName("NAME")[0].childNodes[0].nodeValue);
                        } //end for
                    }
                    else {
                        sDAMS = sDAMS + "NONE"
                    }

                } //end if

                //Assign values
                document.getElementById('landfills').innerHTML = sDAMS;
            }

            var ele = document.getElementById("landfills");
            if (ele.style.visibility == "hidden") {
                ele.style.visibility = "visible";
            }
        }

        function LoadGOLF(sArea) {
            var nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetGOLF?Area='" + sArea + "'";
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                //gets in here
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    var x = xmlDoc.getElementsByTagName("Table");  //This works, it finds the 240 table "nodes"
                    var sGOLF = "<b>GOLF COURSES:</b><br />";

                    if (x.length > 0) {
                        for (i = 0; i < x.length; i++) {
                            if (i > 0) sGOLF = sGOLF + "<br />";
                            sGOLF = sGOLF + (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue) + ': ' + (x[i].getElementsByTagName("NAME")[0].childNodes[0].nodeValue);
                        } //end for
                    }
                    else {
                        sGOLF = sGOLF + "NONE"
                    }
                } //end if

                //Assign values
                document.getElementById('golf').innerHTML = sGOLF;
            }

            var ele = document.getElementById("golf");
            if (ele.style.visibility == "hidden") {
                ele.style.visibility = "visible";
            }
            //        xmlhttp.send(null);  
        }

        function LoadStrikes(sArea) {
            //var nocacheurl = "/webservices/AHAS.asmx/GetSTRIKES?Area='" + sArea + "'";
            var nocacheurl = "http://www.usahas.com/webservices/AHAS.asmx/GetSTRIKES?Area='" + sArea + "'";
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                //gets in here
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }


            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    var x = xmlDoc.getElementsByTagName("Table");  //This works, it finds the 240 table "nodes"
                    var sStrike = "<b>BIRD STRIKES:</b><br />";
                    var dDate;

                    if (x.length > 0) {
                        for (i = 0; i < x.length; i++) {
                            if (i > 0) sStrike = sStrike + "<br />";

                            sStrike = sStrike + (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue) + ': ';

                            try {
                                var sDate = (x[i].getElementsByTagName("Date_")[0].childNodes[0].nodeValue);
                                var sDateSplit = sDate.split("-");

                                var sDateYear = sDateSplit[0]; //sDate.substr(0,4);
                                var sDateMonth = sDateSplit[1]; //sDate.substr(5,2);
                                var sDateDay = sDateSplit[2]; //sDate.substr(8,2);
                                var sDateTime = sDateDay.substr(2, 8); //sDate.substr(11,8);
                                sDateDay = sDateDay.substr(0, 2);
                                if (sDateMonth.length == 1) sDateMonth = "0" + sDateMonth;
                                if (sDateDay.length == 1) sDateDay = "0" + sDateDay;

                                dDate = sDateYear + '/' + sDateMonth + '/' + sDateDay;
                            }
                            catch (err) {
                                dDate = 'Unknown'
                            }

                            sStrike = sStrike + dDate;

                            try {
                                sStrike = sStrike + ', Class=' + (x[i].getElementsByTagName("Class")[0].childNodes[0].nodeValue) + ' ';
                            }
                            catch (err) {
                            }

                            try {
                                var sSpecies = (x[i].getElementsByTagName("common_nam")[0].childNodes[0].nodeValue)
                                sStrike = sStrike + ', Species=' + sSpecies.toUpperCase() + ' ';
                            }
                            catch (err) {
                            }

                        } //end for
                    }
                    else {
                        sStrike = sStrike + "NONE"
                    }
                } //end if

                //Assign values
                document.getElementById('strikes').innerHTML = sStrike;
            }

            var ele = document.getElementById('strikes');
            if (ele.style.visibility == "hidden") {
                ele.style.visibility = "visible";
            }
            //        xmlhttp.send(null);  
        }

        function ClearRows() {
            var tbl = document.getElementById('table1');
            var tblRows = tbl.rows.length;
            for (i = tblRows; i >= 2; i--) {
                tbl.deleteRow(i - 1);
            }
            document.getElementById("Div1").innerHTML = "CLEARING DATA";
        } //end of ClearRows

        function getValue(C) {
            var val = '';
            if (C.length == 0) val = 'null';
            if (C.length > 0) val = C;
            return val;
        } //end of getValue

        function AddImages(sUnit) {
            try {
                //need to clear out the old images.
                //alert(sUnit);
                document.getElementById('images').innerHTML = "";
                sUnit = sUnit.replace(",", "");
                var sFuncName = 'U_' + sUnit;  //function name without the ()
                var sFunc = 'U_' + sUnit + '()'; //function name with the ()

                //if (sFuncName == 'U_109thAW') {
                //    alert('109th' + " " + sFunc)
                //}

                if (sFuncName) {
                    eval(sFunc);  //this will execute the variable function name
                    //if (sFuncName == 'U_109thAW') {
                    //    alert('109th' + " " + sFunc)
                    //}
                }
            }
            catch (err) {
                //alert("Load Image ERROR"+err);
            }
        }

        function GetMonthNumber(iM) {
            var mName;
            switch (iM) {
                case "Jan":
                    mName = 1;
                    break;
                case "Feb":
                    mName = 2;
                    break;
                case "Mar":
                    mName = 3;
                    break;
                case "Apr":
                    mName = 4;
                    break;
                case "May":
                    mName = 5;
                    break;
                case "Jun":
                    mName = 6;
                    break;
                case "Jul":
                    mName = 7;
                    break;
                case "Aug":
                    mName = 8;
                    break;
                case "Sep":
                    mName = 9;
                    break;
                case "Oct":
                    mName = 10;
                    break;
                case "Nov":
                    mName = 11;
                    break;
                case "Dec":
                    mName = 12;
                    break;
            }
            return mName;
        }

        function GetMonthName(iM) {
            var mName;
            switch (iM) {
                case 1:
                    mName = "Jan";
                    break;
                case 2:
                    mName = "Feb";
                    break;
                case 3:
                    mName = "Mar";
                    break;
                case 4:
                    mName = "Apr";
                    break;
                case 5:
                    mName = "May";
                    break;
                case 6:
                    mName = "Jun";
                    break;
                case 7:
                    mName = "Jul";
                    break;
                case 8:
                    mName = "Aug";
                    break;
                case 9:
                    mName = "Sep";
                    break;
                case 10:
                    mName = "Oct";
                    break;
                case 11:
                    mName = "Nov";
                    break;
                case 12:
                    mName = "Dec";
                    break;
            }
            return mName;
        }

        function loadXMLDoc12() {
            ClearRows();
            var tbl = document.getElementById('table1');
            //tbl.deleteRow(0) 
            var ele = document.getElementById("alts");
            if (ele.style.visibility == "visible") {
                ele.style.visibility = "hidden";
            }

            if (tbl.style.visibility == "visible") {
                tbl.style.visibility = "hidden";
            }

            document.getElementById("Div1").innerHTML = "<font color='red'>PLEASE WAIT WHILE THE DATA LOADS</font>";
            //alert("hello" + document.getElementById('table1').style.visibility);

            document.getElementById('dams').innerHTML = "";
            document.getElementById('landfills').innerHTML = "";
            document.getElementById('golf').innerHTML = "";
            document.getElementById('strikes').innerHTML = "";
            document.getElementById('hazardText').innerHTML = "";

            var e = document.getElementById("area");
            var sArea = e.options[e.selectedIndex].value;
            //alert("new data" + sArea);

            e = document.getElementById("lstMonth");
            var iMonth = GetMonthNumber(e.options[e.selectedIndex].value);

            e = document.getElementById("lstDay");
            var iDay = e.options[e.selectedIndex].value;

            e = document.getElementById("lstHour");
            var iHour = e.options[e.selectedIndex].value;

            var IP = 123;

            var sArea2;

            sType = document.getElementById('hiddenType').value;
            var nocacheurl;

            if (sArea == "") {
                alert("Please Select an Area")
            }
            else {
                sPicture = document.getElementById('PatchImage'); //this line is good
                sArea2 = sArea.replace(/\s+/g, "");

                if (stype == 'Unit' || stype == 'Unit2' || sArea2 == 'UTTR' || sArea2 == 'NTTR') {
                    sPicture.src = "images/patches/" + sArea2 + ".jpg";
                    sPicture.title = sArea2 + " unit patch";

                    nocacheurl = "/webservices/AHAS.asmx/GetUNITRisk12?IP='" + IP + "'&Area='" + sArea2 + "'&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;
                }
                else {
                    sPicture.src = "images/patches/default.jpg";
                    sPicture.title = "Air Force Safety Patch";

                    nocacheurl = "/webservices/AHAS.asmx/GetAHASRisk12?IP='" + IP + "'&Area='" + sArea + "'&iMonth=" + iMonth + "&iDay=" + iDay + "&iHour=" + iHour;
                }
            }            

            AddImages(sArea2);

            var xmlhttp;
            var x;
            var tagname = "Table";
            var tagname;

            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.open("GET", nocacheurl, true); //change to true to display the data
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    //var x=xmlDoc.childNodes;  //comes up with 1
                    //create a loop where x iterates through the 12 tables
                    //starting with "Table" and ending with "Table11

                    //NEED TO REVERSE THIS, BECAUSE IT LOADS UP IN REVERSE
                    for (z = 11; z >= 0; z--) //chrome does not seem to advance z
                    {
                        //alert(z);
                        if (z == 0) {
                            x = xmlDoc.getElementsByTagName(tagname);  //This works, it finds the 240 table "nodes"
                        }
                        else {
                            tagname2 = tagname + z;
                            //alert(tagname2 + " " + z); 
                            //add a try catch here, wtf is so difficult about adding a number to this!!!!!!!!!!!!!!!!!!!!!!!!!!
                            x = xmlDoc.getElementsByTagName(tagname2);
                        }

                        //alert(tagname2 + " " + z);  //even firefox does not advance this.
                        //z=z+1 //try this on Friday

                        if (stype == 'MilAir' || stype == 'ICAO') {
                            document.getElementById("Div1").innerHTML = "<b><font color='#344551'>AHAS RISK FOR " + sArea + " 12 HOUR LOOKUP</font></b><br /><font color='#FF0000'><strong>AHAS SHALL NOT BE USED TO DETERMINE BWC ON THE AIRFIELD<br />USE THE AHAS RISK FIELD TO DETERMINE RISK</strong></font>";
                        }
                        else {
                            document.getElementById("Div1").innerHTML = "<b><font color='#344551'>AHAS RISK FOR " + sArea + " 12 HOUR LOOKUP</font></b><br /><font color='#FF0000'><strong>USE THE AHAS RISK FIELD TO DETERMINE RISK</strong></font>";
                        }

                        var row; // = tbl.insertRow(lastRow); 
                        var Bgcolor = "#EDEDCD";
                        var Border = "nada";

                        var sLastRoute = 'empty1';
                        var sRoute = 'empty';

                        var iteration = 0;

                        //alert("url " + nocacheurl + " length=" + x.length)
                        for (i = 0; i < x.length; i++) {
                            sRoute = (x[i].getElementsByTagName("Route")[0].childNodes[0].nodeValue);
                            var sName = (x[i].getElementsByTagName("Segment")[0].childNodes[0].nodeValue);
                            var sDate = (x[i].getElementsByTagName("DateTime")[0].childNodes[0].nodeValue);
                            var sNEXRAD = (x[i].getElementsByTagName("NEXRADRISK")[0].childNodes[0].nodeValue);
                            var sSOAR = (x[i].getElementsByTagName("SOARRISK")[0].childNodes[0].nodeValue);
                            var sAHAS = (x[i].getElementsByTagName("AHASRISK")[0].childNodes[0].nodeValue);
                            var sBased = (x[i].getElementsByTagName("BasedON")[0].childNodes[0].nodeValue);
                            var sHeight = (x[i].getElementsByTagName("TIDepth")[0].childNodes[0].nodeValue);

                            if (Bgcolor == "#EDEDCD") Bgcolor = "#cccc99";
                            else
                                if (Bgcolor == "#cccc99") Bgcolor = "#EDEDCD";

                            if (sRoute !== sLastRoute && stype == 'Unit2' || sRoute !== sLastRoute && stype == 'Unit' || stype !== 'Unit' && i == 0) {
                                //Border="set";
                                Bgcolor == "#344551";
                                row = tbl.insertRow(iteration);
                                row.style.backgroundColor = "#344551";
                                row.style.color = 'white';
                                var head1 = row.insertCell(0)
                                head1.colSpan = "6";
                                var headNode = document.createTextNode(sRoute);
                                head1.appendChild(headNode);

                                iteration = iteration + 1;

                                row = tbl.insertRow(iteration);
                                row.style.backgroundColor = "#344551";
                                row.style.color = 'white';
                                head1 = row.insertCell(0)
                                headNode = document.createTextNode("SEGMENT");
                                head1.appendChild(headNode);

                                head1 = row.insertCell(1)
                                headNode = document.createTextNode("DateTime");
                                head1.appendChild(headNode);

                                head1 = row.insertCell(2)
                                headNode = document.createTextNode("NEXRAD");
                                head1.appendChild(headNode);

                                head1 = row.insertCell(3)
                                headNode = document.createTextNode("BASED ON");
                                head1.appendChild(headNode);

                                head1 = row.insertCell(4)
                                headNode = document.createTextNode("HEIGHT (Ft AGL)");
                                head1.appendChild(headNode);

                                head1 = row.insertCell(5)
                                headNode = document.createTextNode("AHAS RISK");
                                head1.appendChild(headNode);

                                iteration = iteration + 1;
                                Bgcolor = "#EDEDCD";
                            }

                            row = tbl.insertRow(iteration);
                            row.style.backgroundColor = Bgcolor;

                            /////////////////
                            // 1 cell SEGMENT 
                            var cell1 = row.insertCell(0);
                            //if(Border == "set")cell1.style.borderTop="solid #344551 20px";
                            var textNode = document.createTextNode(sName);  //somehow we can get the xml into this variable
                            cell1.appendChild(textNode);

                            // 2 cell DATE/TIME
                            //var sDate = new date(x[i].getElementsByTagName("Date_Z")[0].childNodes[0].nodeValue);
                            var dDate;
                            var sDateSplit = sDate.split("-");
                            var sDateYear = sDateSplit[0]; //sDate.substr(0,4);
                            var sDateMonth = sDateSplit[1]; //sDate.substr(5,2);
                            var sDateDay = sDateSplit[2]; //sDate.substr(8,2);
                            var sDateTime = sDateDay.substr(2, 8); //sDate.substr(11,8);
                            sDateDay = sDateDay.substr(0, 2);
                            if (sDateMonth.length == 1) sDateMonth = "0" + sDateMonth;
                            if (sDateDay.length == 1) sDateDay = "0" + sDateDay;

                            if (sNEXRAD !== "NO DATA") {
                                dDate = sDateYear + '/' + sDateMonth + '/' + sDateDay + ' ' + sDateTime + 'Z';
                            }
                            else {
                                var sHourTemp = iHour;
                                if (iHour <= 9) sHourTemp = "0" + iHour;
                                dDate = sDateYear + '/' + sDateMonth + '/' + sDateDay + ' ' + sHourTemp + 'Z';
                            }

                            var cell2 = row.insertCell(1);
                            //if(Border == "set")cell2.style.borderTop="solid #344551 20px";
                            var textNode = document.createTextNode(dDate);
                            cell2.appendChild(textNode);

                            // 3 cell NEXRAD RISK
                            var cell3 = row.insertCell(2);
                            //if(Border == "set")cell3.style.borderTop="solid #344551 20px";
                            var textNode = document.createTextNode(sNEXRAD);
                            cell3.appendChild(textNode);

                            // 4 cell BASED ON
                            var cell4 = row.insertCell(3);
                            //if(Border == "set")cell5.style.borderTop="solid #344551 20px";
                            var textNode = document.createTextNode(sBased);
                            cell4.appendChild(textNode);

                            // 5 cell HEIGHT
                            var cell5 = row.insertCell(4);
                            //if(Border == "set")cell6.style.borderTop="solid #344551 20px";
                            if (isNaN(sHeight)) {
                                //do nothing
                            }
                            else {
                                //divide by 100
                                sHeight = parseInt(sHeight); // / 100;
                            }
                            if (sBased == 'NEXRAD' || sBased == 'BAM') {
                                if (sSOAR == 'NO DATA') {
                                    sHeight = 'NO DATA';
                                }
                                else {
                                    sHeight = 'NA';
                                }
                            }

                            var textNode = document.createTextNode(sHeight);
                            cell5.appendChild(textNode);

                            // 6 cell AHAS RISK
                            var cell6 = row.insertCell(5);
                            var cell6Color;
                            if (sAHAS.toUpperCase() == 'LOW') {
                                cell6Color = 'green';
                            }
                            else if (sAHAS.toUpperCase() == 'MODERATE') {
                                cell6Color = 'yellow';
                            }
                            else {
                                cell6Color = 'red';
                            }
                            cell6.style.backgroundColor = cell6Color;
                            var textNode = document.createTextNode(sAHAS);
                            cell6.appendChild(textNode);

                            sLastRoute = sRoute;
                            iteration = iteration + 1;

                        } //end for
                    } //end table for        
                    document.getElementById('table1').style.visibility = "visible";
                } //end if
                else {
                    document.getElementById("Div1").innerHTML = "<font color='red'>PLEASE WAIT WHILE THE DATA LOADS</font>";
                } //end else
            }

            if (!xmlhttp) {
                alert("Error creating the XMLHttpRequest object.");
            }
            xmlhttp.send(null);
            
        } //end of loadxml function 


        //function AjaxSucceeded(result) {
        //    alert(result);
        //}

        //function AjaxFailed(result) {
        //    alert('wtf' + result.status + ' ' + result.statusText);
        //}

    </script>

</body>
</html>
