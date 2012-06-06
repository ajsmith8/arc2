$(function(){
    var menuStatus = false;
 
    $("a.showMenu").click(function(){
		if(menuStatus == false){
			$("#menu").show(function(){menuStatus = true})
			$("#home").css('width', '10px');
			}
		if(menuStatus == true){
			$("#menu").hide(function(){menuStatus = false})
			$("#home").css('width', '400px');
		}
    });
 
  
 
});
