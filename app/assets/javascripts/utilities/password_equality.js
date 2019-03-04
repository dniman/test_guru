function clearPasswordConfirmation(){
  var form = document.querySelector('.new_user');
  var passwordConfirmation = form.querySelector('#user_password_confirmation');

  passwordConfirmation.value = '';
  passwordConfirmation.classList.remove('is-valid');
  passwordConfirmation.classList.remove('is-invalid');
}

function checkEquality(){
  var form = document.querySelector('.new_user');
  var password = form.querySelector('#user_password');
  var passwordConfirmation = form.querySelector('#user_password_confirmation');
       
  if (passwordConfirmation.value == ''){
    passwordConfirmation.classList.remove('is-invalid');
    passwordConfirmation.classList.remove('is-valid');
    return;
  };

  if (password.value != passwordConfirmation.value){
    passwordConfirmation.classList.add('is-invalid');
    passwordConfirmation.classList.remove('is-valid');
  }
  else {
    passwordConfirmation.classList.add('is-valid');
    passwordConfirmation.classList.remove('is-invalid');
  }
  
}

