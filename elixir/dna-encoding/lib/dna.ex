defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> <<0b0001::4>>
      ?C -> <<0b0010::4>>
      ?G -> <<0b0100::4>>
      ?T -> <<0b1000::4>>
      _ -> <<0b0000::4>>
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end

    # Please implement the decode_nucleotide/1 function
  end

  def encode("", acc), do: acc

  def encode(<<head::utf8, rest::binary>>, acc) do
    encode(rest, acc <> encode_nucleotide(head))
  end

  def encode(dna) do
    encode(dna, encode_nucleotide(""))
  end

  def decode(dna) do
    # Please implement the decode/1 function
  end
end
