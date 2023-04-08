defmodule MessiaenTest do
  use ExUnit.Case, async: true

  doctest Messiaen

  describe "length/1" do
    test "gets a char duration length from the english dictionary by default" do
      assert Messiaen.length(?r) == 11
    end
  end

  describe "length/2" do
    test "can specify which language to fetch a length from" do
      assert Messiaen.length(?r, :en) == 11
      assert Messiaen.length(?r, :fr) == 3
    end
  end

  describe "lengths/1" do
    test "returns a list of lengths for the string's characters" do
      assert Messiaen.lengths("michael berkowitz") == [
               4,
               9,
               2,
               5,
               2,
               1,
               2,
               4,
               3,
               1,
               11,
               2,
               1,
               2,
               9,
               4,
               2
             ]
    end

    test "can specify which language map to use" do
      assert Messiaen.lengths("michael berkowitz", :fr) == [
               8,
               1,
               2,
               3,
               2,
               1,
               2,
               4,
               3,
               1,
               3,
               2,
               11,
               2,
               1,
               9,
               4
             ]
    end

    test "casts characters to lowercase" do
      assert Messiaen.lengths("MICHAEL") == [4, 9, 2, 5, 2, 1, 2]
    end

    test "ignores any characters not in the map" do
      assert Messiaen.lengths("m0ic3h++-\aael") == [4, 9, 2, 5, 2, 1, 2]
    end
  end
end
