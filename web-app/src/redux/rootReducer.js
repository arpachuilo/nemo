import { combineReducers } from 'redux'
import { routerReducer as router } from 'react-router-redux'
import nemoQuestions from './modules/nemoQuestions'
import questionCreator from './modules/questionCreator'

// Combine our reducers along with our router
export default combineReducers({
  nemoQuestions,
  questionCreator,
  router
})
