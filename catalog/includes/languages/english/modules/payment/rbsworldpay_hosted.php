he tep_image()
   function on the administration tool
   (admin/includes/functions/html_output.php)

 * UPS shipping module removed due to it violating the UPS terms of service.
   An alternative module can be found here:
   http://www.oscommerce.com/community/contributions,1323

 * Updated codebase for PHP 5.0 compatibility

 * Updated database structure for MySQL 5.0 compatibility

------------------------------------------------------------------------------
12/07/2003 osCommerce 2.2 Milestone 2
------------------------------------------------------------------------------

 * Shared SSL servers are now properly supported with cookie parameters
   existing for both normal and secure servers.

 * The installation/upgrade procedure was simplified with a new layout.

 * Internally set PHPs error reporting to E_ALL to remove all notice messages
   on the Catalog module.

 * Renamed default.php to index.php.

 * Sanitize all user input on th