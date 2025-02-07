{
<Scenario>:at least onestep is not matched from Provide the Step Definitions as defined in items: offered_shop_items = [ "apples", "beef", "potatoes", "pork" ]
<Given>"I buy {shop_item:ShopItem2}")
    def step_impl(context, shop_item):
        # EXAMPLE: "potatoes" => (selected_index=2, selected_text="potatoes")
<When>  shop_item_id = context.shop.shop_item_index2id(selected_index)
<And> context.shopping_cart.append(shop_item_id)
<And> context.shopping_cart.append(shop_item_id)
}