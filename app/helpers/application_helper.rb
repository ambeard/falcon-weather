module ApplicationHelper
def flash_class(key)
    flash_class = {
      "success" => "bg-green-100 border-green-400 text-green-700",
      "error" => "bg-red-100 border-red-400 text-red-700",
      "notice" => "bg-blue-100 border-blue-400 text-blue-700",
      "warning" => "bg-yellow-100 border-yellow-400 text-yellow-700"}
      
    flash_class[key]
  end   
end
