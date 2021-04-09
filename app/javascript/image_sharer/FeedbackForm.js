import React from 'react';
import { observer } from 'mobx-react';
import PropTypes from 'prop-types';
import PostFeedbackService from './PostFeedbackService';

function FeedbackForm({ store }) {
  const updateUserName = (e) => {
    store.setUserName(e.target.value);
  };
  const updateComment = (e) => {
    store.setComment(e.target.value);
  };
  const submitFeedback = () => {
    new PostFeedbackService().postFeedback(store);
  };

  return (
    <div>
      <br />
      <h3>Tell us what you think</h3>
      <form className="form-group" acceptCharset="UTF-8">
        <label htmlFor="feedback-username">
          Your name:
          <br />
          <input id="feedback-username" onChange={updateUserName} />
        </label>
        <br />
        <label htmlFor="feedback-comment">
          Comments:
          <br />
          <input id="feedback-comment" onChange={updateComment} />
        </label>
        <br />
        <button onClick={submitFeedback}>Submit</button>
      </form>
    </div>
  );
}

FeedbackForm.protoType = {
  store: PropTypes.object.isRequired,
};

export default observer(FeedbackForm);
