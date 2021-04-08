import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'mobx-react';
import Footer from './Footer.jsx';
import FeedbackForm from './FeedbackForm.js';
import FeedbackStore from './stores/FeedbackStore';

const feedbackStore = new FeedbackStore();

ReactDOM.render(
  <Provider store={feedbackStore}>
    <FeedbackForm />
  </Provider>,
  document.getElementById('feedback-form')
);

ReactDOM.render(
  <Footer />,
  document.getElementById('footer')
);
