document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress-bar');

  if (control) {
    var value = control.dataset.questionNum / control.dataset.questionsCount * 100;
    control.nodeValue = value;
    control.setAttribute('aria-valuenow', value);
    control.style.width = value + "%";
  };
})
