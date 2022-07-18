function onCreatePost()
	--if difficulty == 1 then
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		--if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, -45)`
		else
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, 480)
		end
		addAnimationByPrefix('Left', 'LSplash', 'note splash purple', 24, false)
		addLuaSprite('Left', true)
		setObjectCamera('Left', 'hud')
		scaleObject('Left', 0.85, 0.85);
		setProperty('Left.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, -45)
		else
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, 480)
		end
		addAnimationByPrefix('Down', 'DSplash', 'note splash blue', 24, false)
		addLuaSprite('Down', true)
		setObjectCamera('Down', 'hud')
		scaleObject('Down', 0.85, 0.85);
		setProperty('Down.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, -45)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, -45)
		end
		else
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, 480)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, 480)
		end
		end
		addAnimationByPrefix('Up', 'USplash', 'note splash green', 24, false)
		addLuaSprite('Up', true)
		setObjectCamera('Up', 'hud')
		scaleObject('Up', 0.85, 0.85);
		setProperty('Up.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, -45)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, -45)
			end
		else
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, 480)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, 480)
			end
		end
		addAnimationByPrefix('Right', 'RSplash', 'note splash red ', 24, false)
		addLuaSprite('Right', true)
		setObjectCamera('Right', 'hud')
		scaleObject('Right', 0.85, 0.85);
		setProperty('Right.alpha', 0)
		this = 1
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	--if difficulty == 1 then
		if direction == 0 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Left.alpha', 1)
			else
			setProperty('Left.alpha', 0.5)
			end
			objectPlayAnimation('Left', 'LSplash', true)
			runTimer('LSpl', 0.16)
		elseif direction == 1 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Down.alpha', 1)
			else
			setProperty('Down.alpha', 0.5)
			end
			objectPlayAnimation('Down', 'DSplash', true)
			runTimer('DSpl', 0.16)
		elseif direction == 2 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Up.alpha', 1)
			else
			setProperty('Up.alpha', 0.5)
			end
			objectPlayAnimation('Up', 'USplash', true)
			runTimer('USpl', 0.16)
		elseif direction == 3 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Right.alpha', 1)
			else
			setProperty('Right.alpha', 0.5)
			end
			objectPlayAnimation('Right', 'RSplash', true)
			runTimer('RSpl', 0.16)
		end
	--end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'LSpl' then
		setProperty('Left.alpha', 0)
	elseif tag == 'DSpl' then
		setProperty('Down.alpha', 0)
	elseif tag == 'USpl' then
		setProperty('Up.alpha', 0)
	elseif tag == 'RSpl' then
		setProperty('Right.alpha', 0)
	elseif tag == 'reset' then
		this = 1	
		--debugPrint("reset");
	end
end

function onUpdate(elapsed)
	LeftX = getPropertyFromGroup('opponentStrums', 0, 'x') - 100
	DownX = getPropertyFromGroup('opponentStrums', 1, 'x') - 100
	UpX = getPropertyFromGroup('opponentStrums', 2, 'x') - 100
	RightX = getPropertyFromGroup('opponentStrums', 3, 'x') - 100
	LeftY = getPropertyFromGroup('opponentStrums', 0, 'y') - 100
	UpY = getPropertyFromGroup('opponentStrums', 1, 'y') - 100
	DownY = getPropertyFromGroup('opponentStrums', 2, 'y') - 100
	RightY = getPropertyFromGroup('opponentStrums', 3, 'y') - 100
	if this == 1 then
	doTweenX('UpdateLeftX', 'Left', LeftX, 0.001, 'linear')
	doTweenX('UpdateDownX', 'Down', DownX, 0.001, 'linear')
	doTweenX('UpdateUpX', 'Up', UpX, 0.001, 'linear')
	doTweenX('UpdateRightX', 'Right', RightX, 0.001, 'linear')
	doTweenY('UpdateLeftY', 'Left', LeftY, 0.001, 'linear')
	doTweenY('UpdateDownY', 'Down', DownY, 0.001, 'linear')
	doTweenY('UpdateUpY', 'Up', UpY, 0.01, 'linear')
	doTweenY('UpdateRightY', 'Right', RightY, 0.001, 'linear')
	--debugPrint("did");
	this = 2
	runTimer('reset', 0.02)
	end
end