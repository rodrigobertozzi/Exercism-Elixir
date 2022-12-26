defmodule Username do
  def sanitize(''), do: ''

  def sanitize([c | rest]) do
    sanitized =
      case c do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> '_'
        c when c >= ?a and c <= ?z -> [c]
        _ -> []
      end

    sanitized ++ sanitize(rest)
  end
end
