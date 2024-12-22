defmodule Newsletter do
  def read_emails(path) do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    log = open_log(log_path)
    do_send_emails(emails, log, send_fun)
    close_log(log)
  end

  defp do_send_emails([], _, _), do: :ok

  defp do_send_emails([email | emails], log, send) do
    case send.(email) do
      :ok -> log_sent_email(log, email)
      _ -> nil
    end

    do_send_emails(emails, log, send)
  end
end
