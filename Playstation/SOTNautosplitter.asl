//Castlevania: Symphony of the Night autosplitter by TalicZealot
//Base code by Coltaho

state("emuhawk") {}

startup {
	print("--[Autosplitter] Starting up!");
	
	settings.Add("relics", true, "---Relics---");
	settings.Add("SoulOfBat", true, "Soul of Bat", "relics");
	settings.Add("FireOfBat", false, "Fire of Bat", "relics");
	settings.Add("EchoOfBat", false, "Echo of Bat", "relics");
	settings.Add("ForceOfEcho", false, "Force of Echo", "relics");
	settings.Add("SoulOfWolf", false, "Soul of Wolf", "relics");
	settings.Add("PowerOfWolf", false, "Power of Wolf", "relics");
	settings.Add("SkillOfWolf", false, "Skill of Wolf", "relics");
	settings.Add("FormOfMist", true, "Form of Mist", "relics");
	settings.Add("PowerOfMist", false, "Power of Mist", "relics");
	settings.Add("GasCloud", false, "Gas Cloud", "relics");
	settings.Add("CubeOfZoe", false, "Cube of Zoe", "relics");
	settings.Add("SpiritOrb", false, "Spirit Orb", "relics");
	settings.Add("GravityBoots", false, "Gravity Boots", "relics");
	settings.Add("LeapStone", false, "Leap Stone", "relics");
	settings.Add("HolySymbol", false, "Holy Symbol", "relics");
	settings.Add("FaerieScroll", false, "Faerie Scroll", "relics");
	settings.Add("JewelOfOpen", false, "Jewel of Open", "relics");
	settings.Add("MermanStatue", false, "Merman Statue", "relics");
	settings.Add("BatCard", false, "Bat Card", "relics");
	settings.Add("GhostCard", false, "Ghost Card", "relics");
	settings.Add("FaerieCard", false, "Faerie Card", "relics");
	settings.Add("DemonCard", false, "Demon Card", "relics");
	settings.Add("SwordCard", false, "Sword Card", "relics");
	settings.Add("HeartOfVlad", false, "Heart of Vlad", "relics");
	settings.Add("ToothOfVlad", false, "Tooth of Vlad", "relics");
	settings.Add("RibOfVlad", false, "Rib of Vlad", "relics");
	settings.Add("RingOfVlad", false, "Ring of Vlad", "relics");
	settings.Add("EyeOfVlad", false, "Eye of Vlad", "relics");

	settings.Add("items", false, "---Progression Items---");
	settings.Add("GoldRing", false, "Gold Ring", "items");
	settings.Add("SilverRing", false, "Silver Ring", "items");
	settings.Add("HolyGlasses", false, "Holy Glasses", "items");

	settings.Add("locations", true, "---Locations---");
	settings.Add("ClockRush", true, "Clock Rush", "locations");
	settings.Add("LibraryFromColosseum", false, "Library From Colosseum", "locations");
	settings.Add("OuterWallFromLibrary", true, "Outer Wall From Library (Library Escape)", "locations");
	settings.Add("SecondCastle", true, "Second Castle", "locations");

	settings.Add("bosses", true, "---Bosses---");

	settings.Add("DraculaPrologue", false, "Dracula Prologue", "bosses");
	settings.Add("SlograGaibon", false, "Slogra & Gaibon", "bosses");
	settings.Add("Doppleganger10", false, "Doppleganger 10", "bosses");
	settings.Add("MinotaurWerewolf", false, "Minotaur & Werewolf", "bosses");
	settings.Add("LesserDemon", false, "Lesser Demon", "bosses");
	settings.Add("Karasuman", false, "Karasuman", "bosses");
	settings.Add("Succubus", false, "Succubus", "bosses");
	settings.Add("Scylla", false, "Scylla", "bosses");
	settings.Add("Cerberus", false, "Cerberus", "bosses");
	settings.Add("Granfaloon", false, "Granfaloon", "bosses");
	settings.Add("Hippogryph", false, "Hippogryph", "bosses");
	settings.Add("Olrox", false, "Olrox", "bosses");
	settings.Add("DarkwingBat", false, "Darkwing Bat", "bosses");
	settings.Add("Medusa", false, "Medusa", "bosses");
	settings.Add("Akmodan", false, "Akmodan", "bosses");
	settings.Add("Trio", false, "Trio", "bosses");
	settings.Add("Beelzebub", false, "Beelzebub", "bosses");
	settings.Add("Creature", false, "Creature", "bosses");
	settings.Add("Doppleganger40", false, "Doppleganger 40", "bosses");
	settings.Add("Death", false, "Death", "bosses");
	settings.Add("Galamoth", false, "Galamoth", "bosses");
	settings.Add("Shaft", false, "Shaft", "bosses");
	settings.Add("Dracula", true, "Dracula", "bosses");

	settings.Add("scriptsection", true, "---Script Options---");
	settings.Add("debug", false, "Print Debug Info", "scriptsection");
	
	settings.Add("infosection", true, "---Info---");
	settings.Add("info", true, "Castlevania: Symphony of the Night AutoSplitter v1.1 by TalicZealot", "infosection");
	settings.Add("info1", true, "- Autosplit: Bizhawk", "infosection");
	settings.Add("info2", true, "- Website : https://github.com/TalicZealot", "infosection");
}

