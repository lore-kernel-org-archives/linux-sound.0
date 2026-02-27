Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EC3A7F5F;
	Fri, 27 Feb 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218776; cv=none; b=j96G0W4A3qFX2pOxixsXlTtkz0IboJ5clm7LUhQZlMdOLSh6iTvgwh6y9m1PrNsKbK1axTYX2R7hn5aGTWDPbLntQ4cPQ90xfUte3v+xsGGZWEW0RV3RTpOEP8Iu5WzLZZIaW5S0pxIKEyzJF5RbNF4NVHud8hhLKEufAngHkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218776; c=relaxed/simple;
	bh=pwHUY8NWMvAvbzv+5dKSfmyEQI1QKoLa1hpSMa3qzPg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C9/NC9y+Nsy9SkKDPYMlU62K+gpclVKojWZ8IzXSyt7mfU87qqHNtuc44YNLm5E0xNKNhxs8nretPFyJSFbaSRxS9GL71XA65zRnHMJ6mqTKdw58YPsK6agqa0JiDnWU+pC7zsvq44yK/03/Ncb7ZVl7srOr7LuHAtVmyU2srtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW6Q/vhY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW6Q/vhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7F7C116C6;
	Fri, 27 Feb 2026 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772218776;
	bh=pwHUY8NWMvAvbzv+5dKSfmyEQI1QKoLa1hpSMa3qzPg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LW6Q/vhYaN0GP1v+OS3wrMt0B3LBitGmRXNaTE69eJGV5CuhOjeFyp2N54SbAhcWH
	 Qk24QSZhY9bHSj9tCdNeghF+1mm1/q8073E/XPScJKBelucnlaKXR7cBdeN+DG+ovJ
	 tkCv9sY+rL9ilEHGYX/AV/QQYFVegu6BPiJnpcAgIAMCVNnAsOjZuScnBRLd6tG6Tu
	 Y8c6OYfMIrTuRY54701PwbQggCmxmG2jssRJE4bmn6c6lEnSS5moHmJLk7dN4y+7Ze
	 i3L4x+lKMqKSdnL99TIVrglFHM7kSaNSUzTe3teu9jGre4wF4iN5dDRZQQpeuSDxdL
	 kGQ1n3S/2LwEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF6439E9614;
	Fri, 27 Feb 2026 18:59:41 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a4wu8cqn.wl-tiwai@suse.de>
References: <87a4wu8cqn.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a4wu8cqn.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc2
X-PR-Tracked-Commit-Id: 71c1978ab6d2c6d48c31311855f1a85377c152ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbcb2cd6751a9457275728f7004600320703a788
Message-Id: <177221878016.2713791.4808533463857686914.pr-tracker-bot@kernel.org>
Date: Fri, 27 Feb 2026 18:59:40 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Feb 2026 15:47:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbcb2cd6751a9457275728f7004600320703a788

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
