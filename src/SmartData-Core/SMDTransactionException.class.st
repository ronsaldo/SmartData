"
I am an exception that is raise to finish a transaction with either an abort or a commit.
"
Class {
	#name : #SMDTransactionException,
	#superclass : #Exception,
	#category : #'SmartData-Core-Transaction'
}

{ #category : #testing }
SMDTransactionException >> isTransactionAbortSignal [
	^ false
]

{ #category : #testing }
SMDTransactionException >> isTransactionCommitSignal [
	^ false
]
