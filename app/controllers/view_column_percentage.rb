
  
class ViewColumnPercentage < Wice::Columns::ViewColumn #:nodoc:

        def render_filter_internal(params) #:nodoc:
          @contains_a_text_input = true

          @query, _, parameter_name, @dom_id = form_parameter_name_id_and_query(eq: '')

          opts = {size: 3, id: @dom_id, class: 'range-start'}

          opts[:class] += ' form-control input-sm'

          if auto_reload
            opts[:class] += ' auto-reload'
          end

          text_field_tag(parameter_name,  params[:eq], opts)
        end

        def yield_declaration_of_column_filter #:nodoc:
          {
            templates: [@query],
            ids:       [@dom_id]
          }
        end

        def has_auto_reloading_input? #:nodoc:
          auto_reload
        end
  
end


