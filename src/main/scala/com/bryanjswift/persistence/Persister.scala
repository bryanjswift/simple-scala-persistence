package com.bryanjswift.persistence

import java.io.Serializable

trait Persister {
	def save(obj:Savable):Serializable
}
