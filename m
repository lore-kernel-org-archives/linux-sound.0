Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9338C2A9;
	Sun,  5 Jul 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783266436; cv=none; b=bDKBw9VsimnA55psLDltjP0fYDwnBgBh/b/GRaPeWuJZAZOtc9pUQPOBaL22AL4kuwNuZMF2wvreVkHQTBHABCJzljfHE4hSjdjvKhxAbtgtnp5b+hlhyImrkeG01SPRiYmZoVfzFKsWNyqI+keTfNTHm9aX/Zza1QDd7cz/HjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783266436; c=relaxed/simple;
	bh=WhGomq/5MKj41mZq4yLcPlIFQJcZA6jbJTHYX/NLBno=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EjXrtbiyz0/AJFxroYDJTUVMBHO3oFEzUtZsicTfwr0XEZbOpVHSf/ylVqrCL8ke+e1dgEKRahorM0JIvWrsd4PK+Ysck3QGEUB0s2gTq2voCSFJbbsOhdkgA7C4WJQnQ87cK3gOJ3IOANcmKBTUnkoO/NyjpeJFsnZCVPVggqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYWcj15V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYWcj15V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415521F000E9;
	Sun,  5 Jul 2026 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783266435;
	bh=KfJAUYbY9G0PNvc0T2x7xZ/znyAzhkgSKTsK4vhV6HA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nYWcj15VyI1PgZeHMMDN+TlmcRz0JPW0spVG5lng5r/uHTCkAcJ+sVHU5MKSj56wG
	 mOqUi9dhYFK/xUZKLLvU9PSK1+3TODKGDS2pCFsRqObTiWrgQVdtm7jIsqykcc4kIC
	 7q6hWQH/bNq+jb/fy1jD52gi2NqD0Qo6q+lYLqYgom0uYKeqI6PAfiGtUhVsMJxg/7
	 lT8gic1NaDeWNCl2rSgSJaprMGqWtu55II1gtIwygI/XVelF7uDQEE/KsweSfKssaL
	 yLXV2QXsGZjD8uSSKEyhgX67VXh+o+tPjsf5oTzB+0ODmSdKAwb0n/zBSkkyqYsZD3
	 uP553YCcvfgBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93DD13A566C4;
	Sun,  5 Jul 2026 15:46:57 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wlv96fwq.wl-tiwai@suse.de>
References: <87wlv96fwq.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wlv96fwq.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc2
X-PR-Tracked-Commit-Id: 5720deab6da70d0676cee8a580f6146ef85a3ab9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 216a8b21797ff4ad8622a24a68f851918890e95d
Message-Id: <178326641618.3871366.9858106687943325073.pr-tracker-bot@kernel.org>
Date: Sun, 05 Jul 2026 15:46:56 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 05 Jul 2026 09:42:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/216a8b21797ff4ad8622a24a68f851918890e95d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
