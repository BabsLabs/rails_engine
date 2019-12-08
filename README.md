# README

## RailsEngine / RalesEngine

### Description
The RailsEngine is a Ruby on Rails powered versioned API that provides sales data for a fictional dataset of sales information.

### Version
This API is currently versioned as V1 (version 1). All endpoints will be accessed using the `/api/v1/` URI path prefix. More information on paths, including example paths, and API use can be found in the Features / Usage section below.

### Purpose
The API was built to practice restful API routing and test driven development with the assistance of FactoryBot and Faker. Another goal was to practice writing a rake task to parse the provided csv data and import it into a database. In addition the project focused on advanced ActiveRecord queries for the purpose of Business Intelligence and the implementation of serializers to display the provided information.

### Tech / Framework Used
This project was built and tested using the following technologies;

* Ruby on Rails
* FastJsonapi
* RSpec
* FactoryBot
* Faker
* Pry
* SimpleCov
* ShouldaMatchers
* Serializers
* Active Designer Database Designer

### Database Schema
<img src="https://raw.githubusercontent.com/BabsLabs/rails_engine/master/lib/img/Screen%20Shot%202019-12-01%20at%2010.08.16%20PM.png"
     alt="Example Search wih URL"
     style="float: left; margin-right: 10px;" />

### Features / Usage
The RailsEngine API data set includes data for the following models;

* `customers`
* `invoice_items`
* `invoices`
* `items`
* `merchants`
* `transactions`

Api data can be accessed using the following path formula:

`/api/v1/<model>/<id>/<action>?<query attribute>=<query parameters>`

 *Note that the <id> and the <action?>=<query parameters> are optional ways to scope the API data. Providing an Id will only show information for that individual model.*

Optional actions for all models are as follows;
* `find`
* `find_all`
* `random`
* `created_at`
* `updated_at`

In addition each model has query actions based on that models specific serializer attributes and relationships.

An example of a customer serializer with corresponding API path for the attribute of first_name:

```
class CustomerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :first_name, :last_name
end
```

`/api/v1/customers/find?first_name=<FIRST-NAME-GOES-HERE>` where <FIRST-NAME-GOES-HERE> is the name you want to query.

Example API call with path:
<img src="https://raw.githubusercontent.com/BabsLabs/rails_engine/master/lib/img/Screen%20Shot%202019-12-01%20at%209.50.51%20PM.png"
     alt="Example Search wih URL"
     style="float: left; margin-right: 10px;" />

### Code Examples
Controller Example:
```
class Api::V1::CustomersController < ApplicationController

  def index
    customers = Customer.all
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  def show
    customer = Customer.find(params[:id])
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

end
```

Find Controller Example:
```
class Api::V1::Customers::FindController < ApplicationController

  def index
    customers = Customer.where(customers_params)
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  def show
    customer = Customer.find_by(customers_params)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  private

  def customers_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
```

Random Controller Example:
```
class Api::V1::Customers::RandomController < ApplicationController

  def show
    rand_ids = Customer.pluck(:id).sample
    customer = Customer.find(rand_ids)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

end
```

Model Example:
```
class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
end
```

Serializer Example (using FastJsonapi):
```
class CustomerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :first_name, :last_name
end
```

### Installation
#### Requirements
Ruby 2.4 or higher with Rails 5.2.3 or higher.

#### To Install:
To get this API running on your machine perform the following steps from your terminal:

Step 1 - Clone the Repository and change into a directory of your choice)
```
git clone git@github.com:BabsLabs/rails_engine.git
cd rails_engine
```

Step 2 - Bundle install all required gems)
`bundle install`

Step 3 - Setup Database)
```
rails db:create
rails db:migrate
```

Step 4 - Run the Rake Import task to get the CSV data transferred to your database. Note - This may take a few minutes.)
`rake import`

Step 5 - Launch your rails server with local host)
`rails s`

### Testing
The testing is done using RSpec with FactoryBot and Faker to generate test data and with the additional tools of Pry, SimpleCov, and ShouldaMatchers.

All tests can be run using the command `rspec` and individual tests can be run with the `rspec <path>` format.

Note* Skipped tests can be unskipped by removing the `skip`.

### Cost / Authorization
This is a free and public API. No api key is needed to access this dataset.