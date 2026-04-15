Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC463ED5D4;
	Wed, 15 Apr 2026 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271855; cv=none; b=h+1U3QYWLsCkP7JqTdoJbH98Vi8H+kYsmzMS5qcDHI0pWQtgpPm54MXVwKdBofv3wEXa+6svm+tOfVh9tBtqcMdOtsTcwbPpvCIRcGane5MpjvdOrvif7B1ZIiP6xt3Y8uKj8o9uMjb5oES0HyQpVQVa4aS0YoqWHeVyAC8FPpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271855; c=relaxed/simple;
	bh=XFe9mV9O/ZHlNgCm2UvfWHxI92esoR8xqy0ae0q6qhc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R5DClJpIHtl3R4XwtcmAedPT7dmsltj1ricYlCWhlsoLJrJeR1jiWFndSHTBivcoY3DHDc7jYTa/wpouT0gNWEDA5wa304A64nw3JiHAi/1JfqiKkaVXAa7ViAcdvudkT21jzpQ6oRrj+h6fZM57mdadLCrcNNnvG0ficVkj+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2kgmqYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2kgmqYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2080C2BCB6;
	Wed, 15 Apr 2026 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776271854;
	bh=XFe9mV9O/ZHlNgCm2UvfWHxI92esoR8xqy0ae0q6qhc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r2kgmqYinNlpJmXFH2RgSgrEDlylriO9vieeKHCeXDjvwiki0qq+sNldBpnY8T2TC
	 67nyt6Rg+ftvn6/Bb8/pXPXcuee3GbQ4yb0wqTwamKVpoF6otJYPDiJhQN5sStB2Ev
	 3UJRtl+zby+xYC/r9Od4irbL2t5bB+3OMDs1xDaB9481NvzlvMfZOgkZIlxvfcMO9x
	 bVPixR9VReIzAkqatQRotXXUjiFtM5nyK6hsUEaRQ1Eu65j/jLgyi1hI7u79iGUP+K
	 SnFV+ERtJg5uemg3vvlUGOPNslK4frIqwy29qe9PqfJF3dAJ+SSlIHYfHl5ywMMy3U
	 IEldrnLYHRexg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9620D380A964;
	Wed, 15 Apr 2026 16:50:25 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o6jkfm0y.wl-tiwai@suse.de>
References: <87o6jkfm0y.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o6jkfm0y.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc1
X-PR-Tracked-Commit-Id: e0da8a8cac74f4b9f577979d131f0d2b88a84487
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a8e7ef3cec99ba2487110e01d77a8a278593b3e9
Message-Id: <177627182436.2328436.11637689008319384043.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 16:50:24 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 15 Apr 2026 14:25:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a8e7ef3cec99ba2487110e01d77a8a278593b3e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
