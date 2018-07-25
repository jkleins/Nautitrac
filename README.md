# CoreDataStackExample

To reproduce:
Run on iPad
select a trip
select a logEntry
Edit the lat or long on the detail view
Click save and you see the row delete from the tableview
go back to trips list and then select the same one again
You will see it did save appropriately.

The breakpoints on the fetchResultsController stop at .delete not .update

Any ideas?
