
[1mFrom:[0m F:/application/test_api/reservation_management/app/models/reservation.rb @ line 37 Reservation#check_params_validation:

    [1;34m16[0m:     [32mdef[0m [1;34mcheck_params_validation[0m
    [1;34m17[0m:       [32mif[0m [1;36mself[0m.restaurant_id.present?
    [1;34m18[0m:         [1;36mself[0m.errors.add([33m:restaurant_id[0m, [31m[1;31m"[0m[31mNo Restaurant is found[1;31m"[0m[31m[0m) [32munless[0m [1;34;4mRestaurant[0m.where([35mid[0m: [1;36mself[0m.restaurant_id).first.present?
    [1;34m19[0m:       [32mend[0m
    [1;34m20[0m: 
    [1;34m21[0m:       [32mif[0m [1;36mself[0m.table_id.present? &&  [1;36mself[0m.restaurant_id.present?
    [1;34m22[0m:       	table = [1;34;4mTable[0m.where([35mid[0m: [1;36mself[0m.table_id, [35mrestaurant_id[0m: [1;36mself[0m.restaurant_id).first
    [1;34m23[0m:         [32munless[0m table.present?
    [1;34m24[0m:       		[1;36mself[0m.errors.add([33m:table_id[0m, [31m[1;31m"[0m[31mNo Table is found[1;31m"[0m[31m[0m) 
    [1;34m25[0m:         [32mend[0m
    [1;34m26[0m:         [32mif[0m  (table.present? && ([1;36mself[0m.guest_count > table.max_count) || ([1;36mself[0m.guest_count < table.min_count))
    [1;34m27[0m:         	[1;36mself[0m.errors.add([33m:guest_count[0m, [31m[1;31m"[0m[31mshould be in between #{table.min_count}[0m[31m and #{table.max_count}[0m[31m for the selected table[1;31m"[0m[31m[0m) 
    [1;34m28[0m:         [32mend[0m
    [1;34m29[0m:       [32mend[0m
    [1;34m30[0m: 
    [1;34m31[0m:       [32mif[0m [1;36mself[0m.restaurant_shift.present? && [1;36mself[0m.restaurant_time.present?
    [1;34m32[0m: 		[32mif[0m [1;36mself[0m.restaurant_shift == [31m[1;31m'[0m[31mM[1;31m'[0m[31m[0m
    [1;34m33[0m:       	  [32munless[0m ([31m[1;31m"[0m[31m9:00[1;31m"[0m[31m[0m.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m) < [1;36mself[0m.restaurant_time.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m)  && [31m[1;31m"[0m[31m13:00[1;31m"[0m[31m[0m.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m) > [1;36mself[0m.restaurant_time.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m))
    [1;34m34[0m:       	  	[1;36mself[0m.errors.add([33m:restaurant_time[0m, [31m[1;31m"[0m[31mshould be between 9:00 am to 13:00 pm[1;31m"[0m[31m[0m) 
    [1;34m35[0m:       	  [32mend[0m
    [1;34m36[0m:       	[32melsif[0m [1;36mself[0m.restaurant_shift == [31m[1;31m'[0m[31mE[1;31m'[0m[31m[0m
 => [1;34m37[0m:       		      binding.pry
    [1;34m38[0m:       	  [32munless[0m ([31m[1;31m"[0m[31m18:00[1;31m"[0m[31m[0m.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m) < [1;36mself[0m.restaurant_time.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m)  && [31m[1;31m"[0m[31m23:00[1;31m"[0m[31m[0m.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m) > [1;36mself[0m.restaurant_time.to_time.strftime([31m[1;31m"[0m[31m%d/%m/%Y %H:%M[1;31m"[0m[31m[0m))
    [1;34m39[0m:       	  	[1;36mself[0m.errors.add([33m:restaurant_time[0m, [31m[1;31m"[0m[31mshould be between 18:00 pm to 23:00 pm[1;31m"[0m[31m[0m) 
    [1;34m40[0m:       	  [32mend[0m
    [1;34m41[0m:       	[32mend[0m
    [1;34m42[0m:       [32mend[0m
    [1;34m43[0m: 
    [1;34m44[0m:     [32mend[0m

