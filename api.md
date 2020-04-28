# API data

### Login

#### post Request

**Request:** `/users/login`

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
    "id": "1000",
    "name": "username",
    "phone": "0100000000",
    "image": "https://via.placeholder.com/500?text=image+1",
    "role": "officer", // optional
    "type": "officer",
    "committee": "web",
    "feedbacks": [
      {
        "id": "2",
        "title": "feedback 1",
        "date": "26-4-2020",
        "body": "Fake feedback"
      },
      {
        "id": "1",
        "title": "feedback 2",
        "date": "26-5-2020",
        "body": "Fake feedback"
      }
    ],
    "achievements": [
      {
        "id": "2",
        "title": "title 1",
        "date": "26-5-2020",
        "description": "Lorem ipsum"
      },
      {
        "id": "1",
        "title": "title 2",
        "date": "26-5-2020",
        "description": "Lorem ipsum"
      }
    ]
  }
}
```

- **401:**

```json
{
  "msg": "User not found, please try again with a valid code!"
}
```

### change user image

#### put Request

**Request:** `/users/:id/image`

```json
{
  "image": "{new image here}"
}
```

**Response:**

- **200:**

```json
{
  "msg": "Image updated successfully !",
  "image": "{updated image here}"
}
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!"
}
```

### change user phone

#### put Request

**Request:** `/users/:id/phone`

```json
{
  "phone": "{new phone here}"
}
```

**Response:**

- **200:**

```json
{
  "msg": "Phone updated successfully !",
  "phone": "{updated phone here}"
}
```

- **500:**

```json
{
  "msg": "An error occurred, please try again later!"
}
```

### Get announcements

#### get Request

**Request:** `/announcements`

**Response:**

- **200:**

```json
[
  {
    "id": "1",
    "title": "Announcement 1",
    "body": "Fake data for announcement ",
    "date": "26-04-2020",
    "type": "operation", // or 'general'/'technical'
    "cover": "https://via.placeholder.com/500?text=image+1"
  },
  {
    "id": "2",
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
