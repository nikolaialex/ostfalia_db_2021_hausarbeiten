
# AWS DynamoDB
\
&nbsp;

### Authors
\
&nbsp;

<table>
  <tr>
   <td>Name
   </td>
   <td>Institution
   </td>
  </tr>
  <tr>
   <td>Andre Nollmann
   </td>
   <td>Technische Hochschule Brandenburg
   </td>
  </tr>
  <tr>
   <td>Dominik Braun
   </td>
   <td>Berliner Hochschule für Technik
   </td>
  </tr>
</table>



## Table of contents

### 1. Introduction

### 2. Architecture

>> 2.1 Overview

>> 2.2 Use Cases

>> 2.3 Data Models

>> 2.4 Data Types

### 3. Tables and capacity provisioning

>>3.1 Table creation and sharding

>>3.2 Read and write capacity

>> 3.3 Capacity Provisioning

### 4. Read items

>> 4.1 Single item read

>> 4.2 Multi item read

>> 4.3 Eventual and strong consistency

### 5. Write items

>> 5.1 Single item write

>> 5.2 Multi item write

>> 5.3 Advanced data types and update actions

### 6. Transactions

### 7. Local and global indexes

### 8. Streams

### 9. In-memory acceleration

> 10. Conclusion

> 11. Bibliography

\
&nbsp;

## 1. Introduction

In today's world data is the new currency and innumerable more and more data is produced every second all over the world. To handle this informational overload the concepts of databases arise, were developed and extended. Databases with very different specifications and working methods. For managing the data there were software and management systems developed. Because besides the mass of information handled every second it’s also the needed speed of information or data processing which modern databases have to deal with. Relational databases gained one the most favorite systems with its programming or developing language “Structured Query Language” (better known as “SQL”). The further progression regarding new requirements of data management also led to new languages like NoSQL (like “Not only” or “No” SQL).

One of these newer technical advancements was designed by Amazon with its Web Services and their database called Amazon DynamoDB. It’s just one of hundreds of examples but one to figure out today's possibilities and the one this paper is going to handle with. 

The idea of service is one the important facts of the Amazon offerings, including their Web Services. The Amazon DynamoDB is a service which is fully managed especially to the optional scalability and the administrational overhead with consistent and high performance. So there’s no need for technical hardware deployment, updates or changes for example. Configurations and setups are already done. Data replications and backups are included and software patches are managed as a service. Optional offerings like encryption for operations with sensitive data or flexible scalability for any level of requested traffic are also possible supplements. As well as in-time recovery, seamless scalability and throughput capacity, several management consoles are interesting add-ons. Standards like high availability and durability of data without downtime or performance degradation rounding this service idea off. 

Summarizing these marketing facts this paper can give a clue of one the possibilities today's markets are offering for the topic of managing data and databases.

And how does it work? Here’s the point where this paper really starts. The following chapters shall describe the architecture of Amazon DynamoDB and give some real use cases. Data models and data types were explained. Afterwards tables and provisioning is the next theme including read and write items before dealing with transactions, local and global indexes and streams. The last technical chapter will evaluate the in-memory acceleration before this paper ends with the conclusion.
\
&nbsp;

## 2. Architecture


### 2.1 Overview

“The architecture of a storage system that needs to operate in a production setting is complex. In addition to the actual data persistence component, the system needs to have scalable and robust solutions for load balancing, membership and failure detection, failure recovery, replica synchronization, overload handling, state transfer, concurrency and job scheduling, request marshaling, request routing, system monitoring and alarming, and configuration management.”[^1]

As a short summary of some techniques used in DynamoDB and their benefits is listed in the following table[^2]:

Table 1: Summary of techniques used in Dynamo and their advantages


<table>
  <tr>
   <td>Problem
   </td>
   <td>Technique
   </td>
   <td>Advantage
   </td>
  </tr>
  <tr>
   <td>Partitioning
   </td>
   <td>Consistent Hashing
   </td>
   <td>Incremental Scalability
   </td>
  </tr>
  <tr>
   <td>High Availability for writes
   </td>
   <td>Vector clocks with reconciliation during reads
   </td>
   <td>Version size is decoupled from update rates.
   </td>
  </tr>
  <tr>
   <td>Handling temporary failures
   </td>
   <td>Sloppy Quorum and hinted handoff
   </td>
   <td>Provides high availability and durability guarantee when some of the replicas are not available.
   </td>
  </tr>
  <tr>
   <td>Recovering from permanent failures
   </td>
   <td>Anti-entropy using Merkle trees
   </td>
   <td>Synchronizes divergent replicas in the background.
   </td>
  </tr>
  <tr>
   <td>Membership and failure detection
   </td>
   <td>Gossip-based membership protocol and failure detection.
   </td>
   <td>Preserves symmetry and avoids having a centralized registry for storing membership and node liveness information.
   </td>
  </tr>
</table>


