USER_FIELDS_FRAGMENT = %q|
fragment UserFields on UserGraph {
  id
  username
  email
  admin
  preferredName
  preferredPronouns
  createdAt
  updatedAt
}
|

POST_FIELDS_FRAGMENT = %q|
fragment PostFields on Post {
  id
  title
  body
  published
  createdAt
  updatedAt
  userId
}
|
