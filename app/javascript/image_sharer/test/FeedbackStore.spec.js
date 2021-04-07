import { expect } from 'chai';
import { describe, it } from 'mocha';
import FeedbackStore from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('should be initialized with empty strings', () => {
    const feedbackStore = new FeedbackStore();
    expect(feedbackStore.userName).to.equal('');
    expect(feedbackStore.comment).to.equal('');
  });

  it('should be able to set userName', () => {
    const feedbackStore = new FeedbackStore();
    feedbackStore.setUserName('someUserName');
    expect(feedbackStore.userName).to.equal('someUserName');
  });

  it('should be able to set comment', () => {
    const feedbackStore = new FeedbackStore();
    feedbackStore.setComment('someComment');
    expect(feedbackStore.comment).to.equal('someComment');
  });
});