Regarding the complexity of this database and its used techniques, this paper focuses on some basic topics for this experienced example of a NoSQL database. Amazon DynamoDB is a hosted server operating system with a key-value as well as a document store database model. As a fully managed NoSQL database service by Amazon DynamoDB delivers high performance and scalability combined with individual adjustments on actual requirements and imperceptible changes. There´s no administrational workload like hardware and software provisioning including setup, configuration and updates as well as cluster scaling, replication, monitoring or dealing with hardware failures.

Like there's no overhead needed for administration, Amazon DynamoDB also offers traffic, throughput and scalability without limits. Write and read, storage and retrieval of massive amounts of data is virtually limitless. 

Furthermore, flexible operation and usage is always possible, even in the event of unexpectedly high access numbers and / or work processes. With a predefined performance expectation, throughput and latency are kept stable throughout, regardless of increased data volume, for example, due to increased usage numbers. 

With appropriately defined upper and lower limits, Amazon DynamoDB can scale automatically depending on real traffic. This saves real costs through performance adjustment and yet massive access by a large number of users is possible at all times. 

In addition, other AWS services can of course also be implemented. These can be used for further analyses, logging, security settings and target group-oriented monitoring, among other things. 


### 2.2 Use Cases

serverless applications

For persistent storage of relevant data at any scale, Amazon DynamoDB has become one of the central databases for web and mobile backends in eCommerce, sales, education, and the media verticals.

high volume special events

Special events and seasonal events usually have a relatively short duration and volatile workload, such as national election campaigns. Increasing and decreasing the capacity currently required allows variable freedom of action and efficient resource management whenever and however it is needed.

social media applications

Especially in social media, usage patterns and access numbers are unpredictable and can go viral at any time. Be it mobile online games like Pokemon Go or photo and video sharing platforms like Instagram or TikTok. In order to meet a new hype in a service-oriented way as expected, Amazon DynamoDB offers corresponding elasticity and flexibility.

regulatory and compliance requirements

Applications in the areas of healthcare or finance require special regulations and a corresponding set of rules. AWS has a special focus and detailed descriptions in the AWS Services in the Compliance Program area.

real-time analytics

For real-time usage data analysis, sentiment detection, advertising and marketing service delivery, and trend analysis, Amazon DynamoDB provides seamless scaling without downtime. This allows streaming event data to be ingested and analyzed in real time. Total capacity can be easily increased as needed and also reduced once the event is over.


### 2.3 Data Models

Although Amazon DynamoDB is a key-value-store as well as a document store, this paper focuses on the key-value data model as a NoSQL data store. According to “simpler and less constrained data models than traditional relational databases”[^3] key-value stores “are designed with the goal to deliver significant performance benefits with low latency and high throughput”[^4].

Generally, the core of relational databases are tables. These tables were called relations. Each relation is a sample of rows. Within these rows exists one or more columns. Usually a formal scheme is not required in NoSQL database tables “except for a mandatory primary key that uniquely identifies each row”[^5]. An example is given in the following table.

Table 2: High-Level NoSQL Database Table Representation


<table>
  <tr>
   <td><strong>Table</strong>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>Row</strong>
   </td>
   <td>Primary Key
   </td>
   <td>Column 1
   </td>
  </tr>
</table>


Separated column storage operations for each column result in obviously faster operations due to “aggregate operations for one column of the entire table … than the traditional row storage model”[^6].

According to the high-level concept of Amazon DynamoDB a row is related to an item, which itself can have several numbers of attributes without restrictions. Each attribute includes a key beside its own value. The attributes name and value are usually referred to the key as a name-value pair. The number of items stored in an Amazon DynamoDB table is not limited but indexed by primary key as shown in the following table.

Table 3: High-Level Representation of Amazon DynamoDB Table


<table>
  <tr>
   <td><strong>Table</strong>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>Item 1</strong>
   </td>
   <td>Primary Key
   </td>
   <td>Attribute 1
   </td>
   <td>Attribute 2
   </td>
   <td>Attribute 3
   </td>
   <td>Attribute…n
   </td>
  </tr>
  <tr>
   <td><strong>Item 2</strong>
   </td>
   <td>Primary Key
   </td>
   <td>Attribute 1
   </td>
   <td>
   </td>
   <td>Attribute 3
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>Item n</strong>
   </td>
   <td>Primary Key
   </td>
   <td>
   </td>
   <td>Attribute 2
   </td>
   <td>Attribute 3
   </td>
   <td>
   </td>
  </tr>
</table>


There are two options defined for using primary keys in Amazon DynamoDB. The first one is called partition key which is a simple primary key with one attribute. “The minimum length of a partition key value is 1 byte. The maximum length is 2048 bytes. There is no practical limit on the number of distinct partition key values, for tables or for secondary

indexes.”[^7]

In this outlined setting, every item in this table has to have different partition key values.

Table 4: Amazon DynamoDB Simple Primary Key (Partition Key)


<table>
  <tr>
   <td><strong>Table</strong>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>Item</strong>
   </td>
   <td>Partition Key
   </td>
   <td>Attribute 1
   </td>
   <td>Attribute 2
   </td>
   <td>Attribute 3
   </td>
   <td>Attribute…n
   </td>
  </tr>
</table>


In the following table PersonID is used as the partition key as an example.

