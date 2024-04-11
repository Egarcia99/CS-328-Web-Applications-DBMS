window.onload = function() {
  var form = document.querySelector("form");

  if (form) {
    form.addEventListener("submit", function(event) {
      event.preventDefault(); 
      
      var nameEntry = document.getElementById("name_entry");

      if (nameEntry) {
        var userName = nameEntry.value;
        alert("Hello " + userName);
      } else {
        alert("Hello!");
      }
      
      form.submit(); 
    });
  }
};
