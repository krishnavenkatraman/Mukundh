/**
 * 
 */

function checkvalue() { 
   
	var atotalCost = document.getElementById('loanamt').value;
	var aBorrowed = document.getElementById('amtBorrowed').value;
    var iRate = document.getElementById('interestrate').value; 
    var mPaymentAcct = document.getElementById('monthlyPaymentAmt').value; 
    var threshPaymentAmt = (1/12) * (1/100) * aBorrowed * iRate ;
    
    var mPaymentAmtCheckBox = document.getElementById("mnthlyPaymtChckBx").checked ;
    var nYears = document.getElementById('numberofYrs').value;
    
    if(!atotalCost.match(/\S/)) {
        alert ('Loan Amount can not be Empty');        
        return false;
    } else if(!atotalCost.match(/\d*\.?\d+/) || aBorrowed.match(/[a-zA-Z]/)){
    	alert ('Loan Amount has to be a valid number');
    	return false;
    } else if(!aBorrowed.match(/\S/)) {
        alert ('Amount to be borrowed can not be Empty');        
        return false;
    } else if(!aBorrowed.match(/\d*\.?\d+/) || aBorrowed.match(/[a-zA-Z]/)){
    	alert ('Amount to be borrowed has to be a valid number');
    	return false;
    } else if(!iRate.match(/\S/)) {
        alert ('Interest Rate can not be Empty');
        return false;
    } else if(!iRate.match(/\d*\.?\d+/) || iRate.match(/[a-zA-Z]/)){
    	alert ('Interest Rate has to be a valid number');
    	return false;
    } else if(mPaymentAmtCheckBox){    		
    	if (!mPaymentAcct.match(/\S/)) 
    	{
    		alert ('Monthly Payment Amount can not be Empty');
    		return false;
    	} 	else if(!mPaymentAcct.match(/\d*\.?\d+/) || mPaymentAcct.match(/[a-zA-Z]/)){
    		alert ('Monthly Payment has to be a valid number');
    		return false;
    	} 	else if (mPaymentAcct < threshPaymentAmt ){
    		alert ('Please Increase the desired monthly Payment Amount to be greater than atleast monthly interest charges'+ ' of  ' + threshPaymentAmt);
    		return false;
    	}
    } else if(!mPaymentAmtCheckBox){ 
    		
    	if (!nYears.match(/\S/))
    	{    	
    		alert ('Number of Years can not be Empty');
    		return false;
    	} else if(!nYears.match(/\d*\.?\d+/) || nYears.match(/[a-zA-Z]/)){
    		alert ('Number of Years has to be a valid number');
    		return false;
    	}
    }    
    else {
       // alert("correct input");
        return true;
    }
}