Table xxx6: Example Person Amazon DynamoDB Table


<table>
  <tr>
   <td>Person Table
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Item
   </td>
   <td>PersonId
<p>
(Partition Key)
   </td>
   <td>FirstName
   </td>
   <td>LastName
   </td>
   <td>Zipcode
   </td>
   <td>Gender
   </td>
  </tr>
  <tr>
   <td>Item 1
   </td>
   <td>1001
   </td>
   <td>Fname-1
   </td>
   <td>Lname-1
   </td>
   <td>00000
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Item 2
   </td>
   <td>1002
   </td>
   <td>Fname-2
   </td>
   <td>Lname-2
   </td>
   <td>
   </td>
   <td>M
   </td>
  </tr>
  <tr>
   <td>Item 3
   </td>
   <td>2002
   </td>
   <td>Fname-3
   </td>
   <td>Lname-3
   </td>
   <td>10000
   </td>
   <td>F
   </td>
  </tr>
</table>


The second option is a composite primary key which comprises two attributes. This key is indexed as a partition key and a sort key. As a result of this construction it is significantly quicker to get the right items with these two hierarchical element values. “The minimum length of a sort key value is 1 byte. The maximum length is 1024 bytes. In general, there is no practical limit on the number of distinct sort key values per partition key value. The exception is for tables with secondary indexes. With a local secondary index, there is a limit on item collection sizes: For every distinct partition key value, the total sizes of all table and index items cannot exceed 10 GB. This might constrain the number of sort keys per partition key value.”[^8]

In this presented setting it is possible for multiple items to have the same partition key value. But therefore these items have to have different sort key values. 

Table 5: Amazon DynamoDB Composite Primary Key (Partition & Sort Key)


<table>
  <tr>
   <td><strong>Table</strong>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>Item</strong>
   </td>
   <td>Partition Key
   </td>
   <td>Sort Key
   </td>
   <td>Attribute 1
   </td>
   <td>Attribute 2
   </td>
   <td>Attribute 3
   </td>
   <td>Attribute…n
   </td>
  </tr>
</table>


Another representation of the table above is given below:


This multi-part key leads to many new options in getting a result or datas from queries and other instructions. Another example is a High Score-Listing of several games and players, shown in the following table.

Table 7: Example GameScores Amazon DynamoDB Table


<table>
  <tr>
   <td>GameScores Table
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>PersonID
<p>
(Partition Key)
   </td>
   <td>GameId
<p>
(Sort Key)
   </td>
   <td>TopScore
   </td>
   <td>TopScoreDate
   </td>
   <td>Wins
   </td>
   <td>Losses
   </td>
  </tr>
  <tr>
   <td>item1
   </td>
   <td>1001
   </td>
   <td>Game01
   </td>
   <td>67453
   </td>
   <td>2013-12-09:17:24:31
   </td>
   <td>73
   </td>
   <td>21
   </td>
  </tr>
  <tr>
   <td>item2
   </td>
   <td>1001
   </td>
   <td>Game02
   </td>
   <td>98567
   </td>
   <td>2013-12-11:14:14:37
   </td>
   <td>98
   </td>
   <td>27
   </td>
  </tr>
  <tr>
   <td>item3
   </td>
   <td>1002
   </td>
   <td>Game01
   </td>
   <td>43876
   </td>
   <td>2013-12-15:19:24:39
   </td>
   <td>12
   </td>
   <td>23
   </td>
  </tr>
  <tr>
   <td>item4
   </td>
   <td>2002
   </td>
   <td>Game02
   </td>
   <td>65689
   </td>
   <td>2013-10-01:17:14:41
   </td>
   <td>23
   </td>
   <td>54
   </td>
  </tr>
</table>


The elements of a composite primary key as a multi-part key were also known as its hash attribute and its range attribute. An explanation of the terms and its functions is given in an Amazon Whitepaper from January 2020:

“The partition key of an item is also known as its hash attribute and sort key as its range attribute. The term hash attribute arises from the use of an internal hash function that takes the value of the partition key as input and the output of that hash function determines the partition or physical storage node where the item will be stored. The term range attribute derives from the way DynamoDB stores items with the same partition key together, in sorted order by the sort key value.”[^9]


### 2.4 Data Types

Amazon DynamoDB allows a broad spectrum of data types also with unstructured datasets.

Table XXX: Amazon DynamoDB Data Types


The attributes of an Amazon DynamoDB item appear in one of the following three specifications:



* scalar type: a name-value pair with one definite value
* document type: attributes nested within a complex data structure
* multi-valued set type: a unique set of values

Each item can have any number of attributes.

Primary keys are always scalar types with only one the following data types allowed:



1. String:

“The length of a String is constrained by the maximum item size of 400 KB. Strings are Unicode with UTF-8 binary encoding. Because UTF-8 is a variable width encoding, DynamoDB determines the length of a String using its UTF-8 bytes.”[^10]



2. Number

“A Number can have up to 38 digits of precision, and can be positive, negative, or zero.

• Positive range: 1E-130 to 9.9999999999999999999999999999999999999E+125

• Negative range: -9.9999999999999999999999999999999999999E+125 to -1E-130

