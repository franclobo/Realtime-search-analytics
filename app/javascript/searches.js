document.addEventListener('turbo:load', function () {
  document.getElementById('search-input').addEventListener('input', function () {
    var query = this.value;
    fetch('/searches', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Turbo-Frame': 'search-results'
      },
      body: JSON.stringify({ query: query })
    }).then(response => response.json())
      .then(data => {
        alert(data.message);
        Turbo.visit(window.location, { action: 'replace' });
      })
      .catch(error => console.error(error));
  });
});