init {
	print("--[Autosplitter] Setting init variables!");
	
	vars.myBaseAddress = IntPtr.Zero;	
	vars.watchersInitialized = false;
	vars.tokenSource = new CancellationTokenSource();	
	
	vars.initializeWatchers = (Func<bool>)(() =>
	{
		vars.watchers = new MemoryWatcherList() {
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097964)) { Name = "SoulOfBat" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097965)) { Name = "FireOfBat" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097966)) { Name = "EchoOfBat" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097967)) { Name = "ForceOfEcho" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097968)) { Name = "SoulOfWolf" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097969)) { Name = "PowerOfWolf" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796A)) { Name = "SkillOfWolf" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796B)) { Name = "FormOfMist" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796C)) { Name = "PowerOfMist" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796D)) { Name = "GasCloud" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796E)) { Name = "CubeOfZoe" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09796F)) { Name = "SpiritOrb" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097970)) { Name = "GravityBoots" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097971)) { Name = "LeapStone" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097972)) { Name = "HolySymbol" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097973)) { Name = "FaerieScroll" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097974)) { Name = "JewelOfOpen" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097975)) { Name = "MermanStatue" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097976)) { Name = "BatCard" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097977)) { Name = "GhostCard" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097978)) { Name = "FaerieCard" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097979)) { Name = "DemonCard" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09797A)) { Name = "SwordCard" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09797D)) { Name = "HeartOfVlad" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09797E)) { Name = "ToothOfVlad" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x09797F)) { Name = "RibOfVlad" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097980)) { Name = "RingOfVlad" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097981)) { Name = "EyeOfVlad" },

			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097A7B)) { Name = "GoldRing" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097A7C)) { Name = "SilverRing" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097A55)) { Name = "HolyGlasses" },

			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x0730B0)) { Name = "MapX" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x0973F1)) { Name = "MapXOffset" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x0730B4)) { Name = "MapY" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x0973F5)) { Name = "MapYOffset" },

			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097C30)) { Name = "TimeHours" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097C34)) { Name = "TimeMinutes" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097C38)) { Name = "TimeSeconds" },
			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x097C3C)) { Name = "TimeSubseconds" },

			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x03C734)) { Name = "GameStatus" },

			new MemoryWatcher<byte>(new DeepPointer(vars.myBaseAddress + 0x1E5458)) { Name = "SecondCastle" },

			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x076ed6)) { Name = "BossEntityHp" },
			//TimeAttack
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA28 )) { Name = "DraculaPrologue" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA2C )) { Name = "Olrox" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA30 )) { Name = "Doppleganger10" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA34 )) { Name = "Granfaloon" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA38 )) { Name = "MinotaurWerewolf" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA3C )) { Name = "Scylla" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA40 )) { Name = "SlograGaibon" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA44 )) { Name = "Hippogryph" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA48 )) { Name = "Beelzebub" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA4C )) { Name = "Succubus" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA50 )) { Name = "Karasuman" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA54 )) { Name = "Trio" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA58 )) { Name = "Death" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA5C )) { Name = "Cerberus" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA60 )) { Name = "SaveRichter" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA64 )) { Name = "Medusa" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA68 )) { Name = "Creature" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA6C )) { Name = "LesserDemon" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA70 )) { Name = "Doppleganger40" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA74 )) { Name = "Akmodan" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA78 )) { Name = "DarkwingBat" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA7C )) { Name = "Galamoth" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA80 )) { Name = "FinalSave" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA84 )) { Name = "MeetingDeath" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA88 )) { Name = "GetHolyGlasses" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA8C )) { Name = "MeetLibrarian" },
			new MemoryWatcher<short>(new DeepPointer(vars.myBaseAddress + 0x03CA90 )) { Name = "MeetMaria" },
		};

		vars.watchersInitialized = true;
		print("--[Autosplitter] Watchers Initialized!");
		return true;
	});
				
	
	vars.threadScan = new Thread(() => {
		print("--[Autosplitter] Starting Thread Scan...");	
		SignatureScanner gameAssemblyScanner = null;
		ProcessModuleWow64Safe gameAssemblyModule = null;

		//Scans for Bizhawk PS1 MainMem
		SigScanTarget gameScanTarget = new SigScanTarget(0x8, "49 03 c9 ff e1 48 8d 05 ?? ?? ?? ?? 48 89 02");
		IntPtr gameSigAddr = IntPtr.Zero;

		while(!vars.tokenSource.IsCancellationRequested) {
				if(gameAssemblyScanner == null) {
					ProcessModuleWow64Safe[] loadedModules = null;
					try {
						loadedModules = game.ModulesWow64Safe();
					} catch {
						loadedModules = new ProcessModuleWow64Safe[0];
					}

					gameAssemblyModule = loadedModules.FirstOrDefault(m => m.ModuleName == "octoshock.dll");
					if(gameAssemblyModule == null) {
						print("--[Autosplitter] Modules not initialized");
						Thread.Sleep(500);
						continue;
					}

					gameAssemblyScanner = new SignatureScanner(game, gameAssemblyModule.BaseAddress, gameAssemblyModule.ModuleMemorySize);
				}

				print("--[Autosplitter] Scanning memory");

				if(gameSigAddr == IntPtr.Zero && (gameSigAddr = gameAssemblyScanner.Scan(gameScanTarget)) != IntPtr.Zero) {					
					int offset = (int)((long)game.ReadValue<int>(gameSigAddr) + (long)gameSigAddr + 4 - (long)gameAssemblyModule.BaseAddress);
					print("--[Autosplitter] Bizhawk offset from module to Mem: " + offset.ToString("X"));
					vars.myBaseAddress = gameAssemblyModule.BaseAddress + offset;
					print("--[Autosplitter] Bizhawk Memory BaseAddress: " + vars.myBaseAddress.ToString("X"));
					vars.initializeWatchers();
				}
			
			if(vars.watchersInitialized) {
				break;
			}

			print("--[Autosplitter] Couldn't find the pointers I want! Game is still starting or an update broke things!");
			Thread.Sleep(2000);
		}
		print("--[Autosplitter] Exited Thread Scan");
	});
	
	vars.threadScan.Start();

	vars.SoulOfBatObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SoulOfBat"].Changed && vars.watchers["SoulOfBat"].Old == 0 && vars.watchers["SoulOfBat"].Current == 3;
	});

	vars.FireOfBatObtained = (Func<bool>)(() =>
	{
		return vars.watchers["FireOfBat"].Changed && vars.watchers["FireOfBat"].Old == 0 && vars.watchers["FireOfBat"].Current == 3;
	});

	vars.EchoOfBatObtained = (Func<bool>)(() =>
	{
		return vars.watchers["EchoOfBat"].Changed && vars.watchers["EchoOfBat"].Old == 0 && vars.watchers["EchoOfBat"].Current == 3;
	});

	vars.ForceOfEchoObtained = (Func<bool>)(() =>
	{
		return vars.watchers["ForceOfEcho"].Changed && vars.watchers["ForceOfEcho"].Old == 0 && vars.watchers["ForceOfEcho"].Current == 3;
	});

	vars.SoulOfWolfObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SoulOfWolf"].Changed && vars.watchers["SoulOfWolf"].Old == 0 && vars.watchers["SoulOfWolf"].Current == 3;
	});

	vars.PowerOfWolfObtained = (Func<bool>)(() =>
	{
		return vars.watchers["PowerOfWolf"].Changed && vars.watchers["PowerOfWolf"].Old == 0 && vars.watchers["PowerOfWolf"].Current == 3;
	});

	vars.SkillOfWolfObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SkillOfWolf"].Changed && vars.watchers["SkillOfWolf"].Old == 0 && vars.watchers["SkillOfWolf"].Current == 3;
	});

	vars.FormOfMistObtained = (Func<bool>)(()=>
	{
		return vars.watchers["FormOfMist"].Changed && vars.watchers["FormOfMist"].Old == 0 && vars.watchers["FormOfMist"].Current == 3;
	});

	vars.PowerOfMistObtained = (Func<bool>)(() =>
	{
		return vars.watchers["PowerOfMist"].Changed && vars.watchers["PowerOfMist"].Old == 0 && vars.watchers["PowerOfMist"].Current == 3;
	});

	vars.GasCloudObtained = (Func<bool>)(() =>
	{
		return vars.watchers["GasCloud"].Changed && vars.watchers["GasCloud"].Old == 0 && vars.watchers["GasCloud"].Current == 3;
	});

	vars.CubeOfZoeObtained = (Func<bool>)(() =>
	{
		return vars.watchers["CubeOfZoe"].Changed && vars.watchers["CubeOfZoe"].Old == 0 && vars.watchers["CubeOfZoe"].Current == 3;
	});

	vars.SpiritOrbObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SpiritOrb"].Changed && vars.watchers["SpiritOrb"].Old == 0 && vars.watchers["SpiritOrb"].Current == 3;
	});

	vars.GravityBootsObtained = (Func<bool>)(() =>
	{
		return vars.watchers["GravityBoots"].Changed && vars.watchers["GravityBoots"].Old == 0 && vars.watchers["GravityBoots"].Current == 3;
	});

	vars.LeapStoneObtained = (Func<bool>)(() =>
	{
		return vars.watchers["LeapStone"].Changed && vars.watchers["LeapStone"].Old == 0 && vars.watchers["LeapStone"].Current == 3;
	});

	vars.HolySymbolObtained = (Func<bool>)(() =>
	{
		return vars.watchers["HolySymbol"].Changed && vars.watchers["HolySymbol"].Old == 0 && vars.watchers["HolySymbol"].Current == 3;
	});

	vars.FaerieScrollObtained = (Func<bool>)(() =>
	{
		return vars.watchers["FaerieScroll"].Changed && vars.watchers["FaerieScroll"].Old == 0 && vars.watchers["FaerieScroll"].Current == 3;
	});

	vars.JewelOfOpenObtained = (Func<bool>)(() =>
	{
		return vars.watchers["JewelOfOpen"].Changed && vars.watchers["JewelOfOpen"].Old == 0 && vars.watchers["JewelOfOpen"].Current == 3;
	});

		vars.MermanStatueObtained = (Func<bool>)(() =>
	{
		return vars.watchers["MermanStatue"].Changed && vars.watchers["MermanStatue"].Old == 0 && vars.watchers["MermanStatue"].Current == 3;
	});

	vars.BatCardObtained = (Func<bool>)(() =>
	{
		return vars.watchers["BatCard"].Changed && vars.watchers["BatCard"].Old == 0 && vars.watchers["BatCard"].Current == 3;
	});

	vars.GhostCardObtained = (Func<bool>)(() =>
	{
		return vars.watchers["GhostCard"].Changed && vars.watchers["GhostCard"].Old == 0 && vars.watchers["GhostCard"].Current == 3;
	});

	vars.FaerieCardObtained = (Func<bool>)(() =>
	{
		return vars.watchers["FaerieCard"].Changed && vars.watchers["FaerieCard"].Old == 0 && vars.watchers["FaerieCard"].Current == 3;
	});
	
	vars.DemonCardObtained = (Func<bool>)(() =>
	{
		return vars.watchers["DemonCard"].Changed && vars.watchers["DemonCard"].Old == 0 && vars.watchers["DemonCard"].Current == 3;
	});

	vars.SwordCardObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SwordCard"].Changed && vars.watchers["SwordCard"].Old == 0 && vars.watchers["SwordCard"].Current == 3;
	});

		vars.HeartOfVladObtained = (Func<bool>)(() =>
	{
		return vars.watchers["HeartOfVlad"].Changed && vars.watchers["HeartOfVlad"].Old == 0 && vars.watchers["HeartOfVlad"].Current == 3;
	});

	vars.ToothOfVladObtained = (Func<bool>)(() =>
	{
		return vars.watchers["ToothOfVlad"].Changed && vars.watchers["ToothOfVlad"].Old == 0 && vars.watchers["ToothOfVlad"].Current == 3;
	});
	
	vars.RibOfVladObtained = (Func<bool>)(() =>
	{
		return vars.watchers["RibOfVlad"].Changed && vars.watchers["RibOfVlad"].Old == 0 && vars.watchers["RibOfVlad"].Current == 3;
	});

	vars.RingOfVladObtained = (Func<bool>)(() =>
	{
		return vars.watchers["RingOfVlad"].Changed && vars.watchers["RingOfVlad"].Old == 0 && vars.watchers["RingOfVlad"].Current == 3;
	});
	
	vars.EyeOfVladObtained = (Func<bool>)(() =>
	{
		return vars.watchers["EyeOfVlad"].Changed && vars.watchers["EyeOfVlad"].Old == 0 && vars.watchers["EyeOfVlad"].Current == 3;
	});

	//Progression Items

	vars.GoldRingObtained = (Func<bool>)(() =>
	{
		return vars.watchers["GoldRing"].Changed && vars.watchers["GoldRing"].Old == 0 && vars.watchers["GoldRing"].Current > 0;
	});

	vars.SilverRingObtained = (Func<bool>)(() =>
	{
		return vars.watchers["SilverRing"].Changed && vars.watchers["SilverRing"].Old == 0 && vars.watchers["SilverRing"].Current > 0;
	});

	vars.HolyGlassesObtained = (Func<bool>)(() =>
	{
		return vars.watchers["HolyGlasses"].Changed && vars.watchers["HolyGlasses"].Old == 0 && vars.watchers["HolyGlasses"].Current > 0;
	});

	//Locations

	vars.SecondCastleEntered = (Func<bool>)(() =>
	{
		return vars.watchers["SecondCastle"].Changed && vars.watchers["SecondCastle"].Old == 0 && vars.watchers["SecondCastle"].Current > 0;
	});

	vars.MapX = (Func<int, bool>)((value) =>
	{
		return vars.watchers["MapX"].Current == value;
	});

	vars.MapXOffset = (Func<int, bool>)((value) =>
	{
		return vars.watchers["MapXOffset"].Current == value;
	});

	vars.MapY = (Func<int, bool>)((value) =>
	{
		return vars.watchers["MapY"].Current == value;
	});

	vars.MapYOffset = (Func<int, bool>)((value) =>
	{
		return vars.watchers["MapYOffset"].Current == value;
	});

	vars.ClockRushCompleted = (Func<bool>)(() =>
	{
		return vars.watchers["MapX"].Current == 32 && vars.watchers["MapX"].Old == 32
		&& vars.watchers["MapXOffset"].Current == 0 && vars.watchers["MapXOffset"].Old == 0
		&& vars.watchers["MapY"].Current == 24 && vars.watchers["MapY"].Old == 26
		&& vars.watchers["MapYOffset"].Current == 1 && (vars.watchers["MapYOffset"].Old == 0 || vars.watchers["MapYOffset"].Old == 255);
	});

	vars.LibraryCardFromColosseum = (Func<bool>)(() =>
	{
		return vars.watchers["MapX"].Current == 50 && vars.watchers["MapY"].Current == 20
		&& ((vars.watchers["MapX"].Old == 21 && vars.watchers["MapY"].Old == 22)
		|| (vars.watchers["MapX"].Old == 13 && vars.watchers["MapY"].Old == 24))
		&& vars.watchers["MapXOffset"].Current == 0 && vars.watchers["MapXOffset"].Old == 0
		&& vars.watchers["MapYOffset"].Current == 0 && vars.watchers["MapYOffset"].Old == 0;
	});

	vars.OuterWallFromLibrary = (Func<bool>)(() =>
	{
		return vars.watchers["MapX"].Current == 60 && vars.watchers["MapX"].Old == 59
		&& vars.watchers["MapXOffset"].Current == 0 && vars.watchers["MapXOffset"].Old == 1
		&& vars.watchers["MapY"].Current == 15 && vars.watchers["MapY"].Old == 21
		&& vars.watchers["MapYOffset"].Current == 6 && vars.watchers["MapYOffset"].Old == 0;
	});

	//Bosses

	vars.DraculaPrologueDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["DraculaPrologue"].Old == 0 && vars.watchers["DraculaPrologue"].Current > 0;
	});

	vars.OlroxDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Olrox"].Old == 0 && vars.watchers["Olrox"].Current > 0;
	});

	vars.Doppleganger10Defeated = (Func<bool>)(() =>
	{
		return vars.watchers["Doppleganger10"].Old == 0 && vars.watchers["Doppleganger10"].Current > 0;
	});

	vars.GranfaloonDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Granfaloon"].Old == 0 && vars.watchers["Granfaloon"].Current > 0;
	});

	vars.MinotaurWerewolfDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["MinotaurWerewolf"].Old == 0 && vars.watchers["MinotaurWerewolf"].Current > 0;
	});

	vars.ScyllaDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Scylla"].Old == 0 && vars.watchers["Scylla"].Current > 0;
	});

	vars.SlograGaibonDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["SlograGaibon"].Old == 0 && vars.watchers["SlograGaibon"].Current > 0;
	});

	vars.HippogryphDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Hippogryph"].Old == 0 && vars.watchers["Hippogryph"].Current > 0;
	});

	vars.BeelzebubDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Beelzebub"].Old == 0 && vars.watchers["Beelzebub"].Current > 0;
	});

	vars.SuccubusDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Succubus"].Old == 0 && vars.watchers["Succubus"].Current > 0;
	});

	vars.KarasumanDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Karasuman"].Old == 0 && vars.watchers["Karasuman"].Current > 0;
	});

	vars.TrioDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Trio"].Old == 0 && vars.watchers["Trio"].Current > 0;
	});

	vars.DeathDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Death"].Old == 0 && vars.watchers["Death"].Current > 0;
	});

	vars.CerberusDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Cerberus"].Old == 0 && vars.watchers["Cerberus"].Current > 0;
	});

	vars.MedusaDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Medusa"].Old == 0 && vars.watchers["Medusa"].Current > 0;
	});

	vars.CreatureDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Creature"].Old == 0 && vars.watchers["Creature"].Current > 0;
	});

	vars.LesserDemonDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["LesserDemon"].Old == 0 && vars.watchers["LesserDemon"].Current > 0;
	});

	vars.Doppleganger40Defeated = (Func<bool>)(() =>
	{
		return vars.watchers["Doppleganger40"].Old == 0 && vars.watchers["Doppleganger40"].Current > 0;
	});

	vars.AkmodanDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Akmodan"].Old == 0 && vars.watchers["Akmodan"].Current > 0;
	});

	vars.DarkwingBatDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["DarkwingBat"].Old == 0 && vars.watchers["DarkwingBat"].Current > 0;
	});

	vars.GalamothDefeated = (Func<bool>)(() =>
	{
		return vars.watchers["Galamoth"].Old == 0 && vars.watchers["Galamoth"].Current > 0;
	});

	vars.ShaftDefeated = (Func<bool>)(() =>
	{
		return vars.MapX(30) && vars.MapXOffset(1) && vars.MapY (31) && vars.MapYOffset(1)
		&& vars.watchers["BossEntityHp"].Old > 0 && vars.watchers["BossEntityHp"].Current < 1;
	});

	vars.DraculaDefeated = (Func<bool>)(() =>
	{
		return vars.MapX(31) && vars.MapXOffset(0) && vars.MapY(30) && vars.MapYOffset(0)
		&& vars.watchers["BossEntityHp"].Old > 0 && vars.watchers["BossEntityHp"].Current < 1;
	});
	
	vars.GetSplitList = (Func<Dictionary<string, bool>>)(() =>
	{
		var splits = new Dictionary<string, bool>
		{
			//Relics
			{ "SoulOfBat", vars.SoulOfBatObtained() },
			{ "FireOfBat", vars.FireOfBatObtained() },
			{ "EchoOfBat", vars.EchoOfBatObtained() },
			{ "ForceOfEcho", vars.ForceOfEchoObtained() },
			{ "SoulOfWolf", vars.SoulOfWolfObtained() },
			{ "PowerOfWolf", vars.PowerOfWolfObtained() },
			{ "SkillOfWolf", vars.SkillOfWolfObtained() },
			{ "FormOfMist", vars.FormOfMistObtained() },
			{ "PowerOfMist", vars.PowerOfMistObtained() },
			{ "GasCloud", vars.GasCloudObtained() },
			{ "CubeOfZoe", vars.CubeOfZoeObtained() },
			{ "SpiritOrb", vars.SpiritOrbObtained() },
			{ "GravityBoots", vars.GravityBootsObtained() },
			{ "LeapStone", vars.LeapStoneObtained() },
			{ "HolySymbol", vars.HolySymbolObtained() },
			{ "FaerieScroll", vars.FaerieCardObtained() },
			{ "JewelOfOpen", vars.JewelOfOpenObtained() },
			{ "MermanStatue", vars.MermanStatueObtained() },
			{ "BatCard", vars.BatCardObtained() },
			{ "GhostCard", vars.GhostCardObtained() },
			{ "FaerieCard", vars.FaerieCardObtained() },
			{ "DemonCard", vars.DemonCardObtained() },
			{ "SwordCard", vars.SwordCardObtained() },
			{ "HeartOfVlad", vars.HeartOfVladObtained() },
			{ "ToothOfVlad", vars.ToothOfVladObtained() },
			{ "RibOfVlad", vars.RibOfVladObtained() },
			{ "RingOfVlad", vars.RingOfVladObtained() },
			{ "EyeOfVlad", vars.EyeOfVladObtained() },
			//Progression Items
			{ "GoldRing", vars.GoldRingObtained() },
			{ "SilverRing", vars.SilverRingObtained() },
			{ "HolyGlasses", vars.HolyGlassesObtained() },
			//Locations
			{ "ClockRush", vars.ClockRushCompleted() },
			{ "LibraryFromColosseum", vars.LibraryCardFromColosseum() },
			{ "OuterWallFromLibrary", vars.OuterWallFromLibrary() },
			{ "SecondCastle", vars.SecondCastleEntered() },
			//Bosses
			{ "DraculaPrologue", vars.DraculaPrologueDefeated() },
			{ "SlograGaibon", vars.SlograGaibonDefeated() },
			{ "Doppleganger10", vars.Doppleganger10Defeated() },
			{ "MinotaurWerewolf", vars.MinotaurWerewolfDefeated() },
			{ "LesserDemon", vars.LesserDemonDefeated() },
			{ "Karasuman", vars.KarasumanDefeated() },
			{ "Hippogryph", vars.HippogryphDefeated() },
			{ "Olrox", vars.OlroxDefeated() },
			{ "Succubus", vars.SuccubusDefeated() },
			{ "Scylla", vars.ScyllaDefeated() },
			{ "Cerberus", vars.CerberusDefeated() },
			{ "Granfaloon", vars.GranfaloonDefeated() },
			{ "DarkwingBat", vars.DarkwingBatDefeated() },
			{ "Medusa", vars.MedusaDefeated() },
			{ "Akmodan", vars.AkmodanDefeated() },
			{ "Trio", vars.TrioDefeated() },
			{ "Beelzebub", vars.BeelzebubDefeated() },
			{ "Creature", vars.CreatureDefeated() },
			{ "Doppleganger40", vars.Doppleganger40Defeated() },
			{ "Death", vars.DeathDefeated() },
			{ "Galamoth", vars.GalamothDefeated() },
			{ "Shaft", vars.ShaftDefeated() },
			{ "Dracula", vars.DraculaDefeated() },

		};
		return splits;
	});
	
	vars.pastSplits = new HashSet<string>();
	vars.mystring = "";
	vars.paststring = "";
}

