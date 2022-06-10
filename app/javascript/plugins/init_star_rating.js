import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
