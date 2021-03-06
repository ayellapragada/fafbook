import React from 'react';
import { connect } from 'react-redux';
import { updateUser } from '../../actions/user_actions';
import { updateCurrentUser } from '../../actions/session_actions.js';


class UploadPhotoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: null,
      cover: null,
    };

    this.updateProfile = this.updateProfile.bind(this);
    this.updateCover = this.updateCover.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  updateProfile(e) {
    const file = e.currentTarget.files[0];
    const fileReader = new FileReader();
    fileReader.onloadend = () => {
      this.setState({profile: file});
    };

    if (file) {
      fileReader.readAsDataURL(file);
    }

  }

  updateCover(e) {
    const fileReader = new FileReader();
    const file = e.currentTarget.files[0];
    fileReader.onloadend = () => {
      this.setState({cover: file});
    };

    if (file) {
      fileReader.readAsDataURL(file);
    }

  }


  handleSubmit(e) {
    e.preventDefault();
    var formData = new FormData();
    if (this.state.profile) {
      formData.append("user[profile_photo]", this.state.profile);
    }

    if (this.state.cover) {
      formData.append("user[cover_photo]", this.state.cover);
    }
    this.props.updateUser(this.props.user, formData)
      .then( () => this.props.updateCurrentUser());
    this.setState({caption: "", imageFile: null, imageUrl: null});
    this.props.closeModal();
  }

  render() {
    return(
      <div className={"upload-photo-form"}>
        <div className="profile-upload">
        <label> Profile Photo
          <input type="file" onChange={this.updateProfile}/>
        </label>
      </div>
      <div className="cover-upload">
        <label> Cover Photo
          <input type="file" onChange={this.updateCover}/>
        </label>
      </div>
        <button onClick={this.handleSubmit}>Change Photos!</button>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  user:  state.session.currentUser
});

const mapDispatchToProps = dispatch => ({
  updateUser: (userId, user, form) => dispatch(updateUser(userId, user, form)),
  updateCurrentUser: () => dispatch(updateCurrentUser())
});

export default connect(mapStateToProps, mapDispatchToProps)(UploadPhotoForm);

