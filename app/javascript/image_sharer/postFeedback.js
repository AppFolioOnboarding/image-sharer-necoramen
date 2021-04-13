import { post } from './utils/helper';

// eslint-disable-next-line import/prefer-default-export
export function postFeedback(username, comment) {
  return post('/api/feedbacks', {
    username,
    comment,
  });
}