update {
	
	if(!vars.watchersInitialized) {
        return false;
    }
	
	if (timer.CurrentPhase == TimerPhase.NotRunning && vars.pastSplits.Count > 0) {
		vars.pastSplits.Clear();
	}
	
	vars.watchers.UpdateAll(game);
	
	if (settings["debug"]) {
		vars.mystring = "--[Autosplitter] GrpID: " + vars.watchers["groupID"].Current + " | Stars: " + vars.watchers["maxStars"].Current + " | Money: " + vars.watchers["money"].Current;
		if (vars.paststring != vars.mystring) {
			print(vars.mystring);
			vars.paststring = vars.mystring;
		}
	}
}

start {
	if ( vars.watchers["GameStatus"].Current == 2
		&& vars.MapX(2) && vars.MapXOffset(0) && vars.MapY (38) && vars.MapYOffset(2)
		&& vars.watchers["TimeMinutes"].Current == 0 && vars.watchers["TimeHours"].Current == 0 && vars.watchers["TimeSeconds"].Current == 0
	 	&& vars.watchers["TimeSubseconds"].Current > 10 && vars.watchers["TimeSubseconds"].Old <= 10) {
			 return true;
	} else if ( vars.watchers["GameStatus"].Current == 2 
	&& vars.watchers["TimeMinutes"].Current == 0 && vars.watchers["TimeHours"].Current == 0 
	&& vars.watchers["TimeSeconds"].Old == 2 && vars.watchers["TimeSeconds"].Current == 3) {	
		print("--[Autosplitter] Go!");
		return true;
	}
}

reset {
		if (vars.watchers["TimeMinutes"].Current == 0 && vars.watchers["TimeHours"].Current == 0 && vars.watchers["TimeSeconds"].Current == 0 && vars.watchers["TimeSubseconds"].Current <= 10) {	
		print("--[Autosplitter] Go!");
		return true;
	}
}

split {
	var splits = vars.GetSplitList();

	foreach (var split in splits)
	{
		if (settings[split.Key] && split.Value && !vars.pastSplits.Contains(split.Key))
		{
			vars.pastSplits.Add(split.Key);
			print("--[Autosplitter] Split: " + split.Key);
			return true;
		}
	}
}

exit {
	vars.tokenSource.Cancel();
}

shutdown {
	vars.tokenSource.Cancel();
}