local SharedMedia = LibStub("LibSharedMedia-3.0")

function EnhancedMPlusLoot:getFontPath(fontName)
	local fontPath = SharedMedia:Fetch("font", fontName) or "Fonts\\FRIZQT__.TTF"
	return fontPath
end