export const fetchSearchGiphys = searchTerm => {
    $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=IpyjEBXa7B546V5P3QfU7IxwdNbdAuMi&limit=2`
    })
}

