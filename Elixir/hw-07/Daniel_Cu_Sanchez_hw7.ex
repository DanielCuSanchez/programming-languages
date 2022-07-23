# HW_07-Functional_programs_Elixir
# Daniel Cu Sánchez - A01703613
# 22/07/2022
# init program: iex Daniel_Cu_Sanchez_hw7.ex
# command: Hw.CSVFiles.main()

# Main module
defmodule Hw.CSVFiles do
  # auxiliar function to test the file
  def create() do
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
  # This is the main function
  def main() do
    filename = "students_mex.csv"
    newFileName = "students_usa.csv"

    #Reading the file
    data = readFile(filename)
    #Getting the list
    list = convertData(data)
    #Adding the header to the file
    newData = [["Index","Name","Email","Graduation","Grade"] | list]
    #Creating the file
    writeCVS(newData,newFileName)

    #create() #This was just a test
  end
  #Converting the data
  def convertData(data)do
    list = tl(data)
    list
      |>Enum.map(&convertRow(&1))
  end
  #Formating the rows
  def convertRow(row) do
    [index, name, id, graduationStr, gradeStr] = row
    grade = getGrade(String.to_integer(gradeStr))
    email = "#{id}@tec.mx"
    graduation = formatDate(graduationStr)

    [index,name,email,graduation,grade]
  end

  def getGrade(number) do
    #cases for the numbers
    cond do
      number > 92 && number < 101 ->
        _letter = "A"
      number > 89 && number < 93 ->
        _letter = "A-"
      number > 86 && number < 90 ->
        _letter = "B+"
      number > 82 && number < 87 ->
        _letter = "B"
      number > 79 && number < 83 ->
        _letter = "B-"
      number > 76 && number < 80 ->
        _letter = "C+"
      number > 72 && number < 77 ->
        _letter = "C"
      number > 69 && number < 73 ->
        _letter = "C-"
      number > 66 && number < 70 ->
        _letter = "D+"
      number > 63 && number < 67 ->
        _letter = "D"
      number < 64 ->
        _letter = "E"
    end
  end
  #formating date
  def formatDate(mexicanDate) do
    temp = String.split(mexicanDate, "/")
    dateFormated = "#{Enum.at(temp, 1)}/#{Enum.at(temp, 0)}/#{Enum.at(temp, 2)}"

    dateFormated
  end
  #Fuction for reading the initial file
  def readFile(filename) do
    filename
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    # Using the 'capture' syntax
    |> Enum.map(&(String.split(&1, ",")))
    # Using a lambda function
    #|> Enum.map(fn row -> String.split(row, ",") end)
  end
  #Function for creating the final CVS
  def writeCVS(content, filename) do
    cvs = content
            |> Enum.map(&Enum.join(&1, ","))
            |> Enum.join("\n")
    File.write(filename,cvs)
  end

  #Auxiliar function for testing the program
  def writeFile( contents, filename ) do
    # Write a file
    File.write(filename, contents)
    # Read a file, line by line
    dataList = File.stream!(filename)
    # Display list
    for line <- dataList, do: IO.puts line
    # Read file as a single string
    {:ok, contents} = File.read(filename)
    # Display file in terminal
    IO.puts contents
  end
end
