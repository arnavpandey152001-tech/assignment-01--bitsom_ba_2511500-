## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system where lawyers need to search large contracts using natural language queries. Keyword-based systems rely on exact word matches, which means they may fail to retrieve relevant sections if the wording in the query differs from the wording in the document. For example, a query like "What are the termination clauses?" may not return results if the document uses different phrasing such as "conditions for contract termination."

Vector databases address this limitation by enabling semantic search. Instead of matching exact keywords, they convert both the query and the document text into vector embeddings that capture the underlying meaning of the text. This allows the system to retrieve relevant results even when different words or phrases are used to express the same concept.

In this system, each section of the contract would be converted into embeddings and stored in a vector database. When a lawyer submits a query, it is also converted into an embedding, and similarity search (such as cosine similarity) is used to find the most relevant sections of the contract.

Therefore, a vector database plays a crucial role in enabling efficient and accurate semantic search, making it far more suitable than traditional keyword-based approaches for this use case.