DynamoDB uses JSON strings to represent Number data in requests and replies. If number precision is important, you should pass numbers to DynamoDB using strings that you convert

from a number type.”[^11]



3. Binary:

“The length of a Binary is constrained by the maximum item size of 400 KB. Applications that work with Binary attributes must encode the data in base64 format before sending it to DynamoDB. Upon receipt of the data, DynamoDB decodes it into an unsigned byte array and uses that as the length of the attribute.”[^12]

These restrictions are only determined for key attributes, not for other, non-key ones. 

\
&nbsp;


## 3. Tables and capacity provisioning

A key aspect for AWS DynamoDB is the creation and usage of tables and how to provision read and write capacity for operations on the data.

In the following chapter we will have a look at the table creation and show as a coding example how to create a table. Then we will look at the terms read- and write-capacity and the different provisioning modes which are available.


### 3.1 Table creation and sharding

As highlighted in the architecture section a table will be managed and sharded into smaller individual parts in the background by the AWS DynamoDB business logic.

The key parameters for this operation are the **hash-key **and the** range-key** which can only be set at the creation phase of a table. The reason for this restriction is that the data is stored and distributed to nodes based on these values. For a later change the data would need to be redistributed which comes closer to the creation of an entirely new table with new structure to which the data can be copied over to.

A table can be created in code which we illustrate in this code example[^13]


```
const params = {
  AttributeDefinitions: [
     {
    AttributeName: "HashKeyAttribute", 
    AttributeType: "S"
    }, 
     {
    AttributeName: "RangeKeyAttribute", 
    AttributeType: "S"
   }
  ], 
  KeySchema: [
     {
    AttributeName: "HashKeyAttribute", 
    KeyType: "HASH"
   }, 
     {
    AttributeName: "RangeKeyAttribute", 
    KeyType: "RANGE"
   }
  ], 
  ProvisionedThroughput: {
   ReadCapacityUnits: 5, 
   WriteCapacityUnits: 5
  }, 
  TableName: "TableName"
 };

const result = await dynamodb.createTable(params).promise()
```


As you can see in the example[^14] only the Key Schema needs to be defined the object and its attributes will be created by putting data to the table. The KeySchema is then used for data distribution.

In this example we use a provisioned throughput of 5 read and 5 write units.

In the next part we will have a closer look at what this means.


### 3.2 Read and write capacity

For operations on the data contained in the table we need read and write capacity.

**Read**

One read capacity unit is the strongly consistent read of an item with a size up to 4 KB per second.

If the item is bigger I will need more read capacity in 4 KB intervals.

Transactions consume additional capacity because they do additional operations.

Eventually consistent reads give a 50% discount.

If you want to read for example one item with a size of 8 KB this would be tow read capacity units per second because of the size. If you choose eventual consistency as read attribute the cost would be 1 read unit.

**Write**

One write capacity unit is one write per second with a size up to 1 KB.

If the item is bigger DynamoDB will consume additional write capacity units.

A transactional write will consume 2 capacity units per 1 KB. So for example if we want to write a 128 KB sized object with a transaction the total capacity needed for this operation sums up to 256 capacity.


### 3.3 Capacity Provisioning

On creation read and write capacity need to be provisioned.

In contrast to the key schema these values can be changed later.

You can  lower or increase the capacity and once every twenty four hours you can change the capacity Mode from provisioned throughput to on demand. 

Overall there are two main provisioning modes:



* Provisioned Throughput
* OnDemand

**Provisioned Throughput**

This mode is the classic way to provision capacity[^15] which has been available since the introduction of AWS DynamoDB.

It is meant for predictable read and write usage of the underlying table.

Like in a closed system where you control the number of reads and writes to the table. 

For example with a Lambda Function which will get items from a queue and concurrent execution is set to a specific value. 

In this use case you know the read and write of this lambda function can not exceed a certain threshold and therefore it is easy to provision the needed capacity for read and writes according to the maximum possible concurrent executions of the function. 

All read and write operations which exceed the provisioned capacity will be throttled. 

The advantage if you use this type of provisioning is the price. 

The price will be lower as in the other provisioning mode because you can define the exact capacity. 

The downside is the behavior to exhaustion of this capacity means the throttling.

And you will always pay for the capacity even if you do not use it. 

In use cases where the capacity can not be defined like for example a webapp this provisioning mode can lead to unwanted behavior. Like for example not returning calls if the capacity is exceeded rendering the web app useless. Overprovisioning of capacity is another problem which is a waste of money and capacity. Imagine we have up to 500 requests per second during the day but 0 during the night. If we provision for maximum capacity we have too much at night.

To overcome this kind of problems Amazon web services introduced in 2018 an new provisioning mode which is called On-Demand provisioning.

**On-Demand**

With on-demand[^16] mode you do not need to provision capacity at all and only pay what you really use. The table will scale automatically to the needed capacity up to a default set quota[^17] of 40 000 read or write units. This limit can be increased and is in place to avoid unwanted costs for customers new to this kind of serverless services. With on-demand mode enabled the application can react to unpredictable workloads like they often happen with a web  application. The example often cited at this discussion is a startup web application going viral overnight and the need for the online store to scale with the demand to not interrupt service. Another use-case is infrequent workloads like a monthly report which do not need a table with provisioned capacity for the rest of the month.

