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

  def print_report(r, margin)

    ('<table class="table table-striped">' + print_report_inner(r, margin) + '</table>').html_safe 
  end

  def print_report_inner(r, margin) 
    final = Array.new
    # final << 
    if r
      r.children.each do |i|
        final << content_tag(:tr, content_tag(:td, i.name + " " + i.quantity.to_s, {:style => "padding-left: #{margin}px"}))
        if i.has_children?
          # hfhewjfhe

          final << print_report_inner(i, margin + 30)
          
        end
      end
    end
    # final << 
    final.join(' ')
  end

  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-block devise-bs">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <h5>#{sentence}</h5>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
  
end
