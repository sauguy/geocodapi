# GeocodAPI

Ruby **2.5.1** | Rails **5.2**

This project provides an API that does geocoding. It retrieves coordinates from an address.

The service is an interface to other geocoding APIs. For now, it implements the google API only, but can easily be extended.

Note: The `master.key` file and the default access credentials are provided separately


## Get started
* Clone this repo
* Open a terminal in the project folder and install the dependencies via the command `bundle`
* Copy the `master.key` file into the folder `app/config`
* Start the server: `rails s`. It will be available on `http://localhost:3000`

## Using the API

### Endpoints
The API is accessible via the endpoint `/v1/coordinates?address=checkpoint%20charlie` with the searched address as a param.

An API documentation is provided on the endpoint `/api/docs`.

### Authentication
The access to the different endpoints (API and documentation) are restricted via HTTP basic authentication.

To use the API, you should include an `Authorization` header in your requests.

Example: `Authorization: Basic <credentials>` where <credentials> is `login:password` base-64 encoded.

### Configuration
#### Credentials
The credentials (login/password and third-party api credentials) are stored in `app/config/credentials.yml/enc`. 

To read/edit the credentials, you need to have the file `master.key` in the `app/config` folder.

(More information about encrypted credentials in Rails 5.2 [here](https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2)

#### Third party API
The configuration of third party APIs is managed via a config file: `config/third_party_api.yml`

The credentials (i.e. API key) are managed via the encrypted credentials solution described above.

### Specs
Tests are written via `rspec` and can be run with `bundle exec rspec`