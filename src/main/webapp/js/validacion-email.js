document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("form-login").addEventListener("submit", function(event)
    {
        event.preventDefault();
        var email = document.getElementById("email").value;
        var emailError = document.getElementById("emailError");
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    
        emailError.textContent = "";
    
        if(!emailRegex.test(email)){
            emailError.textContent = "Ingresa un email válido";
            return;
        }
    });
});

