# My Ideas Playground

I created a POC MariaDB database to help me think through the design of MyIdeas 2.0.

I added dummy data for scenes, and palettes. 

## Food for Thought

I forgot that MySQL/MariaDB and like don't have all the crazy stuff that Oracle has and as a result, 
I reconsidered a few initial thoughts.  I think maybe the scene's `id` column should ne an `int` in order ot make it 
easier to let the database do what they do best: work with data.

UUID is a bit trickier to work with, especially when using as a foreign key and while this can be done, 
it's an over complication.  The UUID is really useful to pass to the front end for identity still.

This id vs uuid as primary key is something to pose to the larger brain trust (I'd love to figure out/learn an elegant way to do it).

Also, there are a few other fields we have on the 
[scene related data members](https://github.com/sherwin-williams-co/prism-core/blob/0a75f8797db9d183a6f4a4e8ae9dd47c26efbc4a/packages/toolkit/src/types.ts#L67); 
we
might want to find them a home in the db too.