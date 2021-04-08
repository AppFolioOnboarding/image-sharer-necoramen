import { observable, action } from 'mobx';

export default class FeedbackStore {
  @observable userName = ''
  @observable comment = ''

  @action
  setUserName(newUserName) {
    this.userName = newUserName;
  }

  @action
  setComment(newComment) {
    this.comment = newComment;
  }
}
