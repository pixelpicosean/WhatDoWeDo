package data.item;

/**
 * ...
 * @author
 */
class ItemBox extends WDItem
{

	public function new()
	{
		super();

		this.name = "Box";
		opName = "Drop";
		this.pathIcon = AssetPaths.BOX1__png;
		this.pathOnGround = AssetPaths.BOX1__png;

		scaleOnGround = 0.3;
	}

}