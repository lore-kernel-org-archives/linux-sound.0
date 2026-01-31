Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE482239E79;
	Sat, 31 Jan 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769893794; cv=none; b=fAjvcYoe4QEBxAkR71hDOt4aCPOZ4Tk/AN7AZSKknTCOKkeLwvqv5AbJDeNMXe8NBF0F5eVRCpVuVrM7kIjUubRFFViSfSPihlpEocu0fWsi518WIIkHfGDoHao+JJRFZWlf9yNR2NwSwMZeqRWmcWxv9eZZM013jaF8JE6aYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769893794; c=relaxed/simple;
	bh=J2lDniZyYW/+ytAx3hTvUjcxQUtsUMaM3cc5zZv32+4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=T4z8ySKoyS0T2yqup57KdUcW+1Vt+dHcTmAfHAh52DVw3Bueiart1PoorC+fdhV5wbouc4LhylyvpIRIcr0ciAau3ROdUQ2FGZxnr+6ituVHStv59aP/wi2Hn5K8dHZTepBvJJLMLC0jA4JmKijR+wqHl2dSZmX8yxyFF4NO/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwJrq/L4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwJrq/L4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86031C4CEF1;
	Sat, 31 Jan 2026 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769893793;
	bh=J2lDniZyYW/+ytAx3hTvUjcxQUtsUMaM3cc5zZv32+4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GwJrq/L4vl7eLxxWVAjaddZe4LH3I7ykRxJR1rNhe1/LHNEKKzhLuHOKHaM1CXhg6
	 b8PBE56G6QaaUZpy1CR0NcRyKYKWfhTVRnMtLhdW/0U4hRgtDFnUOGRFbQDkrcVI9n
	 FuQTM/muWf3f9FygsCjsUf9bNLcsWOG7ioi/aPLlFsMZYuQLu2yqePi4W2WqfZUqgz
	 kSYozk8IpS7AHcr/HI0rGqIBFD6ROj1i5s+BrM9PYsrr0Kf60AEAW/LCJAv/lUfEM4
	 5VTXzcq8WGKc0PawLTOChv523Px1Ilqsrs7pFxnHnKvUxgf9M3MphaHb0ZO0mJyor2
	 hIdBzNjqsveaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BDFE380DBD4;
	Sat, 31 Jan 2026 21:09:46 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjiaazwr.wl-tiwai@suse.de>
References: <87bjiaazwr.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjiaazwr.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc8
X-PR-Tracked-Commit-Id: 00f32dfceda29f8dc6c34b159123f3bf78ad3b4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9827b1fb558a58b40e5c6f0689acb8597c2dea00
Message-Id: <176989378505.4190632.13441772756293458573.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 21:09:45 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 Jan 2026 10:34:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9827b1fb558a58b40e5c6f0689acb8597c2dea00

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