The Downside is the higher price which Amazon will charge for providing this on demand capacity at any given time.
\
&nbsp;


## 4. Read items

A main operation for every database system is the retrieval of its stored content.

For this AWS DynamoDB offers several functions to read single items or multiple items at once. In this chapter we will highlight these methods and illustrate them by showing working coding examples.


### 4.1 Single item read

The simplest read operation is the retrieval of a single item.

As highlighted in the architecture section DynamoDB needs to identify the right table and then in this table the shard from where it should read the data. To do this a Hashkey is used which we need to provide as a parameter to the method call.

The name of the method wrapped in the DynamoDB Object of the SDK is **getItem**.

Additional possible parameters for this method call are: **AttributesToGet, ConsistentRead, ReturnConsumedCapacity**[^18]**.**

Which we will describe in a short manner.



* **AttributesToGet**

    This option will filter the attributes we want to get on the server side before sending the response.  Rows with different Attributes can get quite big. This way partial results can be returned and only the needed data is transferred back to the client over the network.

* **ConsistentRead**

    As highlighted in the architecture chapter data is distributed in different shards but data is read only from a single shard. This can lead to inconsistencies between an update and the retrieval of data from a single shard. To tackle this the consistentRead Parameter was introduced which forces a consistent result reading from more than one shard.

* **ReturnConsumedCapacity**

    Every operation based on the size of the object in Kilobytes and the number of items returned (here we get only a single item) will consume DynamoDB Capacity.


    To find out how much capacity an operation consumes we can directly return the consumption in the read result by passing this parameter.


To illustrate the previously introduced method we will now look at it with a coding example[^19] in the DynamoDB Node SDK and the simplified DynamoDB Document Client SDK.


```
// Init the DynamoDB object
const dynamodb = new AWS.DynamoDB();

// Provide Parameters to read
const params = {
  Key: {
   "Artist": {
     S: "Ärzte"
    }, 
   "SongTitle": {
     S: "Schrei nach liebe"
    }
  }, 
  TableName: "Songs"
 };
// Await the result in an async way
const result = await dynamodb.getItem(params).promise()
```


Code for the DynamoDB Document Client looks quite similar besides the parameters we pass to the method. In the Document Client is not needed to specify the data type of the used key for example.


```
// Init a new DynamoDB Document Client object
const documentClient = new AWS.DynamoDB.DocumentClient();

// Provide Parameters to read
const params = {
  TableName : Songs,
  Key: {
    Artist: "Ärzte"
  }
};

// Await the result in an async way
 const result = await documentClient.get(params).promise()
// Example result
```


In both code blocks data is returned in an async way.

For more information on async programming in typescript you can refer to the

[documentation of typescript](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-1-7.html)[^20].

The response from the DynamoDB SDK for example then looks like this.


```
{
    "Item": {
        "Username": {
            "S": "Peter"
        },
        "Age": {
            "N": "81"
        }
    }
}
```


The response indicates the Variable type which is returned. In this example you can see a **String **and a **number **returned as response.


### 4.2 Multi item read

In contrast to other databases where we can define a search query and then get multiple items returned. In DynamoDB multiple items can only be retrieved if we provide an array of hash keys for the same table. Making it a chained single item read in another method.


```
// Init the DynamoDB object
const dynamodb = new AWS.DynamoDB();

// Provide Parameters to read
const params = {
  RequestItems: {
   "Table": {
     Keys: [
        {
       "Key": {
         S: "No One You Know"
        } 
       }, 
        {
       "Key": {
         S: "Acme Band"
        }
      }
     ], 
     AttributesToGet: "AlbumTitle"
    }
  }
 };

// Await the result in an async way
const result = await dynamodb.batchGetItem(params).promise()
```


In the code example above you can see the Array of Keys which will be retrieved.

The advantage of this operation instead of multiple single items read is the reduced traffic to get these items. All of the operations will be executed on the DynamoDB Server and given back as a single object.

**DynamoDB Document Client**


```
const dynamodb = new AWS.DynamoDB();

const params = {
  RequestItems: {
    'Table-1': {
      Keys: [
        {
           HashKey: 'haskey',
        }
      ]
    },
    'Table-2': {
      Keys: [
        { foo: 'bar' },
      ]
    }
  }
};

const documentClient = new AWS.DynamoDB.DocumentClient();

const result = await documentClient.batchGet(params).promise()

```


The syntax of the Document Client simplifies this operation and makes it possible to get multiple items from different tables at once. Another simplification is that you do not need to provide the type of the key. The data type will just be derived from the given data type.
\
&nbsp;


### 4.3 Eventual and strong consistency

The previous chapter already introduced the terms **eventual** and **strong-consistency** while taking a look at the read and write capacity which needs to be provisioned for tables.

In the context of reading items this term becomes even more important in regards to the freshness of data[^21].

DynamoDB data is distributed and sharded to different nodes.

