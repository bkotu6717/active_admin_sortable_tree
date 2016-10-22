ActiveAdmin.register PincodesCity do
  permit_params :pincode, :city
  active_admin_importable do |model, hash|
  	  p_c = model.find_by_pincode(hash[:pincode])
  	  if p_c
  	  	p_c.update_attributes(hash)
  	  else
  	  	model.create(hash)
  	  end
   end
end