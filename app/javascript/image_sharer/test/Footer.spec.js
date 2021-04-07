import React from 'react';
import { shallow } from 'enzyme';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Footer from '../Footer.jsx';

describe('<Footer />', () => {
  const wrapper = shallow(<Footer />);

  it('should have a paragraph', () => {
    expect(wrapper.find('p')).to.have.lengthOf(1);
  });

  it('should have correct content', () => {
    expect(wrapper.find('p.js-footer').text()).to.equal('Copyright: AppFolio Inc. Onboarding');
  });
});

