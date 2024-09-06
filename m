Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA861B85D5;
	Fri,  6 Sep 2024 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649954; cv=none; b=jJONktK1Qa2rS5M09me6uFe1avcb29J3u9HlkaV4DOeaxEGvv/WG1xNVj8fUreskMFZnb1Dp/8gMHYRVxXfpeianVR6mmf75+Uy9lwiTNeky/gVfGdXdlQiWGX9IlcQRc8yjtnD7jd58T3rV5nmwK4AYLvatar1Z3d8Lbcaq4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649954; c=relaxed/simple;
	bh=u/75RVbSwqmNThF1GUR/DiZSxe/j1fPy2Qzp0WvFZXU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tZurPKh0ydWdISOmstA/onAr+Ej5T091O/wsH8s8MDMGQwRyK/saPTkoCHMT/gRttXVtGV39vY8GthAgu/e5rfpUTW1N/28MOoWgPOPOCVeBYFeA5W5Uo3E7l6UO74NZIevshT/9jGACke5jR7tkn6WTlFiq+4ETn1k6fjoRlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsryUBkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsryUBkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8F0C4CEC4;
	Fri,  6 Sep 2024 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725649954;
	bh=u/75RVbSwqmNThF1GUR/DiZSxe/j1fPy2Qzp0WvFZXU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LsryUBkfErqCEMwdRr/wBeXWrteWYsz3z9Fzn63JGXqcVMjl3wCTTffk+TTguRZek
	 doGyoijSg2LoscMUeHqfwmc5D5sgjwi4bpYo257IJqoHQpFeQ/MSU/KUfb1kUZYI9p
	 +lLPnTqoUnOap35ukS/oFFmrlfL9BMO7loxWwtZPlpl+s94F9hrg9pAL1tPX7bZ4D+
	 1gtrB192qG0i76VDZ48Ufibnj0zZImoHZYOMyFOlL6iNkclhTu5jvCfZlBVRaKuyhI
	 nnPtORjeS12soiNkwuuFR79y3dQoew6E74v8y9m/8T3SIS0q9b0Eofwe1jwthzo3A8
	 PPFTXFor7Q6lQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3401F3806644;
	Fri,  6 Sep 2024 19:12:36 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87seuddpmp.wl-tiwai@suse.de>
References: <87seuddpmp.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87seuddpmp.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.11-rc7
X-PR-Tracked-Commit-Id: c491b044cf5f8236742887ba59b30032036e4ac8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 703896be3015db7f8fd8822b18909a5914209a70
Message-Id: <172564995482.2497610.6942647508870817400.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2024 19:12:34 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 06 Sep 2024 12:48:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/703896be3015db7f8fd8822b18909a5914209a70

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
