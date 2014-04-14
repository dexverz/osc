 catalog.

 * New Who's Online section in the administration tool.

 * Updated payment and shipping modules structure - no longer has multiple
   include statements - and are now classes.

 * Administration Tool sections now with opened/closed box approach (the list
   of functions was getting too long!).

 * New login and create account option page (ala Amazon style)

 * Click on the products image (in products details) and a new browser window
   will open and resize itself to the image shown - used to display larger
   pictures of the product.

 * All font styles are now in stylesheets.

 * Full locaization support (ie, categories title, products descriptions,
   image buttons, etc)

 * Table names now as constants (variables)

 * Banner support functionality

 * Products expected now as normal products (with descriptions)

 * Stock control functionality

 * Products with different attributes can now be added to the shopping cart.
   (feature fix)

 * Authorize.net support added

 * Sessions can now be stored in the database

 * Tell-A-Friend function for products

 * Information box, with all informations about shipping & returns, privacy
   notice and conditions of use

 * Newsletter function in the administration tool.

 * New zones for germany, swiss and austria.

 * Prices can now be handled with/without tax. The tax would be correct
   calculated.

 * Prices in all countries which joined the euro currency, displays the prices
   in euro and national currency. This is a european guideline which is now
   support by TEP.

 * All address information is now stored in the address_book table only. This
   change was made to reduce redundancy and allow more feautures in the
   checkout part (e.g. selection of different BillTo and SendTo addresses)  

------------------------------------------------------------------------------
03/06/2001 The Exchange Project Preview Release 2.1
------------------------------------------------------------------------------

 * Payment methods are now modules, makes it easier to implement other payment
   methods. Supported methods COD, Credit Card, Paypal. CC also supports
   storing only part of the CC# in the DB with the other digits being emailled
   to a specific email address.

 * Shipping Modules - Modular shipping methods with support for UPS, USPS,
   FEDEX(Ground), Per Item and Flat rate shipping.

 * Db query clean up a few AS clauses were added for earlier MySQL versions.
   Error checking added for when no records exist.

 * Added languages box - customers can now choose their language anywhere
   except during the checkout procedure (due to POST variables in forms)

 * Added currencies box - customers can now choose their currency independent
   from the language chosen

 * Currencies can be added/deleted/modified through the administration tool -
   no longer through individual language files in the include directory

 * Added a 'Contact Us' Page.

 * Added COMMENTS field to Orders table - an order history
   Need to ALTER TABLE orders ADD comments TEXT not null;

 * Selectable columns in 'Product Listings'.

 * Added a delete button to the orders in the admin tool.

 * Solved a problem with the session id not being passed to the secure server.

 * Countries added to the admin tool.

 * The 'Add a Quickie' box now uses the model number instead of the product
   id.

 * The 'Search' box and the 'Advanced Search' now use the same engine.

 * Backup in the admin tool.

 * Numerous bugs fixed.

 * Categories box has been updated to display path taken in bold, and display
   the parent categories (tree navigation)

 * Font styles implemented

 * tep_image now optionally calculates image size