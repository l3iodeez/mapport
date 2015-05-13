
class ConditionsGeneratorColumnPercentage < Wice::Columns::ConditionsGeneratorColumn  #:nodoc:
      def get_op_and_value(val)
        num = nil
        op  = nil

        # remove spaces
        val = val.gsub(' ','')

        first_digit_or_dot_index = val =~ /[0-9.]/
        if first_digit_or_dot_index
          op = val[0...first_digit_or_dot_index]
          op = '=' if op == ''
          num = (Float(val[first_digit_or_dot_index..-1])) rescue nil

          op = nil unless ['<','>','<=','>=','='].include?(op)
        end
        [op, num]
      end

      def  generate_conditions(table_alias, opts)   #:nodoc:
        unless opts.kind_of? Hash
          Wice.log "invalid parameters for the grid integer filter - must be a hash"
          return false
        end
        conditions = [[]]
        if opts[:eq]
          op, num = get_op_and_value(opts[:eq])
          if op && num
            conditions[0] << " #{@column_wrapper.alias_or_table_name(table_alias)}.#{@column_wrapper.name} " + op + " ? "
            conditions << num
          else
            opts.delete(:eq)
          end
        end

        if conditions.size == 1
          return false
        end

        conditions[0] = conditions[0].join(' and ')

        conditions
      end
end

