Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC7423E92;
	Tue, 14 Jul 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059629; cv=none; b=bYT0cGQbJCw0q/RaRjKvfq2P0+DZooWy6s7OMp7M6YDMFrhpNjgLLui9FA+nIqbk3rCSd0s+M8QI4w6DmQ3mMCMFRiQgTAnc3GtgFLGOzH3gJ68oXLxZVFbZJ5znTi4pbEgWLSdNXMK/iiy5hcKoiiJ7OOu4lpAw5klezu+0VdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059629; c=relaxed/simple;
	bh=zQtxhtuk+42DSGrM/oKg3KDXi1SoK0CvJE+qOLxcpqA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=K1BeROpU006j41re7CqRTwM7J1Gp+j83rZtYt9TpqCPaKfHuseCSoOuqXtZwcH81iWrqM72wAIqA4btMupky19Cl8+V02nNf6GcpFV1BQSHPWCDpYl8y3nYJ+ZtfZIXfNB3gka823Dfgn4EA94ZgT8ynASz5FaFMWhoiMRZcZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kt0nnGJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kt0nnGJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D896B1F00A3A;
	Tue, 14 Jul 2026 20:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059624;
	bh=Cb0CR1Gw5WoZQCex2AD1IYc+YzjEKJFYI9Hac0ranCo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kt0nnGJzqKB9rjcknZSNWXEjtRZQBWp2NnpTPtYj6moyOao34XHidhDRnYuEdc6fB
	 BQOohtE0zxp7tS74fQGB0vufOMrei5gNDp/LXqz1dq5yUYTVg0exi6jns1d4HkHuP8
	 AbxCYwPf7wNvNLwnQjAXrt8LY7EYYlc+sSi7zuvc3v9M5xf56ehHYiOARxUH+XxfEA
	 a5vMhh7HRovfdEgRry7PXB23+Z2/R5O/x61ew5ex2CLJHXxRxPpcJG04SAUYNbWyE9
	 c0Val+PubSbNXDqV5as7GcFHiYuMRTiVLqrNX1msVOdD/4LNG5p/Ptw2zViQ6YaKNx
	 S2m3R3CRyncxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93D0B3925F64;
	Tue, 14 Jul 2026 20:06:40 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o6gayp0c.wl-tiwai@suse.de>
References: <87o6gayp0c.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o6gayp0c.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc4
X-PR-Tracked-Commit-Id: 5caf27a2bf7f86f92f03e851d252901b64ed498c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58717b2a1365d06c8c64b72aa948541b53fe31eb
Message-Id: <178405959918.3761663.16963611217772105127.pr-tracker-bot@kernel.org>
Date: Tue, 14 Jul 2026 20:06:39 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 Jul 2026 10:05:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58717b2a1365d06c8c64b72aa948541b53fe31eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
