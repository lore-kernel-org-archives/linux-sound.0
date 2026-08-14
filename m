Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82F4908BF;
	Fri, 14 Aug 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786729435; cv=none; b=SNaKSeUpp/58OruUxdjoXEhpcYepFT0i235QlAWcyOXdWZw98HrwRsLwUBioRW2KIPF6zszN3nL3+Pz8APwqmWyJLXaEmlp2Nb8mTagTd4pQaf8RW+1yiTkPdyDF0qsFoTh/9n1Xz7VPmICwm7GfTCpJhNIGh3W8ksZYLuB0GK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786729435; c=relaxed/simple;
	bh=+VuA6SQAaigUAXpTVjM8Uu98bsGMacm+0dVnh5oBKxs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nlS8uJctxswwChu8YIQk3WbF+OmWF52v+BrSyNm9CWgLcDm3H/FnQSyb1rI5IyTa5l7ltB7apnr3cOMIc8JOKLN9TukpRA4bsouZ4ZjM6E8mnx98yE1vMyYrdoSn/FSbiwHi1gdSyP2qxnzDIf3ur9knmEtvTAkUjpGRB+UphQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc7PV8Od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc7PV8Od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039631F00A3A;
	Fri, 14 Aug 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786729434;
	bh=F3PEOV8m/Ibpsgwt/AIXlf63+WI7aRV76XNs4DZwDP8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hc7PV8Odo4UNOtkJpA7bqNHd6h2y8o+y45mcBy+zseK0m9jrDlTL79xJ0He3/EnkJ
	 D0dE0MQCLYszabvZZRXVfbog3XWju/f+tOHlp5igq6jJTvDGV8y74d50foxENLaHSM
	 NoaDC6B+HayTpZP+Rp0iG+wa/VvOm/TFpWOZnA1xuAGZA20D24wYPauOXz54HPsS4B
	 PWth8TSinjEbs3qQuNV8rd0Cj36q8gGwPmbyOSBCuqSoV2m0r/Ghr+bYmJU2nutMyM
	 UNtNHU2IixYRT+PvIInYlObnOGmPy3raf2JkhbMXvCJZTutfXILIKPWMIey3VXlANd
	 PQcVIgFv3cXWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C4B3924457;
	Fri, 14 Aug 2026 17:43:09 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a4qoewl7.wl-tiwai@suse.de>
References: <87a4qoewl7.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a4qoewl7.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2
X-PR-Tracked-Commit-Id: a92ee0d2486a8b3cd1483afdb6db21b51853867e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5161661ae99f497affa83a5b8654e457cda6267
Message-Id: <178672938785.3893955.2980223555929847367.pr-tracker-bot@kernel.org>
Date: Fri, 14 Aug 2026 17:43:07 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Aug 2026 14:05:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5161661ae99f497affa83a5b8654e457cda6267

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
