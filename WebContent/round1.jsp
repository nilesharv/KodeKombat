<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="tcss.css">
		 <script type="text/javascript">
    // set minutes
    var mins = 25;
     
    // calculate the seconds (don't change this! unless time progresses at a different speed for you...)
    var secs = mins * 60;
    function countdown() {
    	setTimeout('Decrement()',1000);
    }
    function Decrement() {
    	if (document.getElementById) {
    		minutes = document.getElementById("minutes");
    		seconds = document.getElementById("seconds");
    		// if less than a minute remaining
    		if (seconds < 59) {
    			seconds.value = secs;
    		} else {
    			minutes.value = getminutes();
    			seconds.value = getseconds();
    		}
    		secs--;
    		setTimeout('Decrement()',1000);
    	}
    }
    function getminutes() {
    	// minutes is seconds divided by 60, rounded down
    	mins = Math.floor(secs / 60);
    	return mins;
    }
    function getseconds() {
    	// take mins remaining (as seconds) away from total seconds remaining
    	return secs-Math.round(mins *60);
    }
   
    window.onload=function(){
        var auto = setTimeout(function(){ autoRefresh(); }, 100);

        function submitform(){
          alert('Time up!!');
          document.forms["round1"].submit();
        }

        function autoRefresh(){
           clearTimeout(auto);
           auto = setTimeout(function(){ submitform(); autoRefresh(); }, 60000*mins);
        }
    }
