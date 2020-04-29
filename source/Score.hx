import flixel.util.FlxSave;

class Score {
    
    inline static private var DATA = "BESTSCORE";

    public var current:Int;
    static public var memory:FlxSave;

    public function new() {
        current = 0;
        memory = new FlxSave();
    }

    public function reset() {
        if (memory.bind(DATA)) {
            memory.data.score = 0;
        }
    }

    public function save() {
        if (load() < current) {
            memory.data.score = current;
        }
    }

    public function load():Int {
        if (memory.bind(DATA)) {
            if (memory.data != null && memory.data.score != null) {
                return memory.data.score;
            }
        }

        return 0;
    }
}