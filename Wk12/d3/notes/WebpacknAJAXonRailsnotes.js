gem = 'jqury-rails'
inside application.js = require jquery3
create a webpack.config.js in the rails file 

inside frontend folder create a entry file 

inside the webpack file:

const path = require("path");

module.exports = {
    mode: "development",
    context: __dirname,
    entry: "./frontend/entry.js",
    output: {
        path: path.resolve(__dirname, "app", "assets")
    }
}
]

inside routes of rails 

namespace :api do 
    resources :bleats, only: [:index]
    end 
    end 


    inside controllers, api 
    new bleats_controller file 
        class Api::BleatsController < ApplicationController
        end 

inside entry.js 
    $(function){
        const $bleatsUl = $("ul#bleats")

        $.ajax({
            method: "GET",
            url: "/api/bleats",
            success: function (response) {
                const $lis = (bleats.map(bleat =>{
                        $("<li>").html(
                            $("<a>")
                            .attr("href", `/bleats/${bleat.id}`)
                            .text(bleat.body)
                        )
                    })
                $bleatsUl.append($lis)
            },
            error: function () {
                console.log("error!")
            }
        })
    }
///=========== AJAX forms
const $bleatForm = $("#bleat-form")
const $bleatBody = $bleatform.find("#bleat-body")
$bleatForm.on("submit", function (e) {
    e.preventDefault();
    const bodyText = $bleatBody.val();
    $bleatsBody.val("")
    $.ajax({
        method: "POST",
        url: "/api/bleats",
        data: { bleat: { body: bodyText, author_di: 1 } }
        success: function (bleat) {
            $bleatsUl.append(
                $("<li>").html(
                    $("<a>").attr("href", `/bleats/${bleat.id}`)
                    .text(bleat.body)
                )
            )
        },
        error: function () {
            console.log("error!")
        }
    })
})
}



