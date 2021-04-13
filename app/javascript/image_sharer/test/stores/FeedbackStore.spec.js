import { expect } from 'chai';
import { describe, it, afterEach } from 'mocha';
import sinon from 'sinon';
import FeedbackStore from '../../stores/FeedbackStore';
import * as api from '../../postFeedback';

describe('FeedbackStore', () => {
  afterEach(() => { sinon.restore(); });

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

  it('sets message and fills fields on successful post', () => {
    const feedbackStore = new FeedbackStore();
    const message = 'some message';
    sinon.stub(api, 'postFeedback').withArgs('username', 'comment').resolves({ message });

    feedbackStore.setUserName('username');
    feedbackStore.setComment('comment');
    return feedbackStore.submitFeedback().then(() => {
      expect(feedbackStore.userName).to.equal('');
      expect(feedbackStore.comment).to.equal('');
      expect(feedbackStore.message).to.equal(message);
    });
  });

  it('sets message when postFeedback fails', () => {
    const feedbackStore = new FeedbackStore();
    const message = 'some message';
    sinon.stub(api, 'postFeedback').withArgs('username', 'comment').rejects({ message });

    feedbackStore.setUserName('username');
    feedbackStore.setComment('comment');
    return feedbackStore.submitFeedback().then(() => {
      expect(feedbackStore.userName).to.equal('username');
      expect(feedbackStore.comment).to.equal('comment');
      expect(feedbackStore.message).to.equal(message);
    });
  });
});

