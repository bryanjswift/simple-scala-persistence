package com.bryanjswift.persistence

import java.io.Serializable

trait Persister {
	def save(obj:Savable):Serializable
	def get(table:String,id:Long):Savable
	def search(table:String,field:String,value:Any):List[Savable]
}