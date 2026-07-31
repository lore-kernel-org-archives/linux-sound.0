Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164841A794;
	Fri, 31 Jul 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523136; cv=none; b=KDfYYTh85oIvdZt5mdWOxQjt0YvO6wEQ+RUKV27Y0H5eGJCULs6g/LN3PNe9XvDVVi+FRmhf/GytsuL65HN+n3EYGFC278lEyae6aoLAWsubgI82cLfFpGhnNe9oBtaElf8vtmTkYSakbSA4A3z03HQtEgn/5ef9IjkxssRTUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523136; c=relaxed/simple;
	bh=z/5egHa6D2LkA3X0Auu30UwxePmVVKyxaMHwI+m8+iY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mNAuilu1ES9KcnOaUxiXOkeACeosbXl5t6BneanWpEiazBtwEpB3QYdXzmcyzgU8/yiJ40t4yqjPOfFzd6QhVB6sh58xRM60zCe9ryndiVD1fNqhETYXhVhefxgjljKmnmWO2Kp0iBp9qI4vXu7zWz8Muz7a4tNRlSHU83z3m7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+YrjhyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+YrjhyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF31F00AC4;
	Fri, 31 Jul 2026 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523127;
	bh=qeRzTvwyYu3b1NhaXFWa3QWk988bXrJGsRelYtz3Hns=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=D+YrjhyCj4Rb7BCuDBl2pncrOIA8OXNFgY3S1hqBAgLyceSpo2+IR5oi3JGr8kkHo
	 sxQLFWja1dV0TnirmknkP1leDWKrmYgVHkXaykOJ9q/+B72d3mD15LmaHS79VDo5bv
	 XzrTiCDnD1i02BKRLv7hrMyuSN3Jo3gqsQ/LUInYnYMFE+n8pqMAlETr4yjrJ7AygD
	 p0A8EDuqNduFLzFz1Sn2gKcEvpERfoNhmPSTuv6mOkCfHVaMbqDszOjJ6/jOeGhsn8
	 kmPoaN0VNoVZT62GQytSOzAS3wyUDWlCD5GME0HuDbMOMonF+/NaFNu9oq+6aJpXKg
	 vlya8nwOq+Drg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A9939263B9;
	Fri, 31 Jul 2026 18:38:11 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <875x1v1uyh.wl-tiwai@suse.de>
References: <875x1v1uyh.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <875x1v1uyh.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc6
X-PR-Tracked-Commit-Id: 2b6e56b848fcbe82d297805c927f4556123e5039
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5d3fe9d25e321211229d09fcd431c45718a2f03
Message-Id: <178552309009.857209.11170794557699566790.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jul 2026 18:38:10 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jul 2026 09:25:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5d3fe9d25e321211229d09fcd431c45718a2f03

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
