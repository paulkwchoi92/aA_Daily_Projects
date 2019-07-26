import React from 'react';
import { connect } from 'react-redux'
import { Redirect, Route, withRouter } from 'react-route-dom';

const mapStateToProps = state => ({
    loggedIn: Boolean(state.session.currentUser);

})

const Auth = ({ loggedIn, path, componenet: Compoenenet }) => (
    <Route 
        path={path}
        render={props => ( 
            loggedIn ? <Redirect to ="/" /> : <Componenet {...props} />

    )}
    />
); // comes from mapped state to props

const Protected = ({ loggedIN, path, componenet: Componenet }) => {
    <Route 
        path={path}
        render={props => (
            loggedIn? <Componenet {...props} /> : <Redirect to="/signup" />
        )}
    />
)

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth))
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected))