import * as APIUtil from '../util/user_api_util';
import * as PhotoUtil from '../util/photo_api_util';

export const RECEIVE_VIEWED_USER = "RECEIVE_VIEWED_USER";

export const receiveViewedUser = user => ({
  type: RECEIVE_VIEWED_USER,
  user
});

export const fetchUser = id => dispatch => (
  APIUtil.getUser(id)
  .then(user => dispatch(receiveViewedUser(user)))
);

export const fetchUserPhotos = id => dispatch => (
  APIUtil.getUserPhotos(id)
  .then(user => dispatch(receiveViewedUser(user)))
);

export const fetchUserFriends = id => dispatch => (
  APIUtil.getUserFriends(id)
  .then(user => dispatch(receiveViewedUser(user)))
);

export const updateUser = (user, form) => dispatch => (
  APIUtil.patchUser(user, form)
  .then(updatedUser => dispatch(receiveViewedUser(updatedUser)))
);

export const updateProfile = (id, profile) => dispatch => (
  APIUtil.patchProfile(id, profile)
  .then(user => dispatch(receiveViewedUser(user)))
);

export const uploadPhoto = (photo) => dispatch => (
  PhotoUtil.createPhoto(photo)
  .then(user => dispatch(receiveViewedUser(user)))
);
