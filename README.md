# README

## API V1

### HEADERS

* 'X-Access-Token': Token current user
* 'X-Device-Token': Current device token or id
* 'Authorization: Token token': Token for HTTP authentication
* 'Content-Type':  content type for request, default is 'application/json'

### ENDPOINTS

#### Sessions

  * POST /api/session, params: { "user": "username", "password": "secret_password" }
  * DELETE /api/session

#### Device

  * GET /api/device
  * POST /api/device, params: { "device": { "kind": "0", "push_token":"token" } }
  * PUT /api/device,  params: { "device": { "kind": "0", "latitude":"120", "longitude":"10","radius":"1000","department_ids":["71","72"], "streets_attributes": [ { "address":"Street Address", "latitude":"10", "longitude":"10"} ] }

  ##### Update latitude and longitude

  * GET /api/position,  params: { "device": { "latitude":"120", "longitude":"10" } }

#### Stores

  * GET api/stores
  * GET api/stores/:store_id/stores
  * GET api/stores/:store_id

#### Categories

  * GET api/categories
  * GET api/stores/:store_id/categories

#### Products

  * GET api/products
  * GET api/stores/:store_id/products
  * GET api/stores/:store_id/products/:id
  * GET api/products/:id

#### Favorites

  * GET /api/favorites
  * POST /api/favorites, params: { "id":"5" }
  * DELETE /api/favorites/:id

#### Pins

  * GET /api/pins
  * GET /api/pins/:id
  * POST /api/pins, params: { "publish_id":"50" }
  * DELETE /api/pins/:id

#### Departments

  * GET /api/departments
  * GET /api/super_departments

#### Streets

  * GET /api/streets
  * POST /api/streets,     parmas: { "street": {"address":"Address", "latitude":"12.00", "longitude":"10.00"} }
  * PUT /api/streets/:id, parmas: { "street": {"address":"Address", "latitude":"12.00", "longitude":"10.00"} }
  * DELETE /api/streets/:id

#### Maps

  * GET /api/maps

#### Messages

  * GET /api/stores/:store_id/messages
  * GET /api/messages
  * GET /api/stores/:store_id/messages/:id
  * POST /api/stores/:store_id/messages


##### Unread messages

  * GET /api/stores/:store_id/messages/unread

### Curl Example
  curl http://server.com/api/device -H 'Authorization: Token token="app_token"' - H 'X-Device-Token: device_token' -H 'X-Access-Token: user_token'
