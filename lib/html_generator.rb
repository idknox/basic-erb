require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(layout = nil)
    @layout = layout
  end


  def section(string)
    template = "<section><%= text %></section>"

    par = erb(template, :locals => {:text => string})
    layout(par)
  end

  def unordered_list(list)
    # stuff = list.join("</li><li>")
    template = "<ul><li><%= stuff.join('</li><li>') %></li></ul>"
    par = erb(template, :locals => {:stuff => list})
    layout(par)
  end

  def button(string, hash = nil)

    if hash
      template = "<button class='<%= hash_text %>'><%= button_text %></button>"
      par = erb(template, :locals => {:button_text => string, :hash_text => hash[:class]})
      layout(par)
    else
      template = "<button><%= button_text %></button>"
      par = erb(template, :locals => {:button_text => string})
      layout(par)
    end

  end

  private

  def layout(par)
    if @layout
      @layout["<%= yield %>"] = par
      @layout
    else
      par
    end
  end

end
