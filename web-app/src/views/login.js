import React, { PropTypes } from 'react'
import { Row, Col, Input, ButtonInput } from 'react-bootstrap'
import { Link } from 'react-router'
import Alert from '../partials/alert'
import Auth from '../auth'

// Login page for nemo
class Login extends React.Component {
  constructor (props, context) {
    super(props)

    context.router

    this.handleSubmit = this.handleSubmit.bind(this)
  }

  // Handle login via auth api call
  handleSubmit (event) {
    event.preventDefault()

    var email = this.refs.email.getValue()
    var password = this.refs.password.getValue()

    Auth.login(email, password, (error) => {
      if (!error) {
        this.context.router.replace('/user')
      } else {
        Alert(error, 'danger', 4 * 1000)
      }
    })
  }

  // Once mounted set page title
  componentDidMount () {
    document.title = 'Nemo Login'
  }

  // Render login page
  render () {
    return (
      <Row>
        <Col sm={4} smOffset={4} md={4} mdOffset={4}>
          <form onSubmit={this.handleSubmit} autoComplete='on'>
            <h2 >Please Login</h2>
            <Input ref='email' type='email' label='Email Address' placeholder='Enter email' required />
            <Input ref='password' type='password' label='Password' placeholder='Enter password' required />
            <ButtonInput type='submit' value='Login' bsStyle='primary' block/>
          </form>
          <Row>
            <Col sm={6} md={6} smOffset={6} mdOffset={6}>
              <span>
                <Link to='/signup' style={{float: 'right'}}> signup </Link>
              </span>
            </Col>
          </Row>
        </Col>
      </Row>
    )
  }
}

Login.contextTypes = {
  router: PropTypes.object.isRequired
}

export default Login
