import React from 'react';
import Modal from 'react-modal';
import UploadPhotoForm from './upload_photo_form';

class UploadPhoto extends React.Component {
  constructor(props) {
    super(props);

    this.state = {modalIsOpen: false};
    this.openModal = this.openModal.bind(this);
    this.afterOpenModal = this.afterOpenModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }


  componentWillMount() {
    Modal.setAppElement('body');
  }

  openModal() {
    this.setState({modalIsOpen: true});
  }

  afterOpenModal() {
  }

  closeModal() {
    this.setState({modalIsOpen: false});
  }


  render() {
    return (
      <div className={this.props.buttonType}>
        <button onClick={this.openModal}>
          <i className="fa fa-camera-retro" aria-hidden="true"></i>
          {this.props.text}</button>
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          contentLabel="Upload Photo Modal"
          className="upload-photo-modal modal"
          overlayClassName="modal-overlay"
        >
          <button 
            className="modal-close" 
            onSubmit={this.closeModal}
            onClick={this.closeModal}>
            close </button>
          <UploadPhotoForm 
            update={this.props.updateProfile} 
            closeModal={this.closeModal} />

        </Modal> 
      </div>

    );
  }

}

export default UploadPhoto;
