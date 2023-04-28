// Add an event listener to the navbar-toggler button
  document.querySelector('.navbar-toggler').addEventListener('click', function() {
    // Toggle the .close class when the button is clicked
    this.classList.toggle('close');
  });