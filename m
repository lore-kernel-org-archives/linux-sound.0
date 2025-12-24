Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F222A4D8;
	Wed, 24 Dec 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766602720; cv=none; b=lev17MB80DNMAyf8WKO3sbvgvjIAc7JEczSlnVUrZw4oCEk6PD9wtj8yaWPAt3H7CQQgVFcWyWHwYpwrQSYLiKB3KD36wSekFXrn65iru3kwv8J/+Kpg8Yldy3JH7/PDQH2g2wCwUW2ke8jeUAUEDWV3FGCg+a9ss2hQTn0jmIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766602720; c=relaxed/simple;
	bh=tXCrLtD6yRUTeZ18dgjkrVXVOA4BkoXjDna9eSyh+nE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PqZTyjwngQu8g5YoCtMjZC3A5mBXBydoRD0uq0AadxZBZgNnnKykz54p1SCdwXGY2bDrSLcgfl4Wc/H/B/jmRstSAfKC7Gc+BETVWd7MlbltPSTpVT+qGLDCgnpD76yrKN3+stEo07P1+shZLR28J6AxeNCy79YhRq/e2FtKk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rePnhf3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rePnhf3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF1FC4CEF7;
	Wed, 24 Dec 2025 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766602719;
	bh=tXCrLtD6yRUTeZ18dgjkrVXVOA4BkoXjDna9eSyh+nE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rePnhf3A+rl0xARVNLGTIU6OBYSX3XS8Xsaqj9zZmO3Cwrt7pG2pBIYVwiBgQX0gF
	 NZNquMVLgq3tL+Ga8XUc6aycaZI8FDrxIYPf9ey46dQsOzf8L1tLiM9o28RIKx0hOU
	 Q0OKjYMHKjxwwBdYvKIYGWE7vgRDKOxm2oCUWtbYeRPcF4zfNBw3gnq2O9cw9djQIR
	 QacmPgzacAcJ8v/Pl8Y4j/5ZZoY7kfTI1fILCwwd83p8Tkk7bFZ1FsPLmfPFZQ8s0G
	 FwkYe8av3t0OXOtqKbc3phUz5/YAKP2il/o5qgH1bRO9EAzN4vmbhKWF2H2G/bp/Jb
	 g/5yTzOI8+gXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B59D73AAA0CD;
	Wed, 24 Dec 2025 18:55:26 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v7hxilmk.wl-tiwai@suse.de>
References: <87v7hxilmk.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87v7hxilmk.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc3
X-PR-Tracked-Commit-Id: 17753d1755a589659433ff4ead595f2bb7f695a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebb8719c1a7dd3d0c6f49e38a95bb6ac89f7f7e1
Message-Id: <176660252519.1574379.12759450167240445450.pr-tracker-bot@kernel.org>
Date: Wed, 24 Dec 2025 18:55:25 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 23 Dec 2025 10:38:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebb8719c1a7dd3d0c6f49e38a95bb6ac89f7f7e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
