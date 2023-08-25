
    function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
} 

window.onload=function(){
    if ($("#payment-form").length > 0) {
          $("#payment-form").submit(function(){
           $.ajax({url:$(this).attr("action")+".json",type:$(this).attr("method"),
            success:function(){
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
               });

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
