// redux lets us keep data in the front end
//need new libraries


inside package 
// npm install redux "^3.7.2",
// "react-redux":"^5.0.6"
//"loadash" :"^4.17.4"
//new folder inside frontend called folders\
//new folder inside frontend called cations 
//new folder inside frontend called reducers 
//new folder inside frontend called store
// insdie store, store.js 

import { createStore } from 'redux';

const rootReducer = (state, action) => {

    return {};
}   


// createStore takes in a reducer
const store = createStore(rootReducer);
export default store;

store.dispatch({
    type: " DESIRED_FUNCTION",
    bleat:{ id:4, body: "idk", author_id: 1}
});// makes changes to the state
//  the object will then get passed onto to the reducer passed into the reducer
store.getState();//returns all stored states


//desired return from the root 

{
    1: {
        authord_id: 1,
            body: "idk,
        id: 1"}
    }
    // initial design of root reducer
    const rootReducer = (state = {}, action) => {

        return state;
    }

    //next phase taking action 
    const rootReducer = (state = {}, action) => {
        if (action.type === "ADD_Bleat") {
            const newBleat = aaction.bleat;
            state.bleats ||= { };
            const newBleats = Object.assign({}, state.bleats, {
                [newBleat.id]: newBleat // because old states shouldnt be modifed
            })
            // state.bleats = newBLeat; //commented out to not modifiy old states
            state = oBject.assign({}, state, { bleat: newBleats });
        }
        return state;
    }
    import merge from 'lodash/merge'
}
// root reducer goes into a separte file 
///------------ Redux Reducers

{ 
    bleats: {

    },
    // these are separte slices of states
    location: {
        
    }
    
}

// after move root rdeucer to anoter folder 

const sotre

const store = createStore(rootReducer);
export default store;


// inside new bleats_reducers
import merge from 'lodash/merge'
import rootreducer from 'rootredcuer direct'
const bleatsReducer = (state = {}, action) => {
    
  

    switch (action.type) {
        case "Add_Bleat":
            const newBleat = aaction.bleat;
            // state.bleats ||= { };
            state = Object.assign({}, state, {
                [newBleat.id]: newBleat // because old states shouldnt be modifed
            })
            // state.bleat;s = newBLeat; //commented out to not modifiy old states
            // state = oBject.assign({}, state, { bleat: newBleats });
        default: //if case stattement didnt hit
            return state;
    }
    }
    return state;
}
 //modified rootreducer 
const rootReducer = (state = {}, action) => {
  
    return {
        bleats: bleatsReducer(state.bleats, action)
    }
}

//can also be written as 

const rootReducer = combineReducers({
    bleats: bleatsReducer,
})

/////-0---------------------------- action creaters

inside actions foldeer 
export const ADD_BLEAT = "ADD_BLEAT";
let nextID = 0;
export const addBleat = (body) => {
    nextID++; // everytime this function is called the ID gets incremented
    return {
        type: ADD_BLEAT, // inorder to stay safe from bugs, this can be turnedin to a const
        bleat: { id:4, body: "idk", authord_idx:1 }
    }
}
// chgne the same in bleat reducer
import { ADD_BLEAT} from ""

const bleatsReducer = (state = {}, action) => {

Object.freeze(state) // prevents state being modified

    switch (action.type) {
        case "Add_Bleat":
            const newBleat = aaction.bleat;
            // state.bleats ||= { };
            state = Object.assign({}, state, {
                [newBleat.id]: newBleat // because old states shouldnt be modifed
            })
        // state.bleat;s = newBLeat; //commented out to not modifiy old states
        // state = oBject.assign({}, state, { bleat: newBleats });
        default: //if case stattement didnt hit
            return state;
    }
}
// store.dispatch(addBleat("whatever"))
/////------------------------- React-Redux Intro 
// inside entry file where we render pass in store as a prop 

ReactDOM.render(<App store={store} name: { name } />, root)
//  add store prop in the app component as well 
const App = ({ store, name }) => {
    return <Provider store={store} >
        <section> </section>
    
    </Provider> // this will be the container compoinenet

}

/// inside componenet create bleat_index_container.js 

import { connect } from 'react-redux';
import BleatIndex from './bleat_index';

// connect functions create a function when invoked 
const mapStateToProps = (bleats ) => {
    return {
        bleats: Object.values(state.bleats)
    };
};

const contatinerFunc = connect(mapStateToProps);
const connectedBleatIndex = containerFunc(BleatIndex);

export default connectedBleatIndex;


//// ---------------- Map Disptach To Props 

// inside components , bleat_form jsx 

import react from 'react';
class BleatForm extends React.Component  {
    constructore(props){
        super(props)

        this.state = {};
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field) {
        return (e) => {
            this.setState({[field]: e.target.value})
        }
    }

    updateBody(e) { // will be replaced withcode above
        this.setState({body: e.target.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        // e.target
        this.props.dispatchAddBleat(this.state.body)
        this.setState({body: ""})
    }

    render() { // htmlFor will accept React.createElement("label", {htmlFor: "bleat-body"})
        return <form onSubmit={ this.handleSubmit}>
            <label htmlFor="bleat-body">Body</label> 
            <input t
                ype="text"
                id="bleat-body"
                onChange={this.update("Body")}
                vvalue= {this.state.body} //this will help it change
            ></input>
            <button>Create</button>
        </form>
    }
}

//inside componenets create bleat_form_container.js 
import { connect } from 'react-redux';
import { addBleat } from '../actions/beats_actions';
import BleatFrom from './bleat_form';
const mapStateToProps = (state) => {
    return {}
}
const mapDispatchToProps = () => {
    return {
        dispatchAddBleat: () => dispatch(addBleat())
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(BleatForm)

// inside our App componenet
import BleatIndex from './bleat_index_container'
import { Provider } from 'react-redux'
import BleatForm from './/bleat_form_container'

const App = ({ store, name }) => {
    return <Provider store={store}>
        <section>
            <h1> Hello, {name}</h1>
            <DogIndex />
            <BleatForm />
            <BleatIndex />
        </section>
    </Provider>
}