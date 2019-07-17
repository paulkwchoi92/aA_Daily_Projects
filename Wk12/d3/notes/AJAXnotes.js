const negGifAJAX = tag => {
    return $a.jax({
        method: "GET",
        url:
        success: function (response) {
            $("<img")
            .attr("src", response.data.image_url)
            .appendTo($("body"));
        },
        error: function() {
            console.log("error");
        }
    });
}

// const result = newGifAJAX("dog")
// debugger;
// console.log(result.responseJSON.data.image_url)

const xhr = newGifAJAX("dog")
const successCb = function (response) {
    $("<img>")
        .attr("src", response.data.image_url)
        .appendTo($("body"));
};

const errorCbv = function () {
    console.log("error");
}

xhr.then(successCb, errorCb);