
CREATE OR REPLACE FUNCTION change_customer_email(
	_customer_id INTEGER,
	new_email VARCHAR(200)

)
RETURNS VARCHAR AS

$function$
--$$
	BEGIN 
	UPDATE customer  
	SET email = new_email
	WHERE customer_id = _customer_id;
	RETURN CONCAT('You have successfully updated your email to: ', new_email) AS print_result;
	END;
$function$

--$$

LANGUAGE plpgsql;

SELECT * FROM customer;

SELECT change_customer_email(5, 'elizabrownies@gmail.com');


CREATE OR REPLACE PROCEDURE update_date_language (
	_language_id int,
	_name varchar
)
LANGUAGE plpgsql
AS $$
	BEGIN 
	UPDATE language
	SET last_update = current_date
	WHERE language_id = _language_id AND name = _name;
	COMMIT;
	END;
$$


SELECT *
FROM language ;

CALL update_date_language(1, 'English') ;


CALL remove_category(9, 'Foreign');



