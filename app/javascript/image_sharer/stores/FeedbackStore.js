import { observable, action } from 'mobx';
import * as api from '../postFeedback';

export default class FeedbackStore {
  @observable userName = ''
  @observable comment = ''
  @observable message = ''

  @action
  setUserName(newUserName) {
    this.userName = newUserName;
  }

  @action
  setComment(newComment) {
    this.comment = newComment;
  }

  @action
  submitFeedback() {
    return api.postFeedback(this.userName, this.comment)
      .then((data) => {
        this.message = data.message;
        this.userName = '';
        this.comment = '';
      })
      .catch((data) => { this.message = data.message; });
  }
}
