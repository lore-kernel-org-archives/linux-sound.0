Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813754;
	b=xcFLoYher406xQbB2VCAaVQSMcka4QQ/6SOSnX66MZHMFrnnByZ+HAVm6DxFqGAjR/ei
	 ysdIbew7dFaYuRRkXWGo1lOZHrIEVlP2iLAxb0SzD6IHvlc37pyRhVTbxUN5yDMeNbpwj
	 fPOOitIt9ggOOzsLCBKTjB9A3uGbY+IjGS3SWkFN/osPR4dRvJL1L5iKj027RfDZcTTq8
	 x2znodoyOvkNDwnbzeq5TwwpCR4+QJJQcVT7W9GMz31IN5zGFTn5HIGkHg+kH1CtQUL8e
	 DJ6jfYykPR/st3gzoDy3cDizu78uejPO08XhE1s9bs/rmb/IXEyRBIqTIViUePVVTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813754;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ZPF8xE8iPPEprL8doQPhWcWWfXSqqUuQoSoyq06CcLQ=;
	b=bvrutnRoZeNwp1hmsMDqgx/av2Vy7IFwUA8dZmIm5t8y/hbPD6/amZph2XoP27wt4Yi+
	 9jnzx5ec5yZirpPH22vbLvzodXmh6DUyFXLnrEeupUugTvZxmYsrWMAl9TZ0/IhMdpYsA
	 QGu/Umr7RkxUP8NMJykT1miy841Sgkqh7WMxbIHYeiw/pp+qyyude+TEB+8c4Xxmm3MPC
	 FeNhjTfREUH/5ChvzkHXn3Kpn4dSB3ZnYBw9tvXF9WmcxtFpNJbtAVe342yXMnwQj+pz6
	 mF3JPTCrEsYXkEZaqPW+Dyx+aKA2i6AZiJiRVvs/9okz/AsgHKEJNBsm8sxurS4o58A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmfvrSYH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8638606A324;
	Fri, 27 Nov 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmfvrSYH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9DC1F00919;
	Fri, 27 Nov 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813754;
	bh=ZPF8xE8iPPEprL8doQPhWcWWfXSqqUuQoSoyq06CcLQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BmfvrSYHC7bYfU5vHjK6LFgsvg6xSbB29rIw+H7ZrC+i8ekkgEb20x+BY+eg7ZXuu
	 7EMZFFshJdD2AvA7OoXfZ3Zu58sP/zIZmNuZq6plWscqD7s6FE7pkuoGlFPVoT1SZf
	 m51zCh0rYH0t9qmrAG6viKti/7ZuCEK1T7k6WcMnZdgFF06NriKlAMuncLCv+gHmML
	 RpsJcyIbjCc4dyyaL+E9mIuwU644KmUpAUYBaIbGfjzWWvgcJFlNYj/c7HW1HVzUe+
	 c2fbyKk5iL3h2X6al0sUtJhmPDq3spmBNCf9i+m/U/TqA6rMuOMZcFPI/HAPWFRNhH
	 04FUKTxoL5Trw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 718373927065;
	Fri, 27 Nov 2026 21:09:14 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0aemhe6.wl-tiwai@suse.de>
References: <87y0aemhe6.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0aemhe6.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc5
X-PR-Tracked-Commit-Id: e79163b531eca7f3fdc05031f4b43b6f7c51d3bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16a4afe366a22507ccb7b3302f956e6404aeb4b6
Message-Id: <179581375310.1686500.6160069251626678134.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 21:09:13 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 16:19:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16a4afe366a22507ccb7b3302f956e6404aeb4b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