If data is changed these changes will be populated to the different nodes in the system.

This can take some time. From the authors experience around 200 milliseconds.

If you now write data and read it again you could end up with stale data from a node which has not yet been updated. When reading data in eventual consistent mode the first result from any node is returned. To cope with use cases where the consistency of data is important the possibility for strongly consistent reads have been introduced.

Imagine fast as consecutive writes to a counter value increasing from 0 to 3. 

An eventual consistent read could return different values from 0 to 3 while a consistent read always returns the right and final end result of 3 reading from more than 1 node.

Because of the multiple operations needed for a consistent read the amount of consumed read capacity is higher as well as the network latency.

Another disadvantage is that in the case of one node failing the read operation will fail in total because the end result can not be evaluated.
\
&nbsp;


## 5. Write items

In this chapter we will take a closer look at different ways to write data to the database.

At first we see how to write a single item then we will expand this concept to write multiple items. Both operations will be illustrated in code.


### 5.1 Single item write

To write an item to the database I need to provide the tablename and the attributes to write.

The used hash-key of the table needs to be included in the payload, a possible range key is optional. If the hash-key is not found in the payload the operation is rejected with an error so before writing data to the table knowledge of its structure is needed.

As you can see with the normal SDK the type of the data which should be written needs to be provided and will not be inferred itself from the type of variable. But rather the type needs to be specified as map as the key of the attribute and the value to write as the value of this key in the format String.

To write a number for example the Type would be “N” and the value “1”. In the example[^22] below you can see a string, boolean and a number value are written to the database.

Code Example for the DynamoDB SDK Client.


```
const dynamodb = new AWS.DynamoDB();

var params = {
  Item: {
   "Artist": {
     S: "Billy Elish"
    }, 
   "IsAlive": {
     BOOL: "true"
    }, 
   "Age": {
     N: "20"
    }
  }, 
  ReturnConsumedCapacity: "TOTAL", 
  TableName: "Artist"
 };

const result = await dynamodb.putItem(params).promise()
```


This complexity is greatly simplified when using the AWS DynamoDB Document Client.

As you can see in the example[^23] below data can be provided as it is as variable and the data type will be inferred and translated to the DynamoDB data type.

So instead of writing boolean data with the key “BOOL” and the value itself as String for example “true”. We can just pass the value **true **as it is and let the client handle the conversion.


```
const documentClient = new AWS.DynamoDB.DocumentClient();

const params = {
  TableName : 'Table',
  Item: {
     HashKey: 'haskey',
     NumAttribute: 1,
     BoolAttribute: true,
     ListAttribute: [1, 'two', false],
     MapAttribute: { foo: 'bar'},
     NullAttribute: null
  }
};

const result = await documentClient.put(params).promise()
```


For most use-cases this automatic conversion of datatypes works quite well and will enhance the developer experience while using Dynamodb to write data.


### 5.2 Multi item write

With the same pattern we used  in the previous chapter to write a single item to the database we can write multiple items in a single operation.

The  prerequisite for a successful write is the same as for single item operation meaning the hash-key of the table needs to be provided in the payload  but we can provide as many items to write to different tables in an array and all operations will be executed at once on the server side. In the example[^24] below You can see three different write operations to the same table in one array.

DynamoDB SDK


```
const dynamodb = new AWS.DynamoDB();

const params = {
  RequestItems: {
   "Music": [
       {
      PutRequest: {
       Item: {
        "AlbumTitle": {
          S: "Somewhat Famous"
         }, 
        "Artist": {
          S: "No One You Know"
         }, 
        "SongTitle": {
          S: "Call Me Today"
         }
       }
      }
     }, 
       {
      PutRequest: {
       Item: {
        "AlbumTitle": {
          S: "Songs About Life"
         }, 
        "Artist": {
          S: "Acme Band"
         }, 
        "SongTitle": {
          S: "Happy Day"
         }
       }
      }
     }, 
       {
      PutRequest: {
       Item: {
        "AlbumTitle": {
          S: "Blue Sky Blues"
         }, 
        "Artist": {
          S: "No One You Know"
         }, 
        "SongTitle": {
          S: "Scared of My Shadow"
         }
       }
      }
     }
    ]
  }
 };

const result = await dynamodb.batchWriteItem(params).promise()
```


A simplified version of a multi-item write can be seen in this example[^25] with the DynamoDB Document Client. One thing to notice is that a write operation cannot only contain the creation or update of an item but rather as well the deletion as you can see below. 


```
const documentClient = new AWS.DynamoDB.DocumentClient();

const params = {
  RequestItems: {
    'Table-1': [
      {
        DeleteRequest: {
          Key: { HashKey: 'someKey' }
        }
      },
      {
        PutRequest: {
          Item: {
            HashKey: 'anotherKey',
            NumAttribute: 1,
            BoolAttribute: true,
            ListAttribute: [1, 'two', false],
            MapAttribute: { foo: 'bar' }
          }
        }
      }
    ]
  }
};

const result = await documentClient.batchWrite(params).promise()
```

\
&nbsp;


## 6. Transactions

