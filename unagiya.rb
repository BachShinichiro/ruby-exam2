seats_and_groups = gets.split(/\s/)
empty_seat = [*1..(seats_and_groups[0].to_i)]
seats_count = empty_seat.count
number_of_visitors = seats_and_groups[1].to_i

[*1..number_of_visitors].each do
  used_seats = gets.split(/\s/)
  users = used_seats[0].to_i
  seating_number = used_seats[1].to_i
  fill_last_number = ((seating_number + users) - 1)
  if fill_last_number > seats_count
    fill_last_number = fill_last_number - seats_count
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
  end
  if next_seat_candidate.count == next_seat_candidate.uniq.count
    if ((seating_number + users) - 1) > seats_count
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
    else
      empty_seat = empty_seat - [*seating_number..fill_last_number]
    end
  end
end
puts seats_count - empty_seat.count