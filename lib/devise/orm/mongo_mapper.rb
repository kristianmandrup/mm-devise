require 'orm_adapter/adapters/mongo_mapper'

#MongoMapper::Document.plugin Devise::Orm::MongoMapper
MongoMapper::Document::ClassMethods.send :include, Devise::Models