Because of the lack of a domain-specific language, such as SQL for RDBMS, NoSQL databases use different opportunities for data lifecycles. To perform standard CRUD operations (create, read, update, delete), Amazon DynamoDB offers easy to use application programming interfaces (APIs). Transactions within or across tables are supported by coordinated, all-or-nothing changes to multiple items. Of course ACID-standards (atomicity, consistency, isolation, durability) regarding Transactions supports users to maintain data correctness in the applications. 

Furthermore the database allows incremental and conditional operations what is mentioned like this:

“Amazon DynamoDB provides atomic item and attribute operations for adding, updating, or deleting data. Further, item-level transactions can specify a condition that must be satisfied before that transaction is fulfilled. For example, you can choose to update an item only if it already has a certain value.

Conditional operations allow you to implement optimistic concurrency control systems on Amazon DynamoDB. For conditional updates, Amazon DynamoDB allows atomic increment and decrement operations on existing scalar values without interfering with other write requests.”[^26]

The Amazon DynamoDB Developer Guide gives more technical informations and examples to the restrictions and constraints of transactions setted up in DynamoDB:

“Classic APIs



* TransactWriteItems – A batch operation that allows Put, Update, and Delete operations to multiple items both within and across tables with a guaranteed all-or-nothing result.
* TransactGetItems – A batch operation that allows Get operations to retrieve multiple items from one or more tables. 

[...]

DynamoDB transactional API operations have the following constraints:



* A transaction cannot contain more than 25 unique items. 
* A transaction cannot contain more than 4 MB of data.
* No two actions in a transaction can work against the same item in the same table. For example, you cannot both ConditionCheck and Update the same item in one transaction.
* A transaction cannot operate on tables in more than one AWS account or Region.
* Transactional operations provide atomicity, consistency, isolation, and durability (ACID) guarantees only within the AWS Region where the write is made originally. Transactions are not supported across Regions in global tables. For example, suppose that you have a global table with replicas in the US East (Ohio) and US West (Oregon) Regions and you perform a TransactWriteItems operation in the US East (N. Virginia) Region. In this case, you might observe partially completed transactions in the US West (Oregon) Region as changes are replicated. Changes are replicated to other Regions only after they have been committed in the source Region.”[^27]

\
&nbsp;

## 7. Local and global indexes

Data in Amazon DynamoDB is generally indexed for getting faster results of queries using a primary key. In order to widen the functionality of indexing data, databases use secondary indexes such as global indexes and local indexes. Secondary indexes can also be used as an alternate query path.

If a table is defined with a primary key and a sort key, Amazon DynamoDB supports the setup of both secondary indexes mentioned above:



* “Global secondary index—An index with a partition and optional sort key that can be different from those on the table.
* Local secondary index—An index that has the same partition key as the table, but a different sort key.”[^28]
Each table can be set up with one or more of each secondary indexes, global and local. It's also possible for documents to define secondary indexes either global or local on any top-level JSON element.

“Names for tables and secondary indexes must be at least 3 characters long, but no greater than 255 characters long. The following are the allowed characters:

• A-Z

• a-z

• 0-9

• _ (underscore)

• - (hyphen)

• . (dot)”[^29]

\
&nbsp;

## 8. Streams

Table activities can be gathered using an optional feature called Amazon DynamoDB Streams. It is not real-time analytic but changes of data like standard CRUD (create, read, update, delete) operations can be recorded in near real time and chronologically ordered. Each activity is tracked and logged with other metadata like timestamp, information of the table like name etc. 



* ”A new item is added to the table: The stream captures an image of the entire item, including all of its attributes.
* An item is updated: The stream captures the "before" and "after" image of any attributes that were modified in the item.
* An item is deleted from the table: The stream captures an image of the entire item before it was deleted.”[^30]
Together with other solutions there’s even more automation possible like this:

“Amazon DynamoDB Streams can be used with AWS Lambda to create trigger-code that executes automatically whenever an event of interest (add, update, delete) appears in a stream. This pattern enables powerful solutions, such as data replication within and across AWS Regions, materialized views of data in DynamoDB tables, data analysis using Amazon Kinesis, notifications via Amazon Simple Notification Service (Amazon SNS) or Amazon Simple Email Service (Amazon SES) and much more.”[^31]

An important note is the fact of stream records lifetime, which exceeds after 24 hours. Afterwards they'll be removed automatically from the stream. 

The following example from the developers guide gives a clinch of the possibilities:

“consider a Customers table that contains customer information for a company. Suppose that you want to send a "welcome" email to each new customer. You could enable a stream on that table, and then associate the stream with a Lambda function. The Lambda function would run whenever a new stream record appears, but only process new items added to the Customers table. For any item that has an EmailAddress attribute, the Lambda function would invoke Amazon Simple Email Service (Amazon SES) to send an email to that address.”[^32]


![alt_text](images/image4.png "image_tooltip")


Referring to the conditional clauses mentioned above, no email will be sent to the last customer (Craig Roe) because of the missing entry of his Email Address. 

For simultaneous reading of a shard in DynamoDB there’s a limit set for two processes at the same time. Ignoring this limit can lead to request throttling.

