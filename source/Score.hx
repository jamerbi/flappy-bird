import flixel.util.FlxSave;

class Score {
    
    inline static var DATA = "BESTSCORE";

    public var current = 0;
    static public var memory:FlxSave;

    public function new() {
        memory = new FlxSave();
    }

    public function reset() {
        if (memory.bind(DATA)) {
            memory.data.score = 0;
            memory.flush();
        }
    }

    public function save() {
        if (load() < current) {
            memory.data.score = current;
            memory.flush();
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