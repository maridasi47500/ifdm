
    function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
} 

window.onload=function(){
    if ($("#mymsg").length > 0 && $("#mymsg").html().length > 0) {
      // Get the snackbar DIV
      var x = document.getElementById("snackbar");

      // Add the "show" class to DIV
      x.className = "show";

      // After 3 seconds, remove the show class from DIV
      setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
    }
    if ($("#payment-form").length > 0) {
          $("#payment-form").submit(function(){
           $.ajax({url:$(this).attr("action")+".json",type:$(this).attr("method"),
            data:$(this).serialize(),
                  success:function(data){
                                  on();

                      
            $("#hello").attr("style","width:100%;");
            setTimeout(() => {
               console.log("Retardée d'une seconde.");
            $("#wait1").hide();
            $("#wait2").show();
            setTimeout(() => {
             window.location="/paiementsucces"
             }, "1000");
               console.log("Retardée d'une seconde.");
             }, "1000");
                  },
                  error:function(xhr,data,thrownerror){
          $("#wait1").hide();
          $("#wait2").hide();
          on();
          $("#wait3").html(xhr.responseJSON.myerror[0]);
          $("#wait3").append(`<a href="/">Retour à l'IFDM</a>`);
          console.log(data,xhr.responseText,xhr.responseJSON);
          $("#wait3").show();
         
               }});

            return false;
          });
    }
    if ($("#accordion").length > 0) {
        
          $("#continuerprem").click(function(){
 $(".collapse").collapse("hide") ;
  $("#collapseTwo").collapse("show");
});
 $("#continuerdeux").click(function(){
 $(".collapse").collapse("hide") ;
  $("#collapseThree").collapse("show");
});
  $("[data-target]").click(function(){
 $(".collapse").collapse("hide") ;
  $($(this).data("target")).collapse("show");
});
}
    if ($(".addtobasket").length > 0) {
        $(".addtobasket").click(function(){
            $(".quantite").html($("#numbercourse"+$(this).data("id")).val());
           $.ajax({url: "/achats-cours-"+$(this).data("mytype")+"/"+$(this).data("id")+"/add",
               data:{quantite: $("#numbercourse"+$(this).data("id")).val()},
                success:function(data){
                   console.log("vous avez "+data+" artiles dans le panier")
                   $(".sum").html(data.sum);
                   $(".total").html(data.total);
                   $(".soustotal").html(data.soustotal);
                   on();
                }
           });
           return false;
        });
    }
};
