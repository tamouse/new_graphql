import React from "react"
import PropTypes from "prop-types"
class DisplayUser extends React.Component {
  render () {
    return (
      <React.Fragment>
        User: <pre><code>{JSON.stringify(this.props.user, {}, 2)}</code></pre>
      </React.Fragment>
    );
  }
}

DisplayUser.propTypes = {
  user: PropTypes.object
};
export default DisplayUser
