module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
   # css_class = column == sort_column ? "current #{sort_direction}" : nil
    #direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    #link_to title, {:sort => column, :direction => direction}, {:class => css_class}


   #method -3

           css_class = column == sort_column ? "current #{sort_direction}" : nil
           direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
           link_to title, {:sort => column, :direction => direction}, {:class => css_class}


    #method -2
         # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
         # link_to title,:sort => column,:direction => direction


    # method -1
          #direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
          #link_to title,:sort => column,:direction => direction

  end

end
