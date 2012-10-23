# Basic test for creating server
describe "A server", ->
  server = null

  beforeEach ->
    server =
      listen: ->
        null

    spyOn(server, 'listen').andCallFake ->
      8080

  it "starts a process listening on port 8080", ->
    expect(server.listen()).toEqual 8080
