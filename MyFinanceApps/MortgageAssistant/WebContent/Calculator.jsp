<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Krishna-Venkatraman's Calculator on the Go</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
<link rel="stylesheet" type="text/css"  href="resources/css/mort-tree.css" />
<style type="text/css">
                  @media screen and (-webkit-min-device-pixel-ratio:0)    
                  {
                      .wizard{min-height:596px;}
                  }
              </style>  
<script type="text/javascript"  src="resources/js/base.js" ></script>
<script type="text/javascript"  src="resources/js/jquery-1.11.0.js" ></script>

<script>
$(document).ready(function(){
 $(".downPaymt").hide();
 $(".downPaymtText").hide();
 $(".mnthlyPaymtAmtText").hide();
 $(".mnthlyPaymtAmt").hide();

 

  $("button").click(function(){
    $(".downPaymt").hide();
  });

$("input[type='radio']").change(function(){
   
if($(this).val()=="Yes")
{
    $(".downPaymt").show();
    $(".downPaymtText").show();
}
else
{
       $(".downPaymt").hide(); 
       $(".downPaymtText").hide();
		document.getElementById('downpymt').value = "0";
document.getElementById('amtBorrowed').value = (1 - document.getElementById('downpymt').value /100 ) * document.getElementById('loanamt').value ;
}    
});

//new
$("#mnthlyPaymtChckBx").change(function(){
	   
	if($(this).is(':checked') )
	{
	    $(".mnthlyPaymtAmtText").show();
	    $(".mnthlyPaymtAmt").show();

	    $(".numberofYrsText").hide(); 
	    $(".numberofYrs").hide();
	    document.getElementById('numberofYrs').value = "";
	}
	else
	{
	       $(".numberofYrsText").show(); 
	       $(".numberofYrs").show();

	       $(".mnthlyPaymtAmtText").hide();
		   $(".mnthlyPaymtAmt").hide();

		   document.getElementById('monthlyPaymentAmt').value = "";
	}    
	});

$("#loanamt").change(function(){
document.getElementById('amtBorrowed').value = (1 - document.getElementById('downpymt').value /100 ) * document.getElementById('loanamt').value ;
});

$("#downpymt").change(function(){
document.getElementById('amtBorrowed').value = (1 - document.getElementById('downpymt').value /100) * document.getElementById('loanamt').value ;
});

});
</script>
</head>
<body>

<form name="frm" onsubmit="return checkvalue(this)" method="post" action="${pageContext.request.contextPath}/MortgageData">
<div class="bodyWrapper">       
   <div class="header formHeader">
            <b>Krishna Venkatraman's Mortgage Calculator</b>
        </div>
	 <div class="website-wrapper">
		Enter Mortgage Payment Details below: <br/>
		
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="22%">&nbsp;</td>
    <td width="78%">&nbsp;</td>
    </tr>    
    <tr>
    
    <td >Loan Amount : </td>
    <td ><p class="loan"><input type="text"  id="loanamt" name="loanamt"/> </p> </td>
    </tr>
    <tr>
    <td >Do you want to put in any Down Payment?</td>
	    <td>
	    	<input type="radio" name="dwnPymt" value="Yes"/>Yes
			<input type="radio" name="dwnPymt" value="No"/>No
	    </td>
    </tr>
    <tr>
    	<td><p class="downPaymtText">Enter the Down Payment Percentage: 
    		</p>
    	</td>
    	<td >
    		<p class="downPaymt">
				<input type="text"  id="downpymt" name="downpymt" value = "0"/>
			</p> 
		</td>
    </tr>
  <tr>
    <td>Amount To be  Borrowed:</td>
    <td><input type="text" id="amtBorrowed" name="amtBorrowed" readonly="readonly"></td>
  </tr>
  <tr>
    <td>Rate of Interest percentage:</td>
    <td><input type="text"  id="interestrate" name="interestrate"></td>
  </tr>
 <tr> 
	 	<td>
	    	I Know my monthly Budget Amount for Payment			
	 	</td>
	 	
	 	<td > 		
 			<input type="checkbox" id="mnthlyPaymtChckBx" name="mnthlyPaymtChckBx" value="Y"/> 		
 	</td>	
 </tr>
  <tr>
    <td><p class="mnthlyPaymtAmtText">Desired Monthly Payment Amount:
    	</p>
    </td>
    <td>
    	<p class="mnthlyPaymtAmt">
    		<input type="text"  id="monthlyPaymentAmt" name="monthlyPaymentAmt">
    	</p>	
    </td>
  </tr>
 
  <tr>
    <td><p class="numberofYrsText">Enter the Number of Years:
    	</p>
    </td>
    <td>
    	<p class="numberofYrs">
    		<input type="text"  id="numberofYrs" name="numberofYrs">
    	</p>	
    </td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
  	<td>&nbsp;</td>
  </tr>
 
   <tr>    
    
    <td><input type="submit" name="submit" value="Calculate"></td>
     <td><input type="reset" name="reset" value="Clear"></td>
    </tr>
    
</table>

		
		</div>
    </div>

	<div id="bottomFixed">
		<div id="tabbar"></div>
		<div id="tabbar_border"></div>
	</div>
</form>
</body>
</html>