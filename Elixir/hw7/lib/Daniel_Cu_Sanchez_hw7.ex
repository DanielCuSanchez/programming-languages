defmodule Hw.CSVFiles do
  def example() do
    # Functions to work with files
    filename = "students_usa.csv"
    contents = """
    Index,Name,Email,Graduation,Grade
    1,Loreto Sepúlveda,A12345678@tec.mx,06/24/2021,B
    2,Yessica Castillo,A12346541@tec.mx,06/24/2021,A
    3,Valentín Caro,A12345696@tec.mx,12/18/2021,C
    4,Virginia Rodríquez,A12345683@tec.mx,12/18/2021,B
    5,Inocencio Arreola,A15833310@tec.mx,12/19/2021,B
    6,Benito Ramos,A20693321@tec.mx,06/22/2022,C-
    7,Bernardina González,A20210921@tec.mx,06/23/2022,A
    8,Gloria Mata,A27780010@tec.mx,06/23/2022,C
    9,Amaya Obando,A12433321@tec.mx,12/15/2022,B
    10,Maricruz Muñoz,A44813137@tec.mx,12/15/2022,A-
    """
    writeFile(contents, filename)

  end
  def main() do

  end
  def writeFile( contents, filename ) do
    # Write a file
    File.write(filename, contents)

    # Read a file, line by line
    data_list = File.stream!(filename)

    # Display the whole list
    for line <- data_list, do: IO.puts line

    # Read the whole file as a single string
    {:ok, contents} = File.read(filename)

    # Display the entire file
    IO.puts contents
  end
end
