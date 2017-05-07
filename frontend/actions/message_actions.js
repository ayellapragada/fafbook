import * as APIUtil from '../util/message_api_util';

export const RECEIVE_ALL_CONVERSATIONS = "RECEIVE_ALL_CONVERSATIONS";
export const RECEIVE_CONVERSATION = "RECEIVE_CONVERSATION";
export const DELETE_CONVERSATION = "DELETE_CONVERSATION";

export const receiveAllConversations = (conversations) => ({
  type: RECEIVE_ALL_CONVERSATIONS,
  conversations
});

export const receiveConversation = (conversation) => ({
  type: RECEIVE_CONVERSATION,
  conversation
});

export const deleteConversation = (conversation) => ({
  type: DELETE_CONVERSATION,
  conversation
});

export const fetchAllConversations = () => dispatch => (
  APIUtil.allConversations()
  .then(conversations => dispatch(receiveAllConversations(conversations)))
);

