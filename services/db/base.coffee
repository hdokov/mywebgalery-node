connection =
  mongoClient: require('mongodb').MongoClient
  assert: require('assert')
  objectId: require('mongodb').ObjectID
  url: 'mongodb://localhost:27017/mywebgalery'
  execute: (collection_name, callback, query) ->
    @mongoClient.connect @url, (err, db) ->
      return @callback(null, err) if err

      collection = db.collection(collection_name)
      query collection, ->
        db.close()

  find: (collection_name, query, callback) ->
    @execute collection_name, callback, (collection, cleanUp) ->
      collection.find(query).toArray((err, docs) ->
        callback(docs, err)
        cleanUp()
      )

  insert: (collection_name, data, callback) ->
    @execute collection_name, callback, (collection, cleanUp) ->
      result = collection.insert(data)
      callback(result)
      cleanUp()

module.exports = connection
