Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651B3F23AA;
	Thu,  2 Apr 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151521; cv=none; b=Yb02UkEmSh+PfMDI78OX9gHLFJJhcQbNl7ls+2Na9011uK5trQ37PiNdZx4R4IaXLmomS0dc/Qz7gFqwXSKIdZYlHm6YGjU/+q+EHSo2hEzmFvygPEClFW5Qyglz3y/MYuVfwOj/g74JuuYNLmGiH1iFVqvCMwGFmsPaMiHw140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151521; c=relaxed/simple;
	bh=L3T9ZApgvs4Guf6uM6BF1zEgS4CNo7rfN0Kxo7Sz8O0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C0FnigM3GqAztbZazzED2xtXMC45q3TmjeZNuZqeh15GNKrZrrm/ylWgS+gABpsmcXlHSW2aw88mvHwy+hfyGgtKu8BYZrSeZ2euY7KcsUC/TIi5EmG5QmOXv1MdB2wgRFWP7eEH3+VFpGZ2KNQjhgv/mlMlLgQq1QGnkFoRLbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5s/6tvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5s/6tvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCAEC116C6;
	Thu,  2 Apr 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775151520;
	bh=L3T9ZApgvs4Guf6uM6BF1zEgS4CNo7rfN0Kxo7Sz8O0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r5s/6tvcpqJK3IPPk1gW7PY0C9o0h4g1dVFr79lbZ9SGJlkww55Vx75GXP2QoGORk
	 /VPWNex2kG9cmFra9LyO6SWOu3MIBX7meeIM3USO6aySSal0YlXSsix5fvK3gIqXIf
	 uM12l87WwvFBnRQwNrL2Cc2JVpTAe8oRo/SahxgtCCGwL9HJLiHwg1tHGwgWe5a1MF
	 fzUgJt8LpbFh0x87lKXHOAlOsKxzSyn+40aXpKvdo/bTtXnMnmXuuR+5Fp2pRbR01d
	 rQdU0SgwikwFryKp+NHKGB/g1k7tLVF1R57VX+nBL0wOhnm+X0ijacBXi8PDdGHk2X
	 dmSQrw+XHJ9kA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE533809A08;
	Thu,  2 Apr 2026 17:38:24 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ldf5ikg1.wl-tiwai@suse.de>
References: <87ldf5ikg1.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ldf5ikg1.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc7
X-PR-Tracked-Commit-Id: b477ab8893c3e6b4be3074358db830687de7bfff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ec9074b28a09a2cc4871371675bafc575a114c5
Message-Id: <177515150270.547608.8773649853402991381.pr-tracker-bot@kernel.org>
Date: Thu, 02 Apr 2026 17:38:22 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 02 Apr 2026 15:02:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ec9074b28a09a2cc4871371675bafc575a114c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
