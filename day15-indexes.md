# Day 15- Indexes
## What is an Index?
An Index is a database object that speed up data retrieval by allowing the database to locate rows quickely, but it increase storage usage and slows the INSERT, UPDATE, and DELETE operations because the index must also be mainatained.
## Good Columns to Index
-Primary keys are indexed autometically.
-INdex foreign keys because they are used in JOINs.
-Index appointment_date because reports often filter by date.
-Index last_name because users search patients by name.
## Columns not to Index
-Do not index the gender or is_active because they have very few distinct values.
-Avoiding the indexing every column because indexes consume storage and slow the INSERT,UPDATE, and DELETE operations.
## Conclusion
Indexes improves read performance but slow down INSERT,UPDATE, and DELETE operations.