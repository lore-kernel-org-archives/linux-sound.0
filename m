Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808FF7D405;
	Tue, 27 Aug 2024 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783784; cv=none; b=dWA/nopIUkSOVBW4E5M2AZetW/WRFpNORhVsz8mQyE7OfewZetH5550T2uS7Nvd6dPGZbuH5Om366e7g2GueuTzfStGIktstMHy5RP5eM/1LoC4CVwTL9lgHVvdodzPMnNlEw2pm9VI5OyQonTxU2dm9TiGhiXC5SaaFG2tq8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783784; c=relaxed/simple;
	bh=TkTOZTz7elfBYHzD8RbvH2XZQpZKPsT+JufOQhXApJE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lAPuhgJxbzDzc/KKeVnznli5vG9SkEYcp+TdjFCuTeA1/Pe33JGrt+to79KTZAcO6WZSTaJQAgADrIV2he0aTZcD9za/2z2uTp28rVipSIJYv72oj/cvKL0jvqFHlzcouPdIrhN95NoHtVIEVwHRJ6Qri35kBibcB0X0tJyhPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GekvIc7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GekvIc7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE54C4AF18;
	Tue, 27 Aug 2024 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783784;
	bh=TkTOZTz7elfBYHzD8RbvH2XZQpZKPsT+JufOQhXApJE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GekvIc7hwu6p7phqP7M34f4m88Bjwbm3GcQjFo6I9fv707wz2RN+CxwRbN40/8f9+
	 u3z9qO00hfaD5hzJbJterkitnlAlQeP9xWYIuZncTNa3615M5+sjooMUc4x6Vw8mbp
	 bU8LpbaPz6IbyMA/OY4iqPR4a4ONXGUch4kE1ThcKgMyadHi3VS9Kdn0EAFuzBb5tf
	 PRTu2EZMzAqJRNWQZSf/6OZlL6jxpSMg6Z3s2oVgsN670zEFTtm/g2r25PgN92GrEw
	 RsFwB0xMhCtpDyRlTJGLeasbqjax8ExXJH0qu9M0WB7g9x4CLlnZc9l4sNNqezvhFO
	 3rCT2HwXqnnJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6F93822D6D;
	Tue, 27 Aug 2024 18:36:25 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfoy1hr1.wl-tiwai@suse.de>
References: <87zfoy1hr1.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zfoy1hr1.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.11-rc6
X-PR-Tracked-Commit-Id: 28b329f431cef840fddd9a9b493bc3eff1aa06c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6ace1c7ea2972bb3d8bfd5ca3d1a1b2bbc41687e
Message-Id: <172478378421.730673.16355849751204224560.pr-tracker-bot@kernel.org>
Date: Tue, 27 Aug 2024 18:36:24 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 Aug 2024 10:40:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.11-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6ace1c7ea2972bb3d8bfd5ca3d1a1b2bbc41687e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
