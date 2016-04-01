function highlight(checkObj){
	var check = $(checkObj).val();
	var highlightTags1 = document.getElementsByClassName("func_content1");		
	var highlightTags2 = document.getElementsByClassName("func_content2");
	var highlightTags3 = document.getElementsByClassName("orangeLink");		
	var highlightTags4 = document.getElementsByClassName("redLink");

	if (check == "1"){
		$(checkObj).attr("checked",false);  
        $(checkObj).val("0");
        for (i = 0; i < highlightTags1.length; i++)
        	highlightTags1[i].style.backgroundColor = "rgba(0,0,0,0)";
        for (i = 0; i < highlightTags2.length; i++)
        	highlightTags2[i].style.backgroundColor = "rgba(0,0,0,0)";        
        for (i = 0; i < highlightTags3.length; i++)
        	highlightTags3[i].style.color = "#5b5b5b";
        for (i = 0; i < highlightTags4.length; i++)
        	highlightTags4[i].style.color = "#5b5b5b";
	}else{
		$(checkObj).attr("checked",true);
		$(checkObj).val("1");
        for (i = 0; i < highlightTags1.length; i++)
        	highlightTags1[i].style.backgroundColor = "#EEE685";
        for (i = 0; i < highlightTags2.length; i++)
        	highlightTags2[i].style.backgroundColor = "#EEEE00";
        for (i = 0; i < highlightTags3.length; i++)
        	highlightTags3[i].style.color = "";
        for (i = 0; i < highlightTags4.length; i++)
        	highlightTags4[i].style.color = "";
	}
}