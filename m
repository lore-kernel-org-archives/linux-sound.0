Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8630FC1A;
	Wed, 17 Jun 2026 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695528; cv=none; b=qh+hDyTlOjAGbeJyrx3ELXfWhorgqZQuZBdUyZ7L++ozSTjZ5h4FFDrWiyfpzKKY8J4wr39NwVHowB4FcSgg4ZfZAMke1T9m04mhFXBEhSQDvd3v4dPF5uDzVMSd1zrld6ZeVy0VvMx2f04DxHARw78Bi/PxB/ib6/XwVIxGLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695528; c=relaxed/simple;
	bh=l8rz6/Jr67PHUbv88qRz5t6rlbG6h0Gj3AJ2zREw4WE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kLviuDfhEFUsxVuXl9upg3wBWYS4ARBCMaRrNiLTUHHiXEqLxytxR+Th9USLQGARmCT5x5nz+0uU/qTLeUFPBvrk+sDVeCupw480V86kn10LnWy/PVdpPvy/jghEtAsxkmV0KgXCl2lIWrAUrASVvKNZY0qfl19G/jGeDLQFwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjBHsDbM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjBHsDbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3821D1F000E9;
	Wed, 17 Jun 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695527;
	bh=6+UImrROuT41XM2mLD2jdoNOM9Ybul/gDDt1L6NlIXg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PjBHsDbMYUxRnv7gSpicJGFuGg+98o0GDrgJKKwTZoWgSMTlNRMejOWlf0T0PIcqv
	 5hXcHUCasvmIw/AV2y1G7DJxVPvi9ixv/v3zq52Yx7bu9cFulZiAKNVw4oa7RQD7E3
	 NlY6OdPt6MlycJxH0mYcD2xJt6XgHFvJ/7aJ1ljmL0N2ock509QTO80nw8UxNq4Awt
	 uduy7N6UbN9hQKz+3UkmPyRQaoWMgqD4Uz8Ag714B/wruX+SLWusclDbY+3xdFmwck
	 YY/vX9hpqG+rk9UHu2cLkeeP0Go1hBVL7jF9wRkcPKALCyA3DAtGcbk7PT4O4FtYPg
	 wFht8Ye44bhcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9393E3930E03;
	Wed, 17 Jun 2026 11:25:22 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ldcdpmax.wl-tiwai@suse.de>
References: <87ldcdpmax.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ldcdpmax.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc1
X-PR-Tracked-Commit-Id: c5e90e8844692deb7bbcd029e8b92b3a20441903
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 056e065a6b6e01ab54bb9770c0d5a15350e571e2
Message-Id: <178169552118.1566750.2279229345069666144.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 11:25:21 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 17 Jun 2026 11:07:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/056e065a6b6e01ab54bb9770c0d5a15350e571e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
