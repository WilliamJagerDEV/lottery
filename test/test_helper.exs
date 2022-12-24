ExUnit.start(capture_log: true)
Ecto.Adapters.SQL.Sandbox.mode(Lottery.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:ex_machina)

Code.put_compiler_option(:warnings_as_errors, true)
