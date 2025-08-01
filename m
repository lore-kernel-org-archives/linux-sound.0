Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1228ECDF;
	Fri,  1 Aug 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754084227; cv=none; b=sdoRwjpBKZzNn5YQF6Js1lgArnwt8nUBjTEim5K+0ojUoe7m6DOVB5R/k332s7t6lA6eX4vd2n6OCUk5p+wHMUoKfJEpybswMbyOD7sWdCzaASOj8h76dOlGTqWuADpI6uCdAkQZKxFOOCZh3xP/UfVy+3VedJ+XRaWuKfABipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754084227; c=relaxed/simple;
	bh=8t52XgXD6VVUixH33PTUlVuKXYILCXgzbeaDcJ3qd64=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iEUZX9Apmcxvd7kPIoE7N/oD0s9gGv91I8dN8RUm7IhJ8CGBOG/5pjuwdcVhnnKgQJFWC9dIz7ck2FmrwKLU+KmXbsQzTRmj8FsR2j3Fbg9M47pnRVW31PcaCRTy263qjx8BA/tW8Qy9inQLo9l/opRad33VmVNqYS9RdX+5cCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZkJS0zS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZkJS0zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271F7C4CEE7;
	Fri,  1 Aug 2025 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754084227;
	bh=8t52XgXD6VVUixH33PTUlVuKXYILCXgzbeaDcJ3qd64=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VZkJS0zSKdsErEWHpXCEl9V+f8OULXysBpIz1tE9Z/RLxBAez83Mo4CgiXtaSEidI
	 1XjyhS4sIKWhiU4jHJ9nh0cYrc9u+8LKVgtU4YSWv1cKfDSfvSsGUk1loIPI3stENl
	 zgAQGCBLx5wOc0aBB2gR4pzz0lcBLHWnMeuN2H22l7jKwQCFob4aLF3QyRA3I/QNl4
	 aHS00ixVdD5FANI6WsZq93NE33GRl5FFQAQ9lL6BJ33ujuacDVeAC1FMZPgbGwGUKp
	 bWVhSHSMx4s5+/EEsuBPZB756IAfi4IGNJfbXistBS/ad+mCpyjOJjiJ6Vm8HXyLGY
	 6snE4RQS4JicA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF3383BF56;
	Fri,  1 Aug 2025 21:37:23 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates #2 for 6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87qzxv2p97.wl-tiwai@suse.de>
References: <87qzxv2p97.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87qzxv2p97.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.17-rc1-2
X-PR-Tracked-Commit-Id: df485a4b2b3ee5b35c80f990beb554e38a8a5fb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a64bdfaf3e641862e8088a19205692b8b229753
Message-Id: <175408424220.4088284.13258779399118456338.pr-tracker-bot@kernel.org>
Date: Fri, 01 Aug 2025 21:37:22 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 01 Aug 2025 14:35:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.17-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a64bdfaf3e641862e8088a19205692b8b229753

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
