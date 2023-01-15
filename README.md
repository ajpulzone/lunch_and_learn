# README
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

# Table of Contents
  - [Tech & Tools Used](#tech-and-tools)
  - [Developer Setup](#setup)
  - [API Key Sign-Up Instructions](#api-key-sign-up-instructions)
  - [Endpoints](#endpoints)

## Tech and Tools
  - ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
  - ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
  - <img src="app/images/rspec_badge.png" alt="RSpec" height="30"> **3.12.0**
  - ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
  - ![Faraday]()
  - ![Factory Bot]()
  - ![Faker]()
  - ![Figaro]()
  - ![JSON:API Serializer]()
  

## Developer Setup
    If you would like to demo this API on your local machine:
  <ol>
    <li> Ensure you have Ruby 2.7.4 and Rails 5.2.8 installed </li>
    <li> Fork and clone down this repo and navigate to the root folder <code>cd lunch_and_learn</code></li>
    <li> Run <code>bundle install</code> </li>
    <li> Run <code>bundle exec figaro install</code> </li>
    <li> Run <code>rails db:{drop,create,migrate,seed}</code> </li>
    <li> In your <code>application.yml</code> assign your Unsplash api key with the variable <code> </li>
    <li> (Optional) To run the test suite, run <code>bundle exec rspec spec</code> </li>
    <li> Run <code>rails s</code> </li>
  </ol>
  You should now be able to hit the API endpoints using Postman or a similar tool.<br>
  Default host is <code>http://localhost:3000</code>


## API Key Instructions

## Endpoints

  <code> GET /api/v1/recipes?country=thailand </code>

<code>
  {
      "data": [
          {
              "id": null,
              "type": "recipe",
              "attributes": {
                  "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                  "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                  "country": "thailand",
                  "image": "https://edamam-product-images.s3.amazonaws.com..."
              }
          },
          {
              "id": null,
              "type": "recipe",
              "attributes": {
                  "title": "Sriracha",
                  "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                  "country": "thailand",
                  "image": "https://edamam-product-images.s3.amazonaws.com/."
              }
          },
          {...},
          {...},
          {...},
          {etc},
      ]
  }
</code>

<code> GET /api/v1/learning_resources?country=laos</code>

<code>
  {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {
                  "title": "A Super Quick History of Laos",
                  "youtube_video_id": "uw8hjVqxMXw"
              },
              "images": [
                  {
                      "alt_tag": "standing statue and temples landmark during daytime",
                      "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "five brown wooden boats",
                      "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "orange temples during daytime",
                      "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {...},
                  {...},
                  {...},
                  {etc},
                ]
          }
      }
  }
</code>

<code> POST /api/v1/users </code>

<code>
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
  </code>

  <code> POST /api/v1/favorites </code>

<code>
  {
    "api_key": "jgn983hy48thw9begh98h4539h4",
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
  }
  </code>

  <code> GET /api/v1/favorites </code>

  <code>
  {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          },
          {
              "id": "2",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "country": "thailand",
                  "created_at": "2022-11-07T03:44:08.917Z"
              }
          }
      ]
  }
</code>