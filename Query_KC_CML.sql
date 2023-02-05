SELECT b.name model, c.name brand, d.name brand_group, a.dt_purchase purchase_date, a.license_plate license_plate,
e.name color, a.total_km total_km, g.name insurance_company, f.policy_num policy_num
FROM TEST_DDL.vehicles a
INNER JOIN TEST_DDL.models b
ON a.id_model = b.id_model
INNER JOIN TEST_DDL.brands c
ON b.id_brand = c.id_brand
INNER JOIN TEST_DDL.brand_holdings d
ON c.id_holding = d.id_holding 
INNER JOIN TEST_DDL.colors e
ON a.id_color = e.id_color
INNER JOIN TEST_DDL.insurance f 
ON a.id_insurance = f.id_insurance 
INNER JOIN TEST_DDL.insurance_companies g
ON f.id_ins_co = g.id_ins_co
WHERE a.dt_deregistration = '4000-01-01';