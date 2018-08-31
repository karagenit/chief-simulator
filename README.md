# chief-simulator
Using Markov Chains to Simulate Chief Delphi Posts

- Fetch all chief posts, store in SQLite database
- Train markov chains
- Generate posts

Tables:
- Threads (id, title, created_date)
- Users (id, name)
- Forums (id, name)
- Posts (id, text, created_date, thread_id, user_id, forum_id)
