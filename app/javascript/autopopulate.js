document.addEventListener("DOMContentLoaded", function() {
    // Parse the URL for the 'name' parameter
    const params = new URLSearchParams(window.location.search);
    const lakeName = params.get('name'); // Get the value of the 'name' parameter
  
    if (lakeName) {
      const lakeNameField = document.getElementById('lake-name-field');
      if (lakeNameField) {
        lakeNameField.value = lakeName; // Set the value of the input field
      }
    }
  });

  document.getElementById('back-to-lakes-link').addEventListener("click", () => { 
    window.location.href = '/'
  });