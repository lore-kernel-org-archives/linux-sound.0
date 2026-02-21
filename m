Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB08200C2;
	Sat, 21 Feb 2026 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636807; cv=none; b=St85JH+Yfd5C+vCKBPnpKIU6gn5GLhO/rPQeB8IOlfqsm4EcIdeqM4gtvI8SmdhyUr4j0bAR5OraaB3wrItEtS3jLkEqVFq1gLsED5Ca2htCPHuB6F46PU3m8sSbXeN45l5WSuSoPx1sbw0JuzjRMvQ9eq9qxi826BReDsK3lI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636807; c=relaxed/simple;
	bh=LypJUaGJ7yAyPK5KPgCZRnx9Q9zhz80eGhf9g/rb1W0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Axkf4Tc+Q3PHH/vYVV7Tc3V5STT/dNbTycpH6LOM7kWZxkV7Q08iKdEYx/JMK2/RSA7Ijp78zKPboNeGXqkzIwdXErZQEwkK6G5hcig4RwutUzV1bOIO2v6nLzbTZHN9UOLBKnXvt2Wfp9lbIRPSbgvr5ciJPNDlilASCeat8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVs9PlvI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVs9PlvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC407C19424;
	Sat, 21 Feb 2026 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771636806;
	bh=LypJUaGJ7yAyPK5KPgCZRnx9Q9zhz80eGhf9g/rb1W0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SVs9PlvIUQIqkdrVW7brXh6FnS7w8e6H1s737eJRsrG77MytdMgkBD/S3+EMgt+Im
	 kjeblIgHDiHlTctNkJHJhcgft5PlDy3R2E+5HPkOzmj3V7xtIlfYWRQUaICYLjMer2
	 cCK3fVm//S9ca36EQ+BrazrLBFLCIhCs2vaBc4wJkTXdxWA0EST2lhyzWa6QvUEctP
	 Qhgy9JCB6CVtWjpU08+YoAfRQFZEWrPFZZwZK3y4kNPrJcmTSgqB6cblkKHu7CkMMw
	 ODjftucUiikB2H4C7CkQiMCjcA+UlG0VtWxDNb0M/1+oj4LC4ZBihyrKrkfSEMwWSe
	 6IuMo3ez/hspg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03F0A3808201;
	Sat, 21 Feb 2026 01:20:16 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87qzqfo7i5.wl-tiwai@suse.de>
References: <87qzqfo7i5.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87qzqfo7i5.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.0-rc1
X-PR-Tracked-Commit-Id: 89339d889d63a4f981f185d048796762e86aa6c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bc1d4e705f48f001f3a5480f04067c48bd00bcf0
Message-Id: <177163681452.970518.9308864943504000639.pr-tracker-bot@kernel.org>
Date: Sat, 21 Feb 2026 01:20:14 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Feb 2026 14:43:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bc1d4e705f48f001f3a5480f04067c48bd00bcf0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
