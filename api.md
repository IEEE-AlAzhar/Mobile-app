# API data



### LOGIN

#### POST Request

**Request:** `/user/login`

##### -body =>
```json
{
  "code": "1000"
}
```

**Response:**

- **200:**

```json
{
  "auth": true,
  "token": "averylongtoken34957345sfdghkl",
  "userData": {
    "_id": "5eb56c0f6848bf27800b2353",
    "code": "1000",
    "name": "username",
    "phone": "0100000000",
    "image": "https://via.placeholder.com/500?text=image+1",
    "role": "officer", // optional
    "type": "officer",
    "committee": "web",
    "feedbacks": [
      {
        "_id": "2",
        "title": "feedback 1",
        "date": "26-4-2020",
        "body": "Fake feedback"
      },
      {
        "_id": "1",
        "title": "feedback 2",
        "date": "26-5-2020",
        "body": "Fake feedback"
      }
    ],
    "achievements": [
      {
        "_id": "2",
        "title": "title 1",
        "date": "26-5-2020",
        "description": "Lorem ipsum"
      },
      {
        "_id": "1",
        "title": "title 2",
        "date": "26-5-2020",
        "description": "Lorem ipsum"
      }
    ]
  }
}
```

- **404:**

```json
{
  "msg": "User does not exist!"
}
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!",
  "error": {"error here"},
}
```



### CHANGE USER IMAGE

#### PUT Request

**Request:** `/user/:_id/image`

##### -Headers =>
```json
{
  "x-access-token": "{user token here}"
}
```

##### -Body =>
```json
{
  "image": "{new image here}"
}
```

**Response:**


- **200:**

```json
{
  "image": "{updated image here}"
}
```

- **404:**

```json
{
  "msg": "User does not exist!"
}
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!",
  "error": {"error here"},  
}
```



### CHANGE USER PHONE

#### PUT Request

**Request:** `/user/:_id/phone`

##### -headers =>
```json
{
  "x-access-token": "{user token here}"
}
```

##### -body =>
```json
{
  "phone": "{new phone here}"
}
```

**Response:**

- **200:**

```json
{
  "phone": "{updated phone here}"
}
```

- **404:**

```json
{
  "msg": "User does not exist!"
}
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!",
  "error": {"error here"},  
}
```



### GET ANNOUNCEMENTS

#### GET Request

**Request:** `/announcements`

##### -headers =>
```json
{
  "x-access-token": "{user token here}"
}
```

**Response:**

- **200:**

```json
[
  {
    "_id": "1",
    "title": "Announcement 1",
    "body": "Fake data for announcement ",
    "date": "26-04-2020",
    "type": "operation", // or 'general'/'technical'
    "cover": "https://via.placeholder.com/500?text=image+1"
  },
  {
    "_id": "2",
    "title": "Announcement 2",
    "body": "Fake data for announcement ",
    "date": "26-04-2020",
    "type": "operation", // or 'general'/'technical'
    "cover": "https://via.placeholder.com/500?text=image+1"
  }
]
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!"
}
```