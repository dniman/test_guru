document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#timer');

  if (control) {
    var startTime = control.dataset.startTime;
    var endTime = control.dataset.endTime;
   
    if (startTime == endTime) {
      return;
    }

    var dateEndTime = new Date(endTime).getTime();
    var dateStartTime = new Date(startTime);

    var x = setInterval(function() {
      dateStartTime = new Date(dateStartTime); 
      
      var offset = dateEndTime - dateStartTime.getTime();
    
      if (offset < 0) {
        clearInterval(x);
        window.location.replace(control.dataset.redirectPath);
        return;
      }

      control.dataset.startTime = dateStartTime;

      Rails.ajax({
        type: "POST", 
        datatype: 'script',
        url: control.dataset.updateStartTimePath,
        data: 'start_time=' + dateStartTime.toISOString(),
        success: function(response){},
        error: function(error){
          console.log(error);
        }
      })
      
      var hours = Math.floor((offset % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((offset % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((offset % (1000 * 60)) / 1000);
    
      document.getElementById("timer").innerHTML = "Оставшееся время: " + ('0' + hours).slice(-2) + ":"
        + ('0' + minutes).slice(-2) + ":" + ('0' + seconds).slice(-2);

      dateStartTime.setSeconds(dateStartTime.getSeconds() + 1);

    }, 1000);
  };
})
