package source.data;
import data.item.ItemBox;
import data.item.ItemStone;
import data.item.ItemCar;
import data.WDItem;
import render.ItemRender;
import scene.PlayState;

/**
 * 核心数据都在这
 * @author
 */
class WDGame
{

    public var MAX_BAG_ITEM = 5;
	public var MAX_O2 = 100;
	public var curO2 = 66;

    //背包物品
    public var bagIitemDirty:Bool = false;
    public var bagItems:Array<WDItem>;

    //地上物品列表
    public var listItemOnGround:Array<WDItem>;
    public var selectedItemOnGround:WDItem;

    private static var self:WDGame;
    public static function getSelf():WDGame{
        if(self == null){
            self = new WDGame();
        }
        return self;
    }

    public function new()
    {

        bagItems= new Array<WDItem>();
        listItemOnGround = new Array<WDItem>();


        //puts some test data
        var rdRangeW:Float = 14 * 32;
        var rdRangeH:Float = 10 * 32;
        var rdLeft:Float = 1 * 32;
        var rdTop:Float = 6 * 32;

        for (i in 0...8) {
            var item:WDItem = new ItemStone();
            item.name = "item" + i;
            item.x = Math.random() * rdRangeW + rdLeft;
            item.y = Math.random() * rdRangeH + rdTop;
            listItemOnGround.push(item);
        }
        var car:WDItem = new ItemCar();
        car.x = 50;
        car.y = 300;
        listItemOnGround.push(car);
    }

    public function pickUpItem(wdItem:WDItem):Void {
        bagItems.push(wdItem);
        wdItem.linkedRender.destroy();
        listItemOnGround.remove(wdItem);
        bagIitemDirty = true;
    }

    public function tryPickUpItem():Bool{

        if(bagItems.length >= MAX_BAG_ITEM){
            return false;
        }

        if(selectedItemOnGround != null){
            pickUpItem(selectedItemOnGround);
            selectedItemOnGround  = null;
            // PlayState.getSelf().player.justMoved = true;
        }

        return true;
    }

}