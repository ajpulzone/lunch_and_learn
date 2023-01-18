
<div align="center"><img src="app/images/lunch_and_learn_image.jpeg" alt="Deschutes Brewery GIF" class="center" width="500" height="200"></div>

<br><br>

<div align="center">
  <h1>Welcome to the Lunch and Learn API Service</h1> 
</div>

<h3>This repo was created to provide a front end team access to information to create a website that allows users to find recipes and learning materials based on a country they choose. Or, if the user is feeling whimsical, allowing a random country to be chosen for them.</h3>

<br>

# Table of Contents
  - [Learning Goals](#learning-goals)
  - [API Key Sign-Up Instructions](#api-key-sign-up-instructions)
  - [Developer Setup](#developer-setup)
  - [Tech & Tools Used](#tech-and-tools)
  - [Database Schema](#database-schema)
  - [Endpoints](#endpoints)

## Learning Goals

<ul>
  <li> Expose an API that aggregates data from multiple external APIs </li>
  <li> Expose an API that requires an authentication token </li>
  <li> Expose an API for CRUD functionality </li>
  <li> Determine completion criteria based on the needs of other developers </li>
  <li> Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc). </li>
</ul>

## API Key Sign Up Instructions

You will need to sign up for the following API keys in order to use this repo:
- YouTube API Key: [Documentation](https://developers.google.com/youtube/registering_an_application)
- Unsplash API Key: [Documentation](https://unsplash.com/documentation)
- Edamam API Key: [Documentation](https://developer.edamam.com/edamam-docs-recipe-api)

## Developer Setup

  If you would like to demo this API on your local machine:
  <ol>
    <li> Ensure you have Ruby 2.7.4 and Rails 5.2.8 installed </li>
    <li> Fork and clone down this repo and navigate to the root folder <code>cd lunch_and_learn</code></li>
    <li> Run <code>bundle install</code> </li>
    <li> Run <code>bundle exec figaro install</code> </li>
    <li> Run <code>rails db:{drop,create,migrate,seed}</code> </li>
    <li> In your <code>application.yml</code> file:</li>
          <ul> - assign your Unsplash api key to a variable (this will need to be passed in as query params with key <code>unsplash_api_key</code>)</ul>
          <ul> - assign your YouTube/Google api key to a variable (this will need to be passed in as query params with key <code>google_api_key</code>)</ul>
          <ul> - assign your Edamam api key to a variable (this will need to be passed in as query params with key <code>edamam_recipe_api_key</code>)</ul>
    <li> (Optional) To run the test suite, run <code>bundle exec rspec spec</code> </li>
    <li> Run <code>rails s</code> </li>
  </ol>
  You should now be able to hit the API endpoints using Postman or a similar tool.

  Default host is <code>http://localhost:3000</code>


## Tech and Tools
  - ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
  - ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
  - <img src="app/images/rspec_badge.png" alt="RSpec" height="30"> **3.12.0**
  - ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
  - <img src="app/images/faraday.png" alt="RSpec" height="30">
  - <img src="app/images/figaro_badge.png" alt="RSpec" height="30">
 
  

## Database Schema
   <img src="app/images/lunch_and_learn_db_schema.png" alt="schema" height="400">


## Endpoints
### RESTful

<ol>
<li>Get Recipes for A Specified Country</li><br>

  ``` GET /api/v1/recipes?country=ireland ```
   - Example Response:

```json
  {
    "data": [
      {
        "id": null,
            "type": "recipe",
            "attributes": {
              "title": "East of Ireland Recipe",
                "url": "http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland",
                "image_url": "https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIHUYRP7LLtE0VkCKrQcEwMFSMFNLMA2y6XckpR7zspunAiEAgcJTplJpjIg25eC5gNZctQ96PH8OxEPPrSUXf4Y2H6cqzAQIMxAAGgwxODcwMTcxNTA5ODYiDDR5crZtGf3MdnWRxiqpBHXYKNb5uVR%2B7NDptTsi9PmcvoCms6mZ9OL7lpgzhoHHVn6s9mjczJaAjV7Lx2GnmQ%2FEVpJ4mPLjFEEQPFmi0jR2kAhS5SSYDNFs1ZYKhPaEv0QJOBLsJXqMq%2B%2B1RHSOKvSZP0KgrOIvdLZ1vDNaq7bqVKnNny6euytVhAecQwgRSik%2B%2FbUccJxSsqa5d%2F70uYdaKY2IGPKOUYZUC1a%2FdltHRB5JT97MDYGy8ptyoCpiKl69o%2FZ7z%2F0vP1uYOfby6fcilHbiFkxxSyIWGPqbfgZD8T8Dw8gpvkiiChRvZvovZlCOnz1JhhC6c8dtxHiGAJzIEZa%2BXbZq8ERyL41bBbzGhcsFWShRecroyV4HbMMpl3PFmoRosbLKWS55W4Ucd3aXlediCBM0SnCCIsEkdIA0%2FZ4VrHnuffP%2F9k05cTaxchaH0jCLMia1twgy38TzE0z8fxza8ZyUcuXavdVbtM0AnDjl3rpsYctpXcLR0J8WQ9wWykws0WjtpPSBSsCM6InmebEXabJ7j1107RfufbWF8gsRzHNg8wwJayvmCd%2Bed6rHFtlfeBzcIxDR%2FlEJ5kt2ZldxKyXJ%2BQYV4OJ%2FG67PIE2lAqs0%2BAmYGKO67rk3KturYzpUvr37IQ7w8vgKUeyBiuZi6XGRxk%2FMl1CdxbB8hOanAXhwUyx25kftxM%2B%2F%2B2EpaAzR4Gf74XZIdoWzqhkoeakd4CJtfBme%2BawTKbSSRCoPuSDKMQ0wsJeWngY6qQGGsGgHdPc%2BBdyGuzCQcc5tLOyIWh33W7FGuyyg42K%2Fj9tyl5nagGubOY0Eg91Mor9ASQ%2FMAjj%2FnSCaxZ%2B2ju86HWdXkeKv%2FLI%2FvwmYnS%2FxKhftVxCeYCAjHFQ9Z9R0iTzHeePAWjue14pYH3XA6WK5tQNoHN3ai2mS%2B%2FZijoT6t48WMzZnRlGQBQHWsPg18U0SS6g8RVjwJ9D21HmT3i72fzcEzaudeGVe&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230116T184742Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFE436I6PM%2F20230116%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1be506c07fc64f33b233b6726a7ba66ced069fbaefcf691bde5935fa2625c796",
                "country": "Ireland"
            }
        }
    ]
  }
```
<br>

<li>Get Learning Resources For a Specified Country</li><br>

```GET /api/v1/learning_resources?country=ireland```
   - Example Response:

```json
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
```
<br>

<li>User Registration</li><br>

```POST /api/v1/users```
   - Example Response:

```json
{
    "data": {
        "id": "6",
        "type": "user",
        "attributes": {
            "name": "Drake",
            "email": "imamuppet@gmail.com",
            "user_api_key": "ec21d9eb6929c7d79427f5be5bc7a16b"
        }
    }
}
```
<br>

<li>Add a Favorite To a User</li><br>

```POST /api/v1/favorites```
  - Example Response:

```json
{
    "success": "Favorite added successfully"
}
```

<li>Get a Users Favorites</li><br>
  
```GET /api/v1/favorites```
   - Example Response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "country": "Ireland",
                "recipe_link": "http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland",
                "recipe_title": "Cheddar Colcannon Torte",
                "created_at": "2023-01-17T04:28:23.879Z"
            }
        }
    ]
}
```
</ol>