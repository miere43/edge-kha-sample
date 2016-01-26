var solution = new Solution('Dots');
var project = new Project('Dots');
project.setDebugDir('build/windows');
project.addSubProject(Solution.createProject('build/windows-build'));
project.addSubProject(Solution.createProject('D:/Soft/Haxe/haxe/lib/kha/16,1,2'));
project.addSubProject(Solution.createProject('D:/Soft/Haxe/haxe/lib/kha/16,1,2/Kore'));
solution.addProject(project);
if (fs.existsSync(path.join('D:/Soft/Haxe/haxe/lib/edge/0,7,0', 'korefile.js'))) {
	project.addSubProject(Solution.createProject('D:/Soft/Haxe/haxe/lib/edge/0,7,0'));
}
return solution;
