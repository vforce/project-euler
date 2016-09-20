day = 7
date = 0
month = 1
year = 1900

sunday_count = 0

while year < 2001
  if date==0 and year>1900 and day==1
    puts "---> sunday"
    sunday_count += 1
  end

  if (month==9 or month==4 or month==6 or month==11)
    if day == 30
      day = 1
      month +=1
    else 
      day += 1
    end
  elsif (month==1 or month==3 or month==5 or month==7 or month==8 or month==10)
    if day == 31
      day = 1
      month +=1
    else 
      day += 1
    end
  elsif month==12
    if day==31
      day = 1
      year += 1
      month = 1
    else
      day += 1
    end
  else #month Feb
    if year%4!=0 or (year%100==0 and year%400!=0) #not leap year
      if day==28
        day = 1
        month += 1
      else
        day += 1
      end
    else
      if day==29
        day = 1
        month += 1
      else
        day += 1
      end
    end
  end

  date = (date+1)%7
end

puts sunday_count #171 is the correct answer
