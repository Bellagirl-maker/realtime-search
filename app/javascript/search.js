// app/assets/javascripts/search.js

$(document).ready(function () {
    const searchInput = $('#search-input');
    const searchResults = $('#search-results');
  
    searchInput.on('input', function () {
      const query = searchInput.val();
  
      // Make an AJAX request to the search endpoint
      $.ajax({
        method: 'POST',
        url: '/search',
        data: { query: query },
        success: function (data) {
          // Update the UI with real-time search results
          updateSearchResults(data.query);
        },
        error: function (error) {
          console.error('Error:', error);
        }
      });
    });
  
    function updateSearchResults(query) {
      // Update the search results UI
      searchResults.empty();
      searchResults.append(`<li>${query}</li>`);
    }
  });
  