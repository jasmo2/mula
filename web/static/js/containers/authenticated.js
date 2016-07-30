import React        from 'react';
import { connect }  from 'react-redux';
import { routeActions } from 'react-router-redux';

class AuthenticatedContainer extends React.Component {
  componentDidMount() {
    const { dispatch, currentEmployee } = this.props;

    if (localStorage.getItem('phoenixAuthToken')) {
      dispatch(Actions.currentEmployee());
    } else {
      dispatch(routeActions.push('/sign_up'));
    }
  }

  render() {
    // ...
  }
}

const mapStateToProps = (state) => ({
  currentEmployee: state.session.currentEmployee,
});

export default connect(mapStateToProps)(AuthenticatedContainer);
