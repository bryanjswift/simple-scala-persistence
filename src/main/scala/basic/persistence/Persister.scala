package basic.persistence

import java.io.Serializable

trait Persister {
	def all(table:String):List[Savable]
	def get(table:String,id:Serializable):Savable
	def save(obj:Savable):Serializable
	def search(table:String,field:String,value:Any):List[Savable]
	def some(table:String,count:Int,offset:Int):List[Savable]
}
