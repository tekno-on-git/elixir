defmodule People.Person do
  defstruct first_name: nil, last_name: nil, birthday: nil, location: "home"

  def full_name(%__MODULE__{first_name: first_name, last_name: last_name} = _person) do
    "#{first_name} #{last_name}"
  end

  def age(%__MODULE__{birthday: birthday} = _person) do
    Date.diff(Date.utc_today(), birthday) / 365.25
  end

  def toggle_location(%__MODULE__{location: "away"} = person) do
    person |> set_location("home")
  end

  def toggle_location(%__MODULE__{location: "home"} = person) do
    person |> set_location("away")
  end

  defp set_location(%__MODULE__{} = person, location) do
    %{person | location: location}
  end

  defimpl Inspect do
    def inspect(
          %{
            first_name: first_name,
            last_name: last_name,
            location: location
          },
          _
        ) do
      "Person[#{first_name} #{last_name}, #{location}]"
    end
  end
end
