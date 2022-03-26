
# API SOCIAL NETWORK

This is an API made in Rails and Ruby 3.0.0

## API Reference

#### Get all items

```http
All paths
```

| Parameter | Type     | Data Response                |
| :-------- | :------- | :-------------------------- |
| `/users` | `string` |  id, email, username, avatar |
| `/sessions` | `string` |  username, password |
| `/registrations` | `string` |  username, email, password, password_confirmation |
| `/posts` | `string` |  body, user_id, counters |
| `/comments` | `string` |  body_comment, user_id, post_id, counters |


## Author

- [@ChristianMRtz](https://www.github.com/ChristianMRtz)

