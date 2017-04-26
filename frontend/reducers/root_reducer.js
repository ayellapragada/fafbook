import { combineReducers } from 'redux';

import SessionReducer from './session_reducer';
import UserReducer from './user_reducer';
import FriendsReducer from './friends_reducer';

const RootReducer = combineReducers({
  session: SessionReducer,
  user: UserReducer,
  friends: FriendsReducer
})

export default RootReducer;
