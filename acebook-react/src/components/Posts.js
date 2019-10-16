import React, { Component } from 'react'

class Posts extends React.Component {
  constructor() {
    super();
    this.state = {
      posts: []
    }
  }

  componentDidMount() {
    this.fetchData()
  }

  handleDelete(event) {
    event.preventDefault();
    const data = new FormData(event.target);
    console.log(event);
    fetch('http://localhost:3000/api/v1/posts/', {
      method: 'DELETE',
      body: data,
    }
  ).then(response => response.json()
).then(data => this.fetchData())
}

fetchData() {
  fetch('http://localhost:3000/api/v1/posts/', {
    method: 'GET',
  }
).then(response => response.json())
.then(data => this.setState({
  isLoaded: true,
  posts: data
}))
}

handleSubmit(event) {
  event.preventDefault();
  const data = new FormData(event.target);
  console.log(event);
  fetch('http://localhost:3000/api/v1/posts/', {
    method: 'POST',
    body: data,
  }
).then(response => response.json()
).then(data => this.fetchData())
}

handleUpdate(event) {
  event.preventDefault();
  const data = new FormData(event.target);
  fetch('http://localhost:3000/api/v1/posts/', {
    method: 'PUT',
    body: data,
  }
).then(response => response.json()
).then(data => this.fetchData())
document.getElementById(`${event.target[0].value}`).text="";
console.log(document.getElementById(`${event.target[0].value}`))
}

render() {
  const { posts } = this.state;
  console.log(posts)
  return (
    <div>
    <h1>Posts</h1>
    {posts.map(post => (
      <div key={post.id}>
      <form onSubmit={this.handleDelete.bind(this)}>
        {post.message}
        <input id="id" name="id" value={post.id} type="text" readOnly hidden />
        <button>delete</button>
      </form>
      <form onSubmit={this.handleUpdate.bind(this)}>
        <input id="id" name="id" value={post.id} type="text" readOnly hidden />
        <input id={post.id} name="message" type="text"/>
        <button>update</button>
      </form>
    </div>
    ))}
    <form onSubmit={this.handleSubmit.bind(this)}>
      <input id="newMessage" name="message" type="text"/><br/>
    <button type="submit">Add Post</button>
    </form>
    </div>
  );
}
}
export default Posts;
