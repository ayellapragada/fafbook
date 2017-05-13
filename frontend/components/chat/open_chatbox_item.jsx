import React from 'react';
import Messages from './messages.jsx';
import { Link } from 'react-router';
import onClickOutside from 'react-onclickoutside';

class OpenChatboxItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {body: "", user_id: this.props.currentUser.id, active: true};

    this.handleCloseChat = this.handleCloseChat.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleActive = this.handleActive.bind(this);
    this.checkSubmit = this.checkSubmit.bind(this);
  }

  componentDidMount() {
    this.props.getMessages(this.props.chat.conversation.id);
  }

  handleCloseChat() {
    this.props.closeChat(this.props.chat);
  }

  handleChange(e) {
    this.setState({body: e.currentTarget.value});
  }

  handleClickOutside(e) {
    this.setState({active: false});
  }

  handleActive() {
    this.setState({active: true});
  }

  checkSubmit(e) {
    if (e.keyCode === 13 && e.shiftKey === false) {
      this.handleSubmit(e);
    } 
  }

  handleSubmit(e) {
    this.props.sendMessage(
      this.props.chat.conversation.id,
      this.state.user_id,
      this.state.body
    ).then(() => this.setState({body: ""}));
  }

  render() {
    let activeClassName = `chatbox-header ${this.state.active ? 
        "active-chatbox" : ""}`;
    return (
      <div 
        className="open-chatbox-item"
        onClick={this.handleActive}>
        <div className={activeClassName} onClick={this.props.toggleOpen} >
          <div className="chatbox-header-name">
            <Link to={`/profile/${this.props.otherUser.id}`}>
              {`${this.props.otherUser.fname} ${this.props.otherUser.lname}`}
            </Link>
          </div>

          <div className="chatbox-header-controls">
            <i onClick={this.handleCloseChat} 
              className="fa fa-times" aria-hidden="true"></i>
          </div>

        </div>

        <Messages 
          currentUser={this.props.currentUser}
          chat={this.props.chat} 
        />

      <div className="send-chat-message">
        <textarea 
          className="send-chat-textarea"
          value={this.state.body}
          placeholder="Type a message"
          onKeyDown={this.checkSubmit} 
          onChange={this.handleChange} />
      </div>
    </div>
    );
  }
}

export default onClickOutside(OpenChatboxItem);