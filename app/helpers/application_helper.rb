module ApplicationHelper
	def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

	  def nested_groups(attributes)
	   content_tag :ul do
        attributes.each do |attribute|
            concat(content_tag(:li, attribute.first.name))
            if attribute.first.has_children? 
                concat(nested_attributes(attribute.first.children.arrange))
            end
        end
    end
	end

	def hash_list_tag(hash)
  html = content_tag(:ul) {
    ul_contents = ""
    ul_contents << content_tag(:li, hash[:parent])
    if hash[:children] 
    	hash[:children].each do |child|
      ul_contents << hash_list_tag(child)
    end
end

    ul_contents.html_safe
  }.html_safe
end
end
