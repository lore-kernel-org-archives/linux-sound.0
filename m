Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1357391855;
	Fri, 12 Jun 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279740; cv=none; b=lSP0BvJDc7cxBl45CVzXfyvqj4k/VlhsyRUSpHeoTtaItrqGvyg8OCvvwmxWxMt+L/R745lYP2fE0baVmig9b7NcmFYTigVh1harCwMSPqezMu3LCVk0LtUGfuyHxmUCDoZcojd68nL7anB5iQpnEr2hiCKdTgu6x+U+PWy+K54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279740; c=relaxed/simple;
	bh=zbQSZs/N+fkYK1GD7Zf2Mj3DzwAM/kj4zpFCSdieMg4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kptFfv8Abkkx6ika5rxZwhvs6PGSA6gRkfA6zJ7kHsNyw5vltkkgIQw7rueq1IbaFKhzm0rgR67I/Dp52igMkkGlPf+Aq45OFt9qU0W1SBJbesgdUTNJqpacrS0hximoTm0l+Jjdrfj8pQQghB1Nn9O7jm9sH9B858GV2vx6Nhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU2DhaXg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU2DhaXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9391F000E9;
	Fri, 12 Jun 2026 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279739;
	bh=yLJeIIJ6G9HHzwfvZGshi4cFvOhTM7z0lLp8CTZbXNQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gU2DhaXgjCvBvOALhbMauoic21qb8/oDmMjKhC/wFrD6B4PZ8eIAP5RITXNIvzBy2
	 ofEuI+BpuUQsleu1FFHbkoBge17dRZ1WgXhvQGuN9rnbrtOzkOR2QeGWtskhrpbhPo
	 fYovmze8phQbIlDQN25nmjW8QFULHW5dhLtJVig6IUflWGJCdUUq9pD8FtQwa647mX
	 a4Wud8LIg0D2520/XSaUOjdgteuQ+ypftuPFcNFyLOa6ROFLz2JqeQyCHYrWOHOOYG
	 z7SsA7GCdjenSp5dZU8wabgF0e2XKydS7Bn+xvPWiaz2EmtfRtqKNLBL09vIs+dFur
	 RarCek3yhkiVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C13931092;
	Fri, 12 Jun 2026 15:55:37 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cxxwhzxg.wl-tiwai@suse.de>
References: <87cxxwhzxg.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87cxxwhzxg.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1
X-PR-Tracked-Commit-Id: b0d1553d51c3d188baae6d77e6f3dfb415a7b623
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1dadb7e7eb5a052a58fb2ec8d60c07186158efc4
Message-Id: <178127973622.723498.16890777440669639702.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 15:55:36 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Jun 2026 11:26:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1dadb7e7eb5a052a58fb2ec8d60c07186158efc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
