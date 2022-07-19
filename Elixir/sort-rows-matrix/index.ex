defmodule Tfiles do
  def open_file(path) do
      stream = File.stream!(path)
      fixed_contents = stream
      |> Enum.map(&String.trim/1)
  end
      #{:ok, file} = File.open(path, [:read, :write], fn file -> IO.read(file, :line) end)
end
