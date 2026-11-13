create table if not exists public.worklog_state (
  id text primary key,
  content jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.worklog_state enable row level security;

create policy "Public can read worklog"
on public.worklog_state for select
to anon
using (true);

create policy "Public can add worklog"
on public.worklog_state for insert
to anon
with check (id = 'main');

create policy "Public can update worklog"
on public.worklog_state for update
to anon
using (id = 'main')
with check (id = 'main');