\
&nbsp;

## 9. In-memory acceleration

AWS DynamoDB itself already offers fast read and write operations in a couple of milliseconds. For use-cases where this is not enough AWS introduced in the year 2017 a new addon for in-memory acceleration which is called DAX[^33]. As you can see in the image[^34] below it can for example be used in front of any Dynamodb table and act as an in-memory cache cluster which will automatically scale in a serverless fashion. As a result, accelerating performance by factor 10 offering faster read and write operations. Making it possible to read and write data not in milliseconds but microseconds. 
![alt_text](images/image5.png "image_tooltip")


In the code example[^35] below we will create a DynamoDB Table which will contain our test data. As you can see the read and write capacity is quite low which will lead to requests throttling of fast recurring read operations without any acceleration.


```
const dynamodb = new AWS.DynamoDB()

const params = {
    TableName : "TryDaxTable",
    KeySchema: [       
        { AttributeName: "pk", KeyType: "HASH"},  //Partition key
    ],
    AttributeDefinitions: [       
        { AttributeName: "pk", AttributeType: "N" }
    ],
    ProvisionedThroughput: {       
        ReadCapacityUnits: 1, 
        WriteCapacityUnits: 1
    }
};

const result = await dynamodb.createTable(params).promise()
```


Then we will query data with the AWS document client. But instead of using the client itself we will provide an instance of the dax client.


```
// Initiate dax client
const AmazonDaxClient = require('amazon-dax-client');
const AWS = require("aws-sdk");

const dynamoDBTableEndpoint = "Please provide endpoint value"

const ddbClient = new AWS.DynamoDB.DocumentClient()
const client = new AmazonDaxClient({endpoints: dynamoDBTableEndpoint })

const tableName = "TryDaxTable";
const params = {
    TableName: tableName,
    KeyConditionExpression: "pk = :pkval",
    ExpressionAttributeValues: {
        ":pkval":pk,
    }
};

const result = await client.query(params).promise()

```


Reading with the dax client will now get the data from the DynamoDB client once saving it to the cache layer. All consecutive read operations will then be handled by the cache layer greatly accelerating reading speed and preventing request throttling in the underprovisioned dynamodb table. 
\
&nbsp;


## 10. Conclusion

In a world where data is getting more and more important and the many databases we today know to save all kinds of data in different formats. AWS Dynamodb has found a good spot in the niche of NoSQL databases to play out its advantages and offer a good possibility to store data in a reliable, secure and very cost-effective manner.

It abstracts complex business logic for sharding, saving data, automatic failover and data backup in a very easy to use Software-Development-Kit for developers.

It offers a high percentage of availability () as documented in the Aws service Level Agreements[^36]  while still being very cost-effective.

It certainly does not fit all use cases and will never conquer the world of other SQL based databases.

But for the right use-case for example in a serverless stack and combined with other AWS Services like Lambda and SQS it is easy and fun to use.

The authors of this document hope they could give the reader a good overview of the architecture, the features, some code examples to get started as well as some advantages and disadvantages to look out for when using this kind of database.


## 11. Bibliography


[^1]:
     Dynamo: Amazon’s Highly Available Key-value Store

[^2]:
     Dynamo: Amazon’s Highly Available Key-value Store

[^3]:
      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^4]:
      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^5]:
      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^6]:
      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^7]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^8]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^9]:
      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^10]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^11]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^12]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^13]:
     Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^14]:
     Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^15]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^16]:
     Amazon DynamoDB On-Demand
    [https://aws.amazon.com/de/blogs/aws/amazon-dynamodb-on-demand-no-capacity-planning-and-pay-per-request-pricing/](https://aws.amazon.com/de/blogs/aws/amazon-dynamodb-on-demand-no-capacity-planning-and-pay-per-request-pricing/)

[^17]:
     AWS DynamoDB Throughput Default Quotas
    https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ServiceQuotas.html#default-limits-throughput

[^18]:
     Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^19]:
     Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^20]:
     TypeScript 1.7 Documenation https://www.typescriptlang.org/docs/handbook/release-notes/typescript-1-7.html

[^21]:
     AWS DynamoDB Developer Guide Read and Write Capacity https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.ProvisionedThroughput.Manual

[^22]:
     Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^23]:
      Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^24]:
      Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^25]:
      Amazon DynamoDB SDK for NodeJS https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB.html

[^26]:
     Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^27]:

     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^28]:

      Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^29]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^30]:

     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^31]:
     Amazon Web Services - Comparing the Use of Amazon DynamoDB and Apache HBase for NoSQL

[^32]:
     Amazon DynamoDB Developer Guide API Version 2012-08-10

[^33]:
     AWS DynamoDB Dax https://aws.amazon.com/de/dynamodb/dax/

[^34]:
     AWS DynamoDB Dax https://aws.amazon.com/de/dynamodb/dax/

[^35]:
     AWS DynamoDB SDK Dax https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.client.run-application-nodejs.01-create-table.html

[^36]:
     AWS DynamoDB Service Level Agreement https://aws.amazon.com/de/dynamodb/sla/
