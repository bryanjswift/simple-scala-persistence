package com.bryanjswift.persistence

import java.io.Serializable

trait Persister {
	def save(obj:Savable):Serializable
	def get(table:String,id:Serializable):Savable
	def getAll(table:String):List[Savable]
	def search(table:String,field:String,value:Any):List[Savable]
}