</script>
	</head>
	<body >
		<div class=container>
		<% String str=(String)session.getAttribute("user");
							if(session.getAttribute("user")!=null)
							{
								out.print("login user: "+str);
								%>
								<br>
								<form method="post" action="logout.jsp">
								
								<input type="submit" value="logout" >
								</form>
								<%
							}
							else
							{
								response.sendRedirect("login.html");
							}
							
							
							
							Connection con;
							Map<String,Boolean> m=new HashMap<String,Boolean>();
							try
							{
						 		Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost/kodekombat","root","niyk");
							Statement st=con.createStatement();
							ResultSet result=st.executeQuery("select * from round");
							
							while(result.next())
							{
								m.put(result.getString(1),result.getBoolean(2));
								
							}
							
							if(m.get("round1")==null)
								response.sendRedirect("index.jsp");
								
							}catch(Exception ex)
							{
							}
				%>	
	<div id="timer">
    	This is only valid for the next <input id="minutes" type="text" style="width: 26px; border: none; background-color:none; font-size: 16px; font-weight: bold;"> minutes and <input id="seconds" type="text" style="width: 26px; border: none; background-color:none; font-size: 16px; font-weight: bold;"> seconds.
    </div>
    <script>
    countdown();
    </script>
			<div class=div1> 
				<img src="questions/logo.jpg" style="height:100%; object-fit: contain;">
				
				<img src="questions/logo.jpg" style="height:100% ; object-fit: contain; float: right;">
			</div>
			<div class=div2>
				<table width=100% >
				<tr>
					<td style="text-align: center;"><a href="round1.jsp" > <button class="btn" style="vertical-align:middle">  <span>ROUND1</span></button></a></td>
					<td style="text-align: center;"><a href="round2.jsp" ><button class="btn" style="vertical-align:middle"><span>ROUND2</span></button></a></td>
					<td style="text-align: center;"><a href="round3.jsp" ><button class="btn" style="vertical-align:middle"><span>ROUND3</span></button></a></td>
					</tr>
				</table>	
			</div>
			<div >
			<div class=div3>
				<ul >
					<li class="lis"><a href="#top"><font color="1D4861">SHARE YOUR BIT</font></a></li>
					<li class="lis"><a href="#middle"><font color="1D4861">LAST NAIL IN THE COFFIN</font></a></li>
					<li class="lis"><a href="#bottom"><font color="1D4861">DATA THAT</font></a></li>
				</ul>
			</div>
			<div class=div4>
			<form name='round1' method="post" action="round1a.jsp">
				<table class="t">
					<tr>
						<th colspan=3 id="top" title="MCQs. Each Question - 1 Mark">SHARE YOUR BIT</th>
					</tr>
					<tr>
						<th class="th1">Index</th>
						<th class="th2">Question</th>
						<th class="th3">Options</th>
					</tr>
					<tr>
						<td class="td1">1</td>
						<td class="td2">Assuming, integer is 2 byte, What will be the output of the program?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;printf("%x\n", -1>>1);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt1" id="A" value="A" value='A'>ffff<br>
						<input type=radio name="opt1" id="B" value='B'>0fff<br>
						<input type=radio name="opt1" id="C" value='C'>0000<br>
 						<input type=radio name="opt1" id="D" value='D'>fff0
						</td>
					</tr>
					<tr>
						<td class="td1">2</td>
						<td class="td2">What will be the output of the program?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;unsigned char i = 0x80;<br>
							&nbsp;&nbsp;printf("%d\n", i<<1);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt2" id="A" value="A" >0<br>
						<input type=radio name="opt2" id="B" value='B'>256<br>
						<input type=radio name="opt2" id="C" value='C'>100<br>
 						<input type=radio name="opt2" id="D" value='D'>80
						</td>
					</tr>
					<tr>
						<td class="td1">3</td>
						<td class="td2">Which of the following statements is correct about the program?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;unsigned int m[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};<br>
							&nbsp;&nbsp;unsigned char n, i;<br>
							&nbsp;&nbsp;scanf("%d", &amp;n);<br>
							&nbsp;&nbsp;for(i=0; i<=7; i++)<br>
							&nbsp;&nbsp;{<br>
							&nbsp;&nbsp;&nbsp;&nbsp;if(n &amp; m[i])<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("yes");<br>
							&nbsp;&nbsp;}<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt3" id="A" value="A" value='A'>It will put OFF all bits that are ON in the number n<br>
						<input type=radio name="opt3" id="B" value='B'>It will test whether the individual bits of n are ON or OFF<br>
						<input type=radio name="opt3" id="C" value='C'>It will put ON all bits that are OFF in the number n<br>
 						<input type=radio name="opt3" id="D" value='D'>It will report compilation errors in the if statement.
						</td>
					</tr>
					<tr>
						<td class="td1">4</td>
						<td class="td2">Which of the following statements is correct about the program?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;unsigned int num;<br>
							&nbsp;&nbsp;int c=0;<br>
							&nbsp;&nbsp;scanf("%u", &amp;num);<br>
							&nbsp;&nbsp;for(;num;num>>=1)<br>
							&nbsp;&nbsp;{<br>
							&nbsp;&nbsp;&nbsp;&nbsp;if(num &amp; 1)<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c++;<br>
							&nbsp;&nbsp;}<br>
							&nbsp;&nbsp;printf("%d", c);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt4" id="A" value="A" value='A'>It counts the number of bits that are ON (1) in the number num.<br>
						<input type=radio name="opt4" id="B" value='B'>It counts the number of bits that are OFF (0) in the number num.<br>
						<input type=radio name="opt4" id="C" value='C'>It sets all bits in the number num to 1<br>
 						<input type=radio name="opt4" id="D" value='D'>Error
						</td>
					</tr>
					<tr>
						<td class="td1"> 5</td>
						<td class="td2">What is the output of this C code?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>	
							&nbsp;&nbsp;if (7 &amp; 8)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;printf("Honesty");<br>
							&nbsp;&nbsp;if ((~7 &amp; 0x000f) == 8)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;printf("is the best policy\n");<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt5" id="A" value="A" value='A'>Honesty is the best policy<br>
						<input type=radio name="opt5" id="B" value='B'>Honesty<br>
						<input type=radio name="opt5" id="C" value='C'>is the best policy<br>
 						<input type=radio name="opt5" id="D" value='D'>No output
						</td>
					</tr>
					<tr>
						<td class="td1">6</td>
						<td class="td2">what does the following C Function do?<br>
						int fun(int n)<br>
						{<br>
							&nbsp;&nbsp;return ((n << 3) - n );<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt6" id="A" value="A" value='A'>multiply by 6<br>
						<input type=radio name="opt6" id="B" value='B'>multiply by 7<br>
						<input type=radio name="opt6" id="C" value='C'>divide by 6<br>
 						<input type=radio name="opt6" id="D" value='D'>divide by 7
						</td>
					</tr>
					<tr>
						<td class="td1">7</td>
						<td class="td2">what does the following C Function return?<br>
						int fun(int n)<br>
						{<br>
							&nbsp;&nbsp;return (A &amp; (B - 1));<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt7" id="A" value="A" value='A'>B%A where B is the power of 2.<br>
						<input type=radio name="opt7" id="B" value='B'>A%B where A is the power of 2.<br>
						<input type=radio name="opt7" id="C" value='C'>A%B where B is power of 2.<br>
 						<input type=radio name="opt7" id="D" value='D'>none of these.
						</td>
					</tr>
					<tr>
						<td class="td1">8</td>
						<td class="td2">what does the following C function do?<br>
						int fun(int num)<br>
						{<br>
							&nbsp;&nbsp;int count=0;<br>
							&nbsp;&nbsp;while(num!=0)<br>
							&nbsp;&nbsp;{<br>
								&nbsp;&nbsp;&nbsp;&nbsp;num=num &amp; (num-1);<br>
								&nbsp;&nbsp;&nbsp;&nbsp;count++;<br>
							&nbsp;&nbsp;}<br>
							&nbsp;&nbsp;return count;<br>
													
						}
						</td>
						<td class="td3">
						<input type=radio name="opt8" id="A" value="A" value='A'>count of 0's with O(num).<br>
						<input type=radio name="opt8" id="B" value='B'>count of 1's with O(num).<br>
						<input type=radio name="opt8" id="C" value='C'>count of 1's with O(m).<br>
 						<input type=radio name="opt8" id="D" value='D'>count of 0's with O(m) where m is the number of set bits in num.
						</td>
					</tr>
					<tr>
						<td class="td1">9</td>
						<td class="td2">Which of the following option is correct ?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;unsigned int a=0xffff;<br>
							&nbsp;&nbsp;~a;<br>
							&nbsp;&nbsp;printf("%x",a);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt9" id="A" value="A" value='A'>0000<br>
						<input type=radio name="opt9" id="B" value='B'>ffff<br>
						<input type=radio name="opt9" id="C" value='C'>0ff0<br>
 						<input type=radio name="opt9" id="D" value='D'>000f
						</td>
					</tr>
					<tr>
						<td class="td1">10</td>
						<td class="td2"> Which of the following option is correct ?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;char c=48;<br>
							&nbsp;&nbsp;int i,mask=01;<br>
							&nbsp;&nbsp;for(int i=0;i<=5;i++)<br>
							&nbsp;&nbsp;{<br>
							&nbsp;&nbsp;&nbsp;&nbsp;printf("%c",c|mask);<br>
							&nbsp;&nbsp;&nbsp;&nbsp;mask=mask<<1;<br>
							&nbsp;&nbsp;}<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt10" id="A" value="A" value='A'>842100<br>
						<input type=radio name="opt10" id="B" value='B'>256000<br>
						<input type=radio name="opt10" id="C" value='C'>1248000<br>
 						<input type=radio name="opt10" id="D" value='D'>148241
						</td>
					</tr>
					<tr>
						<td class="td1">11</td>
						<td class="td2">Which of the following option is correct?<br>
						#include&lt;stdio.h&gt;<br>
						#define p printf("%d\n",~1^~0);<br>
						#defi.ne M(p) int main()\<br>
						{\<br>
						p\<br>
						return 0;\<br>		
						}<br>
						M(p);
						</td>
						<td class="td3">
						<input type=radio name="opt11" id="A" value='A'>compilation error<br>
						<input type=radio name="opt11" id="B" value='B'>run time error<br>
						<input type=radio name="opt11" id="C" value='C'>give output 1<br>
 						<input type=radio name="opt11" id="D" value='D'>nothing will be printed
						</td>
					</tr>
					<tr>
						<td class="td1">12</td>
						<td class="td2">Which of the following option is correct?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;int arr[3][3]={1,2,3,4};<br>
							&nbsp;&nbsp;printf("%d\n",*(*(*(arr))));<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt12" id="A" value='A'>output 1<br>
						<input type=radio name="opt12" id="B" value='B'>output 4<br>
						<input type=radio name="opt12" id="C" value='C'>invalid indirection<br>
 						<input type=radio name="opt12" id="D" value='D'>garbage value
						</td>
					</tr>
					<tr>
						<td class="td1">13</td>
						<td class="td2">Which of the following option is correct?<br>
						#include&lt;stdio.h&gt;<br>
						void g(int *);<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;int i=5;<br>
							&nbsp;&nbsp;g(&amp;i);<br>
							&nbsp;&nbsp;printf("%d",i);<br>
							&nbsp;&nbsp;return 0;<br>
						}<br>
						void g(int *j)<br>
						{<br>
							&nbsp;&nbsp;static int s=i;<br>
							&nbsp;&nbsp;if(*j!=0)<br>
							&nbsp;&nbsp;{ s=s**j;<br>
							&nbsp;&nbsp;&nbsp;&nbsp;*j=*j-1;<br>
							&nbsp;&nbsp;&nbsp;&nbsp;g(j);<br>
							&nbsp;&nbsp;&nbsp;&nbsp;*j=s;<br>
							&nbsp;&nbsp;}<br>
						}

						</td>
						<td class="td3">
						<input type=radio name="opt13" id="A" value='A'>60<br>
						<input type=radio name="opt13" id="B" value='B'>120<br>
						<input type=radio name="opt13" id="C" value='C'>25<br>
 						<input type=radio name="opt13" id="D" value='D'>512
						</td>
					</tr>
					<tr>
						<td class="td1">14</td>
						<td class="td2">Which of the following option is correct?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;struct value{<br>
							&nbsp;&nbsp;&nbsp;&nbsp;int bit1=1;<br>
							&nbsp;&nbsp;&nbsp;&nbsp;int bit3=4;<br>
							&nbsp;&nbsp;&nbsp;&nbsp;int bit4=4;<br>
							&nbsp;&nbsp;}<br>
							&nbsp;&nbsp;bit={1,2,13};<br>
							&nbsp;&nbsp;printf("%d,%d,%d\n",bit.bit1,bit.bit3,bit.bit4);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt14" id="A" value='A'>1,2,13<br>
						<input type=radio name="opt14" id="B" value='B'>1,4,4<br>
						<input type=radio name="opt14" id="C" value='C'>-1,2,-3<br>
 						<input type=radio name="opt14" id="D" value='D'>-1,-2,-13
						</td>
					</tr>
					<tr>
						<td class="td1">15</td>
						<td class="td2">Which of the following option is correct?<br>
						#include&lt;stdio.h&gt;<br>
						int main()<br>
						{<br>
							&nbsp;&nbsp;enum day(MON=6,TUE,WED=6,THU,FRI=-1,SAT};<br>
							&nbsp;&nbsp;printf("%d,%d,%d,%d,%d,%d\n",MON,TUE,WED,THU,FRI,SAT);<br>
							&nbsp;&nbsp;return 0;<br>
						}
						</td>
						<td class="td3">
						<input type=radio name="opt15" id="A" value='A'>0,1,2,3,4,5<br>
						<input type=radio name="opt15" id="B" value='B'>6,6,6,6,-1,-1<br>
						<input type=radio name="opt15" id="C" value='C'>6,7,6,7,-1,0<br>
 						<input type=radio name="opt15" id="D" value='D'>1,2,3,4,5,6
						</td>
					</tr>
				</table>
				<table class="t" >
					<tr>
					<th colspan=3 id="middle" title="Code Snippet and test cases with output would be given . One statement is missing in the code. You have to find and write it at proper line no. so that code's output match's our set . Each Question - 2 Marks">LAST NAIL IN THE COFFIN</th>
					</tr>
					<tr>
						<th class="th1">Index</th>
						<th class="th2">Question</th>
						<th class="th3">Options</th>
					</tr>
					<tr>
						<td class="td1">1</td>
						<td class="td2">Assume address of p 1000 n q 2000<br> 
						1)#include&lt;stdio.h&gt;<br>
						2)#include&lt;stdlib.h&gt;<br>
						3)void fun(int **q){<br>
						4)&nbsp;&nbsp;int r=20;<br>
						5)&nbsp;&nbsp;printf("%u",*q);<br>
						6)}<br>
						7)int main(){<br>
						8)&nbsp;&nbsp;int *p=(int*)malloc(sizeof(int));<br>
						9)&nbsp;&nbsp;*p=55;<br>
						10)&nbsp;&nbsp;fun(&amp;p);<br>
						11)	&nbsp;&nbsp;printf("%d%u\n",*p,p);<br>
						12)&nbsp;&nbsp;	return 0;<br>
						13)}<br>
						Output: 1000 20 1000
						</td>
						<td class="td3">
							<textarea placeholder="LINE NUM - LINE TO BE ADDED" name='LNTC1'></textarea>
						</td>	
					</tr>
					<tr>
						<td class="td1">2</td>
						<td class="td2">1)int main(){<br>
						2)	&nbsp;&nbsp;printf("Hello ");<br>
						3)	&nbsp;&nbsp;else<br>
						4)	&nbsp;&nbsp;&nbsp;&nbsp;printf("India");<br>
						5)}<br>
						Output: Hello India<br>
						</td>
						<td class="td3">
							<textarea placeholder="LINE NUM - LINE TO BE ADDED" name='LNTC2'></textarea>
						</td>
					</tr>
					<tr>
						<td class="td1">3</td>
						<td class="td2">1)int main(){<br>
						2)	&nbsp;&nbsp;char *str1="India is great";<br>
						3)	&nbsp;&nbsp;int i=0, j=0;<br>
						4)	&nbsp;&nbsp;char str2[10]="hello";<br>
						5)	&nbsp;&nbsp;str2[j++]=str1[i++];<br>
						6)	&nbsp;&nbsp;str2[j++]=i++[str1];<br>
						7)	&nbsp;&nbsp;str2[i++]='\0';<br>
						8)	&nbsp;&nbsp;printf("%s%d",str2,j);<br>
						9)	&nbsp;&nbsp;return 0;<br>
						10)}<br>
						Output: Ini 3<br>
						</td>
						<td class="td3">
							<textarea placeholder="LINE NUM - LINE TO BE ADDED" name='LNTC3'></textarea>
						</td>
					</tr>
				</table>
				<table class="t">
					<tr>
					<th colspan=3 id="bottom" title="Accorrding to provided information find the best suitable data structure. Each Question - 1 Mark ">DATA THAT</th>
					</tr>
					<tr>
						<th class="th1">Index</th>
						<th class="th2">Question</th>
						<th class="th3">Options</th>
					</tr>
					<tr>
						<td class="td1">1</td>
						<td class="td2">Which data structure is used in newsfeed of facebook?</td>
						<td class="td3">
						<input type=radio name="opt31" id="A" value="A">Tree<br>
						<input type=radio name="opt31" id="B" value="B">Sorted Tree<br>
						<input type=radio name="opt31" id="C" value='C'>Graph<br>
 						<input type=radio name="opt31" id="D" value='D'>Map
						</td>
					</tr>
					<tr>
						<td class="td1">2</td>
						<td class="td2">Which data structure is used to store key/value pair in map?</td>
						<td class="td3">
						<input type=radio name="opt32" id="A" value="A">binary search tree<br>
						<input type=radio name="opt32" id="B" value="B">red-black tree<br>
						<input type=radio name="opt32" id="C" value='C'>AVL tree<br>
 						<input type=radio name="opt32" id="D" value='D'>linked-list
						</td>
					</tr>
					<tr>
						<td class="td1">3</td>
						<td class="td2">Which data structure is used for fast full text searchs in MS Word </td>
						<td class="td3">
						<input type=radio name="opt33" id="A" value="A">Hash table<br>
						<input type=radio name="opt33" id="B" value="B">Ordered Array<br>
						<input type=radio name="opt33" id="C" value='C'>Suffix Tree<br>
 						<input type=radio name="opt33" id="D" value='D'>Binary Search Tree
						</td>
					</tr>
					<tr>
						<td class="td1">4</td>
						<td class="td2">Your structure needs to store a potentially very large number of records, with the data being added as it arrives. You need to be able to retrieve a record by its primary key, and these keys are random with respect to the order in  hich the data arrives. Records also may be deleted at random times, and all modifications to the data need to be completed just after they are submitted by the users. You have no idea how large the dataset could be, but the data structure implementation needs to be ready in a few weeks. suitable data structure for the above scenario would be?</td>
						<td class="td3">
						<input type=radio name="opt34" id="A" value="A">Hash Table<br>
						<input type=radio name="opt34" id="B" value="B">binary
						search tree<br>
						<input type=radio name="opt34" id="C" value='C'>AVL tree<br>
 						<input type=radio name="opt34" id="D" value='D'>red-black tree
						</td>
					</tr>
					<tr>
						<td class="td1">5</td>
						<td class="td2">Which data structure is used in mobiles for auto completion and spell checking feature while dialing numbers etc</td>
						<td class="td3">
						<input type=radio name="opt35" id="A" value="A">binary search tree<br>
						<input type=radio name="opt35" id="B" value='B'>red-black tree<br>
						<input type=radio name="opt35" id="C" value='C'>AVL tree<br>
 						<input type=radio name="opt35" id="D" value='D'>Trie
						</td>
					</tr>
					
				</table>
				<br>

				<center><input type="submit" value=SUBMIT style="background-color:0B476A; color:white; font-size:larger;"/></center>
			</form>
			</div>
			</div>
		</div>
	</body>
</html>
	