import sys.io.File;

class SaveData {

    var file:String;
    public var bestScore:Int;

    public function new() {
        file = 'bestscore.txt';
        bestScore = 0;
    }

    public function loadBestScore() {
        try {
            bestScore = Std.parseInt(File.getContent(file));
        } catch(e:Any) {
            saveBestScore(0); 
        }
    }

    public function saveBestScore(score:Int) {
        if (score > bestScore) File.saveContent(file, Std.string(score));
    }
}