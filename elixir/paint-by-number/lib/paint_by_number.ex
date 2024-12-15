defmodule PaintByNumber do
  defp palette_bit_size_rec(bits, color_count) do
    if Integer.pow(2, bits) >= color_count do
      bits
    else
      palette_bit_size_rec(bits + 1, color_count)
    end
  end

  def palette_bit_size(color_count) do
    palette_bit_size_rec(0, color_count)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits = palette_bit_size(color_count)
    value = <<pixel_color_index::size(bits)>>
    <<value::bitstring, picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    if picture == empty_picture() do
      nil
    else
      bits = palette_bit_size(color_count)
      <<value::size(bits), _rest::bitstring>> = picture
      value
    end
  end

  def drop_first_pixel(picture, color_count) do
    if picture == empty_picture() do
      empty_picture()
    else
      bits = palette_bit_size(color_count)
      <<_value::size(bits), rest::bitstring>> = picture
      rest
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
