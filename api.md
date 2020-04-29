# API data



### LOGIN

#### POST Request

**Request:** `/user/login`

```json
{
  "code": "1000"
}
```

**Response:**

- **200:**

```json
{
  "token": "averylongtoken34957345sfdghkl",
  "user": {
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



### CHANGE USER IMAGE

#### PUT Request

**Request:** `/user/:code/image`

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
  "msg": "An error occurred, please try again later!"
}
```



### CHANGE USER PHONE

#### PUT Request

**Request:** `/user/:code/phone`

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
  "msg": "An error occurred, please try again later!"
}
```



### GET ANNOUNCEMENTS

#### GET Request

**Request:** `/announcements`

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