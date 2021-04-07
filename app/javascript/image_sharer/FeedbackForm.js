import React from 'react';
import { observer, inject } from 'mobx-react';

export class FeedbackForm extends React.Component {
  render() {
    return (
      <div>
        <br />
        <h3>Tell us what you think</h3>
        <form className="form-group" acceptCharset="UTF-8" method="post">
          <label htmlFor="feedback-username">
            Your name:
            <br />
            <input id="feedback-username" onChange={this.updateUserName} value={this.props.feedbackStore.userName} />
          </label>
          <br />
          <label htmlFor="feedback-comment">
            Comments:
            <br />
            <input id="feedback-comment" onChange={this.updateComment} value={this.props.feedbackStore.comment} />
          </label>
          <br />
          <button type="submit">Submit</button>
        </form>
      </div>
    );
  }

  updateUserName(event) {
    this.props.feedbackStore.setUserName(event.target.value);
  }

  updateComment(event) {
    this.props.feedbackStore.setComment(event.target.value);
  }
}

export default inject('feedbackStore')(observer(FeedbackForm));
