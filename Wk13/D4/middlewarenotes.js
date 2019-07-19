// middleware is a point between dispatch and store where we inject other element
import {createStre, applyMiddleware} from 'redux'

const myMiddleware = function () {
    return function (next) {
        return function (action) {
            return next(action) // returns  what was returned from the enxt
            store; next; action;  // this function is injected between dispatch and function
        }
    }
}

const myOtherMiddleware = function () {
    return function (next) {
        return function (action) {
            return next(action) //returns what was reutnred from next which is reducer
            store; next; action; //only here for debugger
             // this function is injected between dispatch and function
        }
    }
}

// why this middleware?? 
//last argument of middleware will always be implicitly be dispatch
// how it will usually be writtne 

const myMiddleware = storey => next => action => {

}



const preloadedState = {}
const store = createStore(
    rootReducer,
    preloadedState,
    applyMIddleware(myMiddleware, myOtherMiddleware) // apply middleware expects a function that is 3 levels deep
)


/// what is a thunk?
// thunk is a specific library that is a middleware that allows dispatch functions that will gett
// called during some prcoess of dispatch 


// inside frontend folder creat thunk folder 

// into  thunk 

const thunk = storey => next => action => {
    if (typeof action === "function") {
        return action();
    }else {
        next(action);
    }    
}
// store.dispatch({
//     typ: "ADD_BLEAT";
//     bleat: {}
// })

// const promise = store.dispatch(() => {
//     $.ajax({
//         url: './api/bleats',
//         method: 'GET'
//     })
// })

// promise.then()

export default thunk;


bleat_actions.js 

export const recieveBleat = (bleats) => {
    return {
        type: RECEIVE_BLEATS,
        bleats
    }
}

export const fetchBleat = (dispatch) => {
    ApiUtil.fetchBleats().then(bleats => { //
        store.distpach(receiveBleats(bleats))
    })      
}                                       // these lines will be the action to be in the thunk

store.disptach(fetchBleat)