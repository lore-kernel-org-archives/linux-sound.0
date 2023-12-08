Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA541C78
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2xE6nJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB267C433C9;
	Fri,  8 Dec 2023 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702064307;
	bh=o/kkmyDEFR0A8zybW0jW+ZY0fX+Y5TDHGh0WHQZZ7k0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m2xE6nJ+53cN9nk1J42I1rchFQoh9TDlO3+0fn89/umyw3E/ObKaw1WaEhRBmlPdk
	 370wFUiifcXjYVrLylCIDxK8g+1XZSE+YHUccK3o8GvxOAh/9X0USb8xArQWbyD/g9
	 mChODUdNN9QDSjohKDI13AHTIWyN7BuYbjBARAeIk4wtLGbgYpG+mGRcEnnDuf8qhA
	 39zSGWcLqfy4h9N5pP4E6IWKm9YPAbIwNgi6Ubzd4c6HBfE8Ur7L7vpUt1jdlFS0/P
	 lUE2T/cKdGcvqto4q/937lW8g6scfYZkPMVg2kC50lOj5xfZWiequ6MripAYg2AEYm
	 rQiZgDRyfT4yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9672DD4F1E;
	Fri,  8 Dec 2023 19:38:27 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <874jgtyo9u.wl-tiwai@suse.de>
References: <874jgtyo9u.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <874jgtyo9u.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.7-rc5
X-PR-Tracked-Commit-Id: 634e5e1e06f5cdd614a1bc429ecb243a51cc009d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b8b68d2fd41c1068554290fdf2c5adc6b03d40ce
Message-Id: <170206430775.311.17101107361265756825.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 19:38:27 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 08 Dec 2023 11:36:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b8b68d2fd41c1068554290fdf2c5adc6b03d40ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
