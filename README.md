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

## Research and Design

Ruby on Rails API application
- Database - postgres
- Jobs - sidekiq
- Heading parser - nokogiri
- HTTP client - httparty
- Testing - rspec

## Models

### Inverse Relationships

http://railscasts.com/episodes/163-self-referential-association?view=asciicast

`When creating self-referential relationships it’s important to remember that we’re only creating one side of the relationship. Although eifion has paul listed as a friend above, if we were to visit paul’s profile we wouldn’t see eifion listed unless paul had chosen to add him. We need two Friendship records to create a mutual friendship.`

`It’s difficult to think up appropriate names to define the other side of the relationship so we’ll prefix both with the word “inverse” to give us inverse_friendships and inverse_friends. We need to specify some additional options to make the relationships work. For inverse_friendships we’ll have to specify the name of the other model as it can’t be inferred from the relationship name and we’ll also have to define the foreign key as friend_id. For the inverse_friends relationship we need to specify the source as users, as again it cannot be inferred from the name of the relationship.`

```ruby
class Member < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
```

### Tables

```
member
- name (text)
- long_url (text)
- short_url (text)

friendship
- member_id (integer)
- friend_id (integer)

heading
- member_id (integer)
- title (text)
```

## API Endpoints

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
  "status": "ok"
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

## Jobs

After a `member` is created pass `member.id` to async job that:
- looks up `member` using `id`
- use `httparty` client to request a `shortLink` from  Firebase Dynamic Links API
  - save `shortLink` to  `member.short_url`
- use `nokogiri` to extract all the heading (h1-h3) values from the members website
  - save extracted headings to `member.headings`

Note: `To refocus our efforts, we're turning down support for goo.gl over the coming weeks and replacing it with Firebase Dynamic Links (FDL).` https://firebase.google.com/docs/reference/dynamic-links/link-shortener

```
HTTP request
POST https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=api_key
Content-Type: application/json

Request body
{
  "longDynamicLink": string,
  "suffix": {
    "option": "SHORT" or "UNGUESSABLE"
  }
}
```
