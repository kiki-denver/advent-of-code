require "tree"

input = INPUT.split("\n").freeze
DIRECTORY_PREFIX = "dir "
def new_directory(name)
  # assign directories am initial size of 0
  Tree::TreeNode.new(name, 0)
end

def new_file_update_directory_sizes(name, size, current_directory)
  # store file size in node contents and update filesystem
  file = Tree::TreeNode.new(name, size)
  current_directory << file
  # add file size to parent directories total sizes
  file.parentage.each { |dir| dir.content = dir.content + size}
end

def change_directory(current_dir, arg)
  case arg
  when "/" # go to the root
    current_dir = current_dir.root
  when ".." # move out a level
    current_dir = current_dir.parent
  else # it's a directory name
    dir_name = DIRECTORY_PREFIX + arg
    current_dir = current_dir[dir_name] ? current_dir[dir_name] : current_dir << new_directory(dir_name)
  end

  current_dir
end

# build a filesystem based on terminal input and return the root node
def build_filesystem(input)
  current_directory = new_directory(DIRECTORY_PREFIX + "/")

  input.each_with_index do |row, i|
    # it's a change directory command
    if row[0..3] == "$ cd"
      # `row.split[2]`: get the cd arg ["$", "cd", "/_or_.._name"]
      current_directory = change_directory(current_directory, row.split[2])
    end

    # it's a list command, let's iterate through the contents of the current directory
    if row[0..3] == "$ ls"
      item = input[i + 1]
      type = item[0]

      # go until the end of the file and/or directory listing(s)
      while type != "$"

        if type == "d" # it's a directory
          dir_name = item
          # if it's the first time we're seeing the directory, add it to the filesystem
          current_directory[dir_name] ? current_directory[dir_name] : current_directory << new_directory(dir_name)
        elsif type.to_i != 0 # it's a file, starting with the size
          file_size_s, file_name = *item.split
          # if it's the first time we're seeing the file, add it to the filesystem
          if current_directory[file_name].nil?
            new_file_update_directory_sizes(file_name, file_size_s.to_i, current_directory)
          end
          # current_directory[file_name] ? current_directory[file_name] : new_file_update_directory_sizes(file_name, file_size, current_directory)
        end

        i += 1
        item = input[i + 1]
        type = item ? item[0] : "$"
      end
    end
  end
  current_directory.root
end

def sum_of_directories_at_most(total_size, root_node)
  root_node.map do |node|
    node.name.start_with?(DIRECTORY_PREFIX) && node.content <= total_size ? node.content : 0
  end.sum
end

solve!(
  "The sum of directories with a total size of at most 100000:",
  sum_of_directories_at_most(100000, build_filesystem(input)),
)

solve!(
  ":",
  0,
)
