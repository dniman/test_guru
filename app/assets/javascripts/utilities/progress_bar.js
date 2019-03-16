document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress-bar');

  if (control) {
    var questionNum = control.dataset.questionNum;
    
    if (questionNum > 1) {
      var value = (questionNum - 1) / control.dataset.questionsCount * 100;
     
      var testsCompletedInfo = control.textContent.split(" ");
      testsCompletedInfo[testsCompletedInfo.length -1] = questionNum - 1;
      control.textContent = testsCompletedInfo.join(" ");
      control.setAttribute('aria-valuenow', value);
      control.style.width = value + "%";
    }
    else {
      control.textContent = ""; 
    };
  };
})
