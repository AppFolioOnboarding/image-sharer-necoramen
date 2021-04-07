import React from 'react';
import ReactDOM from 'react-dom';

import Footer from './Footer.jsx';
import FeedbackForm from './FeedbackForm.js';
import FeedbackStore from './stores/FeedbackStore';

const store = new FeedbackStore();

ReactDOM.render(
  <FeedbackForm store={store} />,
  document.getElementById('feedback-form')
);

ReactDOM.render(
  <Footer />,
  document.getElementById('footer')
);
