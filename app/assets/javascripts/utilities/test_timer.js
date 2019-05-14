document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#timer');

  if (control) {
    var seconds = control.dataset.seconds;
    var endTime = new Date();  
    endTime.setTime(endTime.getTime() + seconds * 1000);
   
    if (seconds > 0) {
      var x = setInterval(function() {
        var now = new Date().getTime();
        showTimer(endTime - now); 
        
        if (seconds < 0) {
          clearInterval(x);
          window.location.replace(control.dataset.redirectPath);
          return;
        }

        seconds -= 1;
      }, 1000)
    }
  }
})

function showTimer(value){
  document.getElementById("timer").textContent = "Оставшееся время: " + ('0' + getHours(value)).slice(-2) + ":"
        + ('0' + getMinutes(value)).slice(-2) + ":" + ('0' + getSeconds(value)).slice(-2);
}

function getHours(value){
  return Math.floor((value % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
}

function getMinutes(value) {
  return Math.floor((value % (1000 * 60 * 60)) / (1000 * 60));
}

function getSeconds(value){
  return Math.floor((value % (1000 * 60)) / 1000);
}
