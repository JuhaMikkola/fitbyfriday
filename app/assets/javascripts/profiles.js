$(function(){

  options = {
    //Boolean - Whether we should show a stroke on each segment
    segmentShowStroke : true,

    //String - The colour of each segment stroke
    segmentStrokeColor : "#fff",

    //Number - The width of each segment stroke
    segmentStrokeWidth : 2,

    //Boolean - Whether we should animate the chart
    animation : true,

    //Number - Amount of animation steps
    animationSteps : 100,

    //String - Animation easing effect
    animationEasing : "easeOutBounce",

    //Boolean - Whether we animate the rotation of the Pie
    animateRotate : true,

    //Boolean - Whether we animate scaling the Pie from the centre
    animateScale : false,

    //Function - Will fire on animation completion.
    onAnimationComplete : null
  }

  var chartTarget = document.getElementById("myChart");
  if (chartTarget) {
    var total = $("#accountability-score").attr("data-total");
    var confirmed = $("#accountability-score").attr("data-confirmed");
    var data = [
      {
        value: Math.round(total),
        color:"#F38630"
      },
      {
        value : Math.round(confirmed),
        color : "#69D2E7"
      }
    ];
    var ctx = chartTarget.getContext("2d");
    var myNewChart = new Chart(ctx).Pie(data,options);
  }

});