class CreateMainTables < ActiveRecord::Migration
  def change

  	  create_table :customers do |t| # Asbestos management customers that own buildings and recieve reports, 
		  t.string :company
   	  	  t.string :street_adress
		  t.string :locality
		  t.string :region
		  t.string :postcode
		  
				  
		  t.timestamps
	   end
	   
     create_table :buildings do |t| # Buildings which contain spaces (rooms)
   	  	  t.string :buildingname
   	  	  t.string :buildingid
   	  	  t.string :street_adress
		  t.string :locality
		  t.string :region
		  t.string :postcode
   	  
   	  	  t.timestamps
   	  end
   	  
   	  create_table :spaces do |t| 	# Spaces which are composed of materials by
		  t.string :spacename 
		  t.string :spaceid 
		  t.text :roomnum 
		  t.integer :floor
		  t.integer :roomsqft
		  
		  t.timestamps
	   end
   	  
  	  create_table :materials do |t| # Materials which are detailed by inspections
		  t.integer :space
  	  	  t.string :materialtype # eg. Ceiling Plaster, 2nd flr rooms
  	  	  t.integer :building	 # building id number	
		  t.string :ACMtype
		  t.string :HAnum
		  t.string :color
		  t.string :result
		  t.integer :numsamp
		  t.integer :sqft
		  t.date :sampledate
		  t.integer :batchnum
		  t.text :comments
		  
		  t.timestamps
	   end
	
	   create_table :inspections do |t| # Describe inspection results, informed by samples, are performed persuant to projects
	   	   t.integer :material
	   	   t.date :inspectiondate
	   	   t.integer :project
	   	   t.string :inspector
	   	   t.boolean :sampled
	   	   t.string :laboratory
	   	   t.string :result
	   	   t.boolean :removed
		   t.decimal(3,2) :damageamt
		   t.string :damagetype
		   t.string :source_report

		   t.timestamps
	   end
	
	   create_table :samples do |t| #Lab results from samples taken during inspections
	   	   t.integer :inspection
	   	   t.integer :batchnum
	   	   t.integer :samplenum
	   	   t.boolean :nob
	   	   t.string :PLMresult
	   	   t.string :PLMNOBresult
	   	   t.string :TEMresult
	   	   t.string :TEMlab

	   	   t.timestamps

	  create_table :projects do |t| #Construction projects for which we produce reports, owned by buildings
	  	   t.string :projectname
	  	   t.integer :building
	  	   t.string :status
	  	   t.date :startdate
	  	   t.date :completiondate
	  	   t.text :description
	  	   
	  	   t.timestamps
	  end

 
  	  create_table :reports do |t| # Reports available for download, are produced for projects, can be accessed by assigned users or customer admin users
  	  	   t.string :reportname 
		   
		   t.text :description 
		   t.string :filename 
		   t.belongs_to :customer, index :true
		   t.timestamps
	   end
	   
	   create_table :report_access_records do |t| # User level report access records
		   t.string :report
		   t.string :user 
	  
 		   t.timestamps
	   end
  end
end


class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :customers, :string
    
  end
end


	


#Generate strings

rails generate scaffold customer company:string:uniq street_address:string region:string postcode:string

rails generate scaffold report reportname:string:uniq description:text filename:string:uniq customer:references report_date:date 

