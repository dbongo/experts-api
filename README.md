# EverlyWell Challenge

## Overview

Using a language and framework of your choice, we'd like you to create a simple experts directory search tool. The tool can either be a full featured application or API only.

* Spend, at max, 3 hours on this project.

## Requirements

The application should fulfill the following requirements:

1. A member can be created using their name and a personal website address.
2. When a member is created, all the heading (h1-h3) values are pulled in from the website to that members profile.
3. The website url is shortened (e.g. using http://goo.gl).
4. After the member has been added, I can define their friendships with other existing members. Friendships are bi-directional i.e. If David is a friend of Oliver, Oliver is always a friend of David as well.
5. The interface should list all members with their name, short url and the number of friends.
6. Viewing an actual member should display the name, website URL, shortening, website headings, and links to their friends' pages.
7. Now, looking at Alan's profile, I want to find experts in the application who write about a certain topic and are not already friends of Alan.
8. Results should show the path of introduction from Alan to the expert e.g. Alan wants to get introduced to someone who writes about 'Dog breeding'. Claudia's website has a heading tag "Dog breeding in Ukraine". Bart knows Alan and Claudia. An example search result would be Alan -> Bart -> Claudia ("Dog breeding in Ukraine").

We encourage the use of any libraries for everything except the search functionality, in which we want to see your simple algorithm approach.

## Submission

Once you've completed the technical requirements, submit the code to us somehow! Be original!

## MODEL

```
member
- id (integer)
- name (text)
- long_url (text)
- short_url (text)
- headings (heading array)
- friends (friend array)

friend
- id (integer)
- member_id (integer)

heading
- id (integer)
- member_id (integer)
- title (text)
```

## API

```
HTTP request
POST /api/experts
Content-Type: application/json

Request body
{
  "name": string,
  "long_url": string
}

Response body
{
  "status": "ok",
  "member": {
    "name": string,
    "long_url": string,
    "short_url": string,
    "headings": [string],
    "friends": [string]
  }
}
```

```
HTTP request
GET /api/experts
Content-Type: application/json

Response body
{
  "status": "ok",
  "members": [
    {
      "name": string,
      "short_url": string,
      "friends": integer
    }
  ]
}
```

```
HTTP request
GET /api/experts/{id}
Content-Type: application/json

Response body
{
  "status": "ok",
  "member": {
    "name": string,
    "long_url": string,
    "short_url": string,
    "headings": [string],
    "friends": [string]
  }
}
```
