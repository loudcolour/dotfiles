hs.hotkey.bind({'control','command'},'H',hs.reload)
hs.hotkey.bind({'control','command'},'A',function() hs.application.launchOrFocus('Activity Monitor') end)
hs.hotkey.bind('','f10',function() hs.application.launchOrFocus('iTerm') end)
hs.hotkey.bind('shift','f10',function() hs.alert.show(hs.keycodes.currentSourceID()) end)

do
	-- key modification from option(right) to f13 by karabiner-elements is required.

	local IME = {
		kotoeri_romaji = "com.google.inputmethod.Japanese.Roman",
		kotoeri_hiragana = "com.google.inputmethod.Japanese.base",
		system_colemak = "com.apple.keylayout.Colemak",
		gureum_han390 = "org.youknowone.inputmethod.Gureum.han390",
	} 

	local toggleAlphabet = function()
		local currentIME = hs.keycodes.currentSourceID()
		local nextIME = ""
		if currentIME == IME.system_colemak then
			nextIME = IME.gureum_han390
		elseif currentIME == IME.gureum_han390 then
			nextIME = IME.system_colemak
		elseif currentIME == IME.kotoeri_romaji then
			nextIME = IME.kotoeri_hiragana
		elseif currentIME == IME.kotoeri_hiragana then
			nextIME = IME.kotoeri_romaji
		else
			nextIME = currentIME()
		end

		hs.keycodes.currentSourceID(nextIME)
	end

	local escVim = function()
		local currentIME = hs.keycodes.currentSourceID()
		if currentIME == IME.gureum_han390 then
			hs.keycodes.currentSourceID(IME.system_colemak)
		elseif currentIME == IME.kotoeri_hiragana then
			hs.keycodes.currentSourceID(IME.kotoeri_romaji)
		else
			hs.keycodes.currentSourceID(IME.system_colemak)
		end
		hs.eventtap.keyStroke({}, 'escape')
	end

	hs.hotkey.bind('','f2', function() hs.keycodes.currentSourceID(IME.gureum_han390) end)
	hs.hotkey.bind('','f3', function() hs.keycodes.currentSourceID(IME.kotoeri_hiragana) end)

	hs.hotkey.bind('control','[',escVim)
	hs.hotkey.bind('','f16',escVim)

	hs.hotkey.bind('','f13',toggleAlphabet)
end

do
	local expand_window = function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		local screen = window:screen():frame()
		frame.x = screen.x
		frame.y = screen.y
		frame.w = screen.w
		frame.h = screen.h
		window:setFrame(frame)
	end

	local expand_window_half_left = function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		local screen = window:screen():frame()
		frame.x = screen.x
		frame.y = screen.y
		frame.w = screen.w / 2
		frame.h = screen.h
		window:setFrame(frame)
	end

	local expand_window_half_right = function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		local screen = window:screen():frame()
		frame.x = screen.x + (screen.w / 2)
		frame.y = screen.y
		frame.w = screen.w / 2
		frame.h = screen.h
		window:setFrame(frame)
	end

	hs.hotkey.bind({'command','shift'}, '0', expand_window)
	hs.hotkey.bind({'command','shift'}, '1', expand_window_half_left)
	hs.hotkey.bind({'command','shift'}, '2', expand_window_half_right)
end

hs.alert.defaultStyle["radius"] = 2
hs.alert.defaultStyle["strokeWidth"] = 0

hs.application.launchOrFocus('Hammerspoon')

