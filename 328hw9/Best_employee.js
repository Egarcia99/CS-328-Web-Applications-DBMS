window.onload = function() {
  var form = document.querySelector("form");

  if (form) {
    form.addEventListener("submit", function(event) {
      event.preventDefault(); 
      
      var nameEntry = document.getElementById("name_entry");

      if (nameEntry) {
        var userName = nameEntry.value;
        alert("Preparing User " + userName + " to increase an employee raise " );
      } else {
        alert("Thank you for increasing the best employee's salary");
      }
      
      form.submit(); 
    });
  }
};
