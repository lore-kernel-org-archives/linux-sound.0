Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F1536D9F5;
	Fri,  6 Mar 2026 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822299; cv=none; b=fkbR9nLTKyBvDMrSc2LiESaSneRkVnTXLwhHo0345Ksx0yrFKQ4Np6qXmpEmmlFOFDMhkaNJvTcwm0HVsu9K+neMmWJKywjYlm+hI1E422Nu8v4Tw0gXygZi6HGwJmar6qaqfmA4qyy6A8gB5HEajo+vER0F/2hTJkV68xnREIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822299; c=relaxed/simple;
	bh=sP63ZjpJGD1Q/TZ5ZkTUfTiPX6Jg6Uv6WTKs/bT4eOo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GgrGRqoqKA1yovQ2SaRdGhex6P/KfQtNEDj82qrk6uVFA628fNUrpFVFXixmBzJbBGUrZWEPSh+cj8qpqaKWYPtDF/NUz5cNy2xERl5O2m+fa0SFqul9ltHyJiHGovgsAtxYdKU3S/KNOKEyRuuABrHDqIOJjHHntNlwDlnNHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arkSjnX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arkSjnX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B0C4CEF7;
	Fri,  6 Mar 2026 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772822299;
	bh=sP63ZjpJGD1Q/TZ5ZkTUfTiPX6Jg6Uv6WTKs/bT4eOo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=arkSjnX7GiPbEo3B4Kr8/NAZO3Xh7MaI4/HIHE59b0alcurpqJluJc2CkvpRLOgAI
	 yzrtOFiEf2GCXe5Znn8fkqgGH00Fo+2EcALXMsHYqYx1DVzsuRIVGbzhqCF0ySFmcg
	 pOrzkz1NhhwQ87k03c3sR5ICU/Xh8WgJ2CRhg3MO3+nX/d8e7t7IuLhRG44Px9E5Si
	 PkWvxDpHgclSxgJw51Bm9YxQ7C9Q+UToC/De5IMPW4W0oCEFOtNTKExEpQp4xxqopR
	 OWjef5Jr33/iESItvx7GQU9IthzAVgfQcUEm38ePfJ40qSs6axDOS43sJ+cuq21NoX
	 A5NCr1JlsVrHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEEB3808200;
	Fri,  6 Mar 2026 18:38:19 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87qzpxudtz.wl-tiwai@suse.de>
References: <87qzpxudtz.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87qzpxudtz.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc3
X-PR-Tracked-Commit-Id: 8457669db968c98edb781892d73fa559e1efcbd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d249037ac4701c32d99bc062834d592a57cfed00
Message-Id: <177282229800.7628.14821300527920226905.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 18:38:18 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 06 Mar 2026 17:23:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d249037ac4701c32d99bc062834d592a57cfed00

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
