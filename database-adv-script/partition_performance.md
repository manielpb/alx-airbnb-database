1. Partition Pruning: MySQL automatically ignored irrelevant partitions, reducing scanned rows.
2. Faster Query Execution: Especially for large historical tables, filtering on date ranges became significantly faster.
3. Better Maintainability: Old partitions can be archived or dropped without impacting current data.
