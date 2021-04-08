import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import FeedbackForm from '../FeedbackForm';
import FeedbackStore from '../stores/FeedbackStore';

describe('<FeedbackForm />', () => {
  const store = new FeedbackStore();
  const wrapper = mount(<FeedbackForm store={store} />);
  const name1 = 'john smith';
  const name2 = 'ropes user';
  const comment1 = 'one comment';
  const comment2 = 'another comment';

  it('should have an h3 message', () => {
    expect(wrapper.find('h3')).to.have.lengthOf(1);
  });

  it('should have an empty userName input', () => {
    expect(wrapper.find('input#feedback-username')).to.have.lengthOf(1);
    expect(wrapper.find('input#feedback-username').text()).to.equal('');
  });

  it('should have an empty comment input', () => {
    expect(wrapper.find('input#feedback-comment')).to.have.lengthOf(1);
    expect(wrapper.find('input#feedback-comment').text()).to.equal('');
  });

  it('should update userName field of store', () => {
    const input = wrapper.find('input#feedback-username');

    input.simulate('change', { target: { value: name1 } });
    expect(store.userName).to.equal(name1);
    input.simulate('change', { target: { value: name2 } });
    expect(store.userName).to.equal(name2);
  });

  it('should update comment field of store', () => {
    const input = wrapper.find('input#feedback-comment');

    input.simulate('change', { target: { value: comment1 } });
    expect(store.comment).to.equal(comment1);
    input.simulate('change', { target: { value: comment2 } });
    expect(store.comment).to.equal(comment2);
  });
});

