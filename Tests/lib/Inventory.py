from robot.api.deco import keyword
from Browser import Browser
import warnings

browser = Browser()

class Inventory:
    @keyword
    def get_product_list(self):
        """Fetch product details and return as a list of dictionaries."""

        # Locator for product elements
        product_contents_locator = ".inventory_item"

        browser.new_page('https://www.saucedemo.com/inventory.html')


        # Get all product elements
        product_elements = browser.get_elements(product_contents_locator)

        # Create an empty list to hold product information
        product_list = []

        # Iterate through each product element
        for index, product in enumerate(product_elements):
            product_obj = {
                'name': product.locator('.inventory_item_name').nth(index).text_content(),
                'description': product.locator('.inventory_item_desc').nth(index).text_content(),
                'price': product.locator('.inventory_item_price').nth(index).text_content()
            }
            product_list.append(product_obj)

        return product_list