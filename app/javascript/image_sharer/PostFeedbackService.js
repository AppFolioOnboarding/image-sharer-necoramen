import { post } from './utils/helper';

export default class PostFeedbackService {
  postFeedback(store) {
    return post('/api/feedbacks', {
      username: store.userName,
      comment: store.comment,
    });
  }
}

