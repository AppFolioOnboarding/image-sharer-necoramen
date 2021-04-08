import React from 'react';
import { inject } from 'mobx-react';

@inject('store')
export default class FeedbackForm extends React.Component {
  render() {
    return (
      <div>
        <br />
        <h3>Tell us what you think</h3>
        <form className="form-group" acceptCharset="UTF-8" method="post">
          <label htmlFor="feedback-username">
            Your name:
            <br />
            <input id="feedback-username" onChange={this.updateUserName} value={this.props.store.userName} />
          </label>
          <br />
          <label htmlFor="feedback-comment">
            Comments:
            <br />
            <input id="feedback-comment" onChange={this.updateComment} value={this.props.store.comment} />
          </label>
          <br />
          <button type="submit">Submit</button>
        </form>
      </div>
    );
  }

  updateUserName(event) {
    this.props.store.setUserName(event.target.value);
  }

  updateComment(event) {
    this.props.store.setComment(event.target.value);
  }
}
