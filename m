Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD07349CCB;
	Fri, 22 May 2026 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478728; cv=none; b=TeT2v5fdKfjn0IQ+F7Bwvpje9znQIsuxxHnqWRVHIGHo6jiVVxYLhUHG+DAStvoeKnG+t9+Q+Vp+l09Ac9T/AZvyYdaGBXlW0Vt/Lm0W4wxCGGnFr2diiQ4pkuLE8zCkzZ48PvJnelwwyfKsfIY/Ud63UORLMDV5A+/sOXnVpqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478728; c=relaxed/simple;
	bh=KHouaICsTh2SXUacpCgjK0VE4XVLQF8/YmUQYifOjsw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LwaLbY17h2xwuKTZo9nb2xFFaC5HIJ37GNP95fNAVFOpE/69dc2CMxhMPux53pleF/+McOsv+HpdXXLZMT/bAflGX+vB//TF87Md4nmwLOoniEIeRGxf5QUoJFDlKv5Fjd/zfpM+Vawa5g5kMr6974X/Zp6jAbniX3E0KRqhQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdoHaNmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdoHaNmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51F81F000E9;
	Fri, 22 May 2026 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478727;
	bh=ICloeZDx+Oyhe7VQwlLwHl1aQ1PIgAD0XE8OUnJGJCY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FdoHaNmbSuSmY6uIzo0G4LBNFTEjil2oT6i3JiX8SV5yNqCcV1xTLqtuFlG0ftbdE
	 XE4VbQfhWQZZPeqnsAjWEeX8c4C4Uhf3M/3ATEU2EoO3GZ8d7QwFYPRhTLsv8z9Fpg
	 MmOtN9UYPIzzsFnobzwJRMNqJGH3HERlDakgezhEiqZlSmlr91/EjQIcAdxIGnxpwf
	 vouEjePVVIlMNE7pavQAn4MKhGAP7RLqoZ+0+GDcwzSaPd19/ixRH5V9nB6cxeKhvD
	 y++KL3DngRKsi+D5s1KFcZ0B760S2Cila1PDyfWk0BBERFs7DihbH5qRPl7z4E1Erp
	 hbkkVFpmUiPhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1993C3930FBA;
	Fri, 22 May 2026 19:38:58 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ecj3iz2y.wl-tiwai@suse.de>
References: <87ecj3iz2y.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ecj3iz2y.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc5
X-PR-Tracked-Commit-Id: 2519003dd5fb6f89f10f031e3a97ecb7c9d1b816
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c22407252a2421286998323831095e6b8a1d9532
Message-Id: <177947873683.1341212.10433986128031391263.pr-tracker-bot@kernel.org>
Date: Fri, 22 May 2026 19:38:56 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 22 May 2026 11:16:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c22407252a2421286998323831095e6b8a1d9532

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
