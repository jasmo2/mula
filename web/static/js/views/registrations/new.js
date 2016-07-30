import React, {PropTypes}   from 'react';
import { connect }          from 'react-redux';
import { Link }             from 'react-router';

import { setDocumentTitle, renderErrorsFor } from '../../utils';
import Actions              from '../../actions/registrations';

class RegistrationsNew extends React.Component {
  componentDidMount() {
    setDocumentTitle('Sign up');
  }

  _handleSubmit(e) {
    e.preventDefault();

    const { dispatch } = this.props;

    const data = {
      name: this.refs.name.value,
      last_name: this.refs.lastName.value,
      email: this.refs.email.value,
      password: this.refs.password.value,
      password_confirmation: this.refs.passwordConfirmation.value,
    };

    dispatch(Actions.signUp(data));
  }

  render() {
    const { errors } = this.props;

    return (
      <div className="view-container registrations new">
        <main>
          <header>
            <div className="logo" />
          </header>
          <form onSubmit={::this._handleSubmit}>
            <div className="field">
              <input ref="name" type="text" placeholder="Nombre" required={true} />
              {renderErrorsFor(errors, 'name')}
            </div>
            <div className="field">
              <input ref="lastName" type="text" placeholder="Apellido" required={true} />
              {renderErrorsFor(errors, 'last_name')}
            </div>
            <div className="field">
              <input ref="email" type="email" placeholder="Correo Electrónico" required={true} />
              {renderErrorsFor(errors, 'email')}
            </div>
            <div className="field">
              <input ref="password" type="password" placeholder="Contraseña" required={true} />
              {renderErrorsFor(errors, 'password')}
            </div>
            <div className="field">
              <input ref="passwordConfirmation" type="password" placeholder="Confirmación Contraseña" required={true} />
              {renderErrorsFor(errors, 'password_confirmation')}
            </div>
            <button type="submit">Incribirse</button>
          </form>
          <Link to="/sign_in">Ingresar</Link>
        </main>
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  errors: state.registration.errors,
});

export default connect(mapStateToProps)(RegistrationsNew);
