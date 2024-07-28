document.getElementById('searchQuery').addEventListener('input', function () {
    var query = this.value;
    if (query.trim() !== '') {
        searchNotices(query);
    } else {
        clearDiv();
    }
});

function highlightMatchingText(text, query) {
    var regex = new RegExp(query, 'gi');
    return text.replace(regex, function(match) {
        return '<mark>'+match+'</mark>';
    });
}


function clearDiv() {
    var searchResultsContainer = document.getElementById('searchResultsContainer');
    searchResultsContainer.innerHTML = '';
}

document.getElementById('searchQuery').addEventListener('blur', function () {
    var searchQuery = this.value.trim(); // Get the value and remove leading/trailing spaces

    if (searchQuery === '') {
        clearDiv();
    }
});


function searchNotices(query) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/G7SIMS/SearchNoticeServlet?query=' + query, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var searchResults = JSON.parse(xhr.responseText);
                displaySearchResults(searchResults, query);
;
            } else {
                console.error('Error fetching search results:', xhr.status);
                // Display an error message to the user
            }
        }
    };

    xhr.send();
}

function displaySearchResults(results, query) {
    var searchResultsContainer = document.getElementById('searchResultsContainer');
    searchResultsContainer.innerHTML = '';

    results.forEach(function (notice) {
        var noticeDiv = document.createElement('div');
        var noticeContent = notice.noticeContent;
        var noticeTitle = notice.noticeTitle;
        var highlightedTitle = highlightMatchingText(noticeTitle, query);
        var highlightedContent = highlightMatchingText(noticeContent, query);

        noticeDiv.innerHTML = '<a href="" class="card-link text-dark" data-toggle="modal" data-target="#ViewNoticeModal'+ notice.noticeID + '">'
                            + '<div class="card w-90 m-1">' + '<div class="card-body">' + '<h6 class="card-title">' + highlightedTitle + '</h6><p class="card-text">' 
                            + highlightedContent.trim() + '</p></div></div></a>';
                    
        searchResultsContainer.appendChild(noticeDiv);
    });
}
