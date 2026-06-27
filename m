Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01D380FC5;
	Sat, 27 Jun 2026 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782594811; cv=none; b=G0v/mssxFLXcUWSrtkC/WAPUb7mqNEpiSLW2hkSxNg351zkgtF/ZwwTbZJWTQRd+3dBzQbFIuwrWY74C3PqvQ/bAuug0+j2rMZ6HZvjtThM9mM74woOHHQ9LTETgmfNLzc4X6S3MvNwEfNRDOHXWPQs5+FvLPOvb3mdx4S/6g7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782594811; c=relaxed/simple;
	bh=dkblK99qhRsR9LKx8eeFIdpvUCl+zQQT8XcFA7SXhN4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OIMekK3pPR6wMwQpxxuKMHS9FNK5yvxN184KqIt+rZM82wKTsJ77ncDWM44meIJks586Stf0P06L/cSILRtl8cmDxIGyYbjo0E0QfBzXa4h2QPdRyWBOi93jXu3oK5HReELtR3DNVrkT/0qGuQ1SgmIa8RvyvxdE4pSlKGd6f7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcpNIDO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcpNIDO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1123A1F000E9;
	Sat, 27 Jun 2026 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782594810;
	bh=saBj7TYMHUWg3owjuxsgL8FppaAxp0rIvoE6KWV9KE0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dcpNIDO0wcNWONFbQkLeFUeTxJG2bC69j2yKDonqMtkyjSlhz5zweCSQjv4kVZZid
	 X0t+4SG1SYUwIeRQmZhZJ1OAS++8c713PmIKh4kZGLC0mnKfB2T9hfGggiIICJXcpF
	 pjobXIqZdYJcqSzaKd3H7j1E4EMYU81MsXLs7RnHErO85bdTz+j/fEK/YO2I56aQMo
	 +RrDo3TSEXN+MHamjfbffeOkbJRjTZo595xtfzcLc5zsTL8/Tjg0TpEs/LeJKyzgBZ
	 9BXPpgFuwC/5P0SVzsWfupmuJnvCPmSrCz54TaPAdcY3hxPzgw88FILeJVPYR/6abS
	 xlPDokpsvj9Yg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19C6B3938452;
	Sat, 27 Jun 2026 21:13:17 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <8733y8rqo3.wl-tiwai@suse.de>
References: <8733y8rqo3.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8733y8rqo3.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.2-rc1
X-PR-Tracked-Commit-Id: e1e31e0ec8a609e17fd2e86b77bc00d9cbb24d7c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14923571e78ae448ff4cc250d46d6f5fa442761c
Message-Id: <178259479567.1431938.11151483722854116859.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2026 21:13:15 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 27 Jun 2026 16:42:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14923571e78ae448ff4cc250d46d6f5fa442761c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
