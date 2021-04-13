import React from 'react';
import { observer } from 'mobx-react';
import PropTypes from 'prop-types';

function FeedbackForm({ store }) {
  const updateUserName = (e) => {
    store.setUserName(e.target.value);
  };
  const updateComment = (e) => {
    store.setComment(e.target.value);
  };
  const submitFeedback = () => {
    store.submitFeedback();
  };


  return (
    <div>
      <br />
      <p className="js-feedback-message">{store.message}</p>
      <h3>Tell us what you think</h3>
      <label htmlFor="feedback-username">
        Your name:
        <br />
        <input id="feedback-username" onChange={updateUserName} value={store.userName} />
      </label>
      <br />
      <label htmlFor="feedback-comment">
        Comments:
        <br />
        <input id="feedback-comment" onChange={updateComment} value={store.comment} />
      </label>
      <br />
      <button onClick={submitFeedback} className='btn btn-primary'>Submit</button>
    </div>
  );
}

FeedbackForm.protoType = {
  store: PropTypes.object.isRequired,
};

export default observer(FeedbackForm);
