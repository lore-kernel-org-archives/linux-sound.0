Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA45311C1D;
	Fri, 29 May 2026 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085620; cv=none; b=BhHlx0b+JAGptgo2AV1cjy9Wkp8d6EtwTQ1LO5GuJDtb+Is1V6fYjbwvDR1oThr7O55buZqd2/r74YuwOoXk82UYsF+1ZFXzl1Pmzzq2T8tjNGXI87vk9ajojcnwRcZHrsyT1LOqxdbWjPiV6brDNslpeAK8+rq7oE8n5RrCr4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085620; c=relaxed/simple;
	bh=aPg8y4EYWz9FoYUg3SI9sgdUdBNpjLhIHYRpHbypWTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZBpGj3GVCFLj//ioZZojpPw3BfB01l0UfwO2zKImyJP5uaQZr0hTb54YImSsU9aM1U0pjE+pGwteDn1X0OziJAzYiOTr6m3ycjIlzAIZCBwut86bwLCsY4tbkoiQWSYisl4pOGHq1tQksCmwxcRvyv3AKHjsA0zoywjVXfF4e+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc1Cz6wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc1Cz6wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBF91F00898;
	Fri, 29 May 2026 20:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780085619;
	bh=4WJNhQ/KdzQvxbq5V8J4w8b1YIlGrFcAhmUP9scatyw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Zc1Cz6wat/jKdTNLnOH98zoi6dQWFqjn5iFYWqiUEW41wQdLNuZ0TDmBSbruxKzry
	 M+1k0Rj3tDMGrBrHsqDBE7e+0DlLM+typ64aakt1GMNkFOKraiJBQ0xOVxlvvfoeJ9
	 PXWIj7u5QJPfsmJeZVckjt2GIWOdBX+f2frw//6EVBvp5mGyOJPoEOnbnhqZd0DMOd
	 gwEeAO6VlmNc6Wb/sMpx7Xz94A7vA6ZeJqS86OFnAxJuZfpg3BFVBFYAUblTdAyby5
	 WUt+vsH1MKrWSZdxhx4LQBIeYzKeRJwoN8rmHlY9yHdRJve6WtJxoff226AjH5Jhsc
	 cOEPWKf1hxiqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1997439301A0;
	Fri, 29 May 2026 20:13:44 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87mrxiqzrq.wl-tiwai@suse.de>
References: <87mrxiqzrq.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87mrxiqzrq.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc6
X-PR-Tracked-Commit-Id: 2c142b63c8ee982cdfdba49a616027c266294838
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b5544596021351f22ac01d5586c71cbeebb52e2
Message-Id: <178008562270.1949175.1066482582044022318.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2026 20:13:42 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 29 May 2026 12:24:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b5544596021351f22ac01d5586c71cbeebb52e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
