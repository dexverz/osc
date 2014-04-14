 only drop tables that are being restored.
  [r1804, r1805]

* Display module version on the Administration Tool if it contains a version
  signature string.
  [r1802]

* Add a .htaccess file to the admin/includes/ directory to prevent direct HTTP
  requests to PHP files.
  [r1775]

* Fix the pagination links on the Administration Tool -> Products Attributes
  page.
  [r1774, r1776]

* Verify the customers primary address when it is being updated.
  Verify the number of address book entries before inserting a new one.
  [r1766]

* Avoid removal of products when deleting a category in a search result
  listing.
  [r1754]

* Make the database session storage handler return an empty string for
  variables that don't exist in the session instead of returning a boolean
  false value.
  [r1752]

* Fix a variable name being checked against in the
  Administration Tool -> Tools -> Newsletter Manager section.
  [r1751]

* Improve the product nofitication logic on the checkout success page.
  [r1749]

* Fix http_build_query() compatibility function in the Administration Tool.
  [r1748]

* Increase the orders.payment_method database table field length to 255
  characters.
  [r1747]

* MySQL 5.0 Strict Mode compatibility fixes.
  [r1746, 1755, 1810]

* Fix logic with nested tables in the Administration Tool tableBlock class.
  [r1745]

* Add checks when creating files and dire