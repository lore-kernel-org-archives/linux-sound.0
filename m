Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453C70816;
	Fri, 24 Jan 2025 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737734684; cv=none; b=M624a4AFju/6ZHPtqdyVFbcHveiFb8TE3Wit7PayfEOIOM97BepJj3AhqUsOeXdjv21uOMTXvccWsQtDmZvJNABW/GC5O2hzK0e8goG7XocP5jsGs2BbG15I8q8MxzZBD6YEiFLRAdEQUoMCeLytVjjtrsUnjg1THKu2895kJ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737734684; c=relaxed/simple;
	bh=NkXZH0wgRv/chGdPA6Dpy4cJxNhJ6rcXeyXwVA2ViHU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lnhKSJ8qYqF+JztJE5q3Rr8y/lTAFh6IXl/or/sEZHVgWt0//S23MQi31Jk1faJxnUEEYGpCC0gi8xULsGjZr6oByk296hwpgs5yEmqgH7oRMHLtTAiyz2UFfo+YMdfPWPBuuS00VJ7SD/OAlK5WrHa2mZ0UOfVkKZU6fSPpj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HthMF5Qs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HthMF5Qs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DB1C4CED2;
	Fri, 24 Jan 2025 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737734684;
	bh=NkXZH0wgRv/chGdPA6Dpy4cJxNhJ6rcXeyXwVA2ViHU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HthMF5Qszif2SwrbTnkPVHBmjIvz8qtyDzZeLfXDWFvkmBrhrD6Re2sRLWPfwEjPB
	 DTN5VWvEJmb7i7Z8W5CdxejGPMIzxuonEE2neXTzU84f1aNGH+U2Pkm8lj6NnI0DKO
	 mRv0kqmhE+p/vHnLJLPCT5GoYYlFql2InTidTL+kV+U1sdsgxeQ5p6bIwdN9pmOhdr
	 cE/BhpFy7xjKRFrULXIIS3dbwd2NtmiiJUrT2dCc7WUgVjtvHHavxsuo2BXw3zUi1z
	 j3eNCnWviU5wxre/BR3YyPXYZM5rpIWFVmwWHuCIc5GBOb2kdWnIXYRh938ymc/CJf
	 Rx++Yzwlu+UnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71594380AA79;
	Fri, 24 Jan 2025 16:05:10 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87tt9p4pcf.wl-tiwai@suse.de>
References: <87tt9p4pcf.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87tt9p4pcf.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.14-rc1
X-PR-Tracked-Commit-Id: 6aa96f780204bfdac225eb4c8f51f86c38cc1a26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c8d2a510c15c003749e43ac2b8e1bc79a7a00d6
Message-Id: <173773470908.2087587.12285312151137289955.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 16:05:09 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 23 Jan 2025 14:44:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c8d2a510c15c003749e43ac2b8e1bc79a7a00d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
