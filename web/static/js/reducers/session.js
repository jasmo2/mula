import Constants from '../constants';

const initialState = {
  currentEmployee: null,
  socket: null,
  channel: null,
  error: null,
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    case Constants.CURRENT_EMPLOYEE:
      return { ...state, currentEmployee: action.currentEmployee, socket: action.socket, channel: action.channel, error: null };

    case Constants.EMPLOYEE_SIGNED_OUT:
      return initialState;

    case Constants.SESSIONS_ERROR:
      return { ...state, error: action.error };

    default:
      return state;
  }
}
