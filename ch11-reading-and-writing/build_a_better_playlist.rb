def music_shuffle filenames
  numberofChecks = 0
  recursive_shuffle filenames, [], numberofChecks
end

# def music_shuffle_array arr
#   numberofChecks = 0
#   recursive_shuffle arr, [], numberofChecks
# end

def checkSameFolder shuffled_array_lastElement, newElement
  firstItem =  shuffled_array_lastElement.split('/')
  secondItem = newElement.split('/')
  firstItem[-2] == secondItem[-2]
end


def recursive_shuffle unshuffled_array, shuffled_array, numberofChecks
  prng = Random.new
  if unshuffled_array.length == 0
    return shuffled_array
  else
    randomNumber = prng.rand(unshuffled_array.length)
    picked_song = unshuffled_array[randomNumber]
    previous_song = shuffled_array[-1]
    if previous_song != nil
      if !checkSameFolder(picked_song, previous_song) || numberofChecks > unshuffled_array.length
        shuffled_array.push(picked_song)
        unshuffled_array.delete_at(randomNumber)
        numberofChecks = 0
      else
        numberofChecks +=1
      end
    else
      shuffled_array.push(picked_song)
      unshuffled_array.delete_at(randomNumber)
      numberofChecks = 0
    end
  end
  recursive_shuffle unshuffled_array, shuffled_array, numberofChecks
end



# songs = ['aa/bbb', 'aa/ccc', 'aa/ddd',
#          'AAA/xxxx', 'AAA/yyyy', 'AAA/zzzz', 'foo/bar']
# p songs
# p music_shuffle songs
