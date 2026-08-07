Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C85360EFF;
	Fri,  7 Aug 2026 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112882; cv=none; b=U2WcqwJ3kL0CgtST343jtxPjEftWgoYr3lcn0fBq/LuVI1Zu4IPNdocvoeLV/n22qztGpx5cDWzgdVkIr6Lp4+7igsqmR26/5mbiqD3r9fBM8vLyFRiU3eXuMTfQGuyk6h7abKG2gg8tvPWgbQ6bao15X5/Xqkvz/TW4QHnH/cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112882; c=relaxed/simple;
	bh=EpdfG+kEf/mAffi8oXQQ5lPck/sTfF4lRmVxVuwlVnI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ShQJblGUK53p8JjUrsjZI3dqRgNI6GKa0X/P/p5Kkkckfaht/VtPiK2GZQ04T0/WxEHYCK8HL8c6MrQ64vQnqZnnGz8Q+OZnFKAJEWBQ3tJSszZ6RpYN1zqLyEpjzecQcWytMrRUCuuVXGbnILyjA5BYJLvW78ms2pF0pk7xVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUVKPU/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUVKPU/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00DB1F00A3D;
	Fri,  7 Aug 2026 14:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112880;
	bh=ys5dAHlem55XhSZv4sSMJFr62kllTNTEI5xmtg/zGEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jUVKPU/w5IByJr/AhQ9C/suorI7R9hfk0AMQVOzFHr5nBdF11Nl8sFwutdrNBhR1L
	 4HTQ6XmiM8guRdPR6bM6oSdZNqLrcwWAHazKOe+gxdKCWwdfF4H7yJWqmMB8UdPRkb
	 j9u6X/ZTonIYE/pc1bT2O2TJwF07mIcoV6ARH8Nj+b4LPmLu4xOCDFnYKo2r0DmLHn
	 0HsAGOpysqfqyR+Qp2SzZx83ofPSTmIAoT/CvaDlwwAKOsEW1iVXo9AIqKqF856KXI
	 UAUNzXiCxEFwpEjeVKn8GI3Tq9N8/bMuceTLDFt06CJuHjRbmNe1AHu2ylgJwj7o0a
	 yuYtoG/+C2FCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B40380CECE;
	Fri,  7 Aug 2026 14:27:20 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v79mb9yb.wl-tiwai@suse.de>
References: <87v79mb9yb.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87v79mb9yb.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc7
X-PR-Tracked-Commit-Id: a8934c2c6dfd72901cf3cc0de28e85eb902a61a4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e73882ecff98cacbd1a5e1bffa2661a19cf85a1
Message-Id: <178611283918.1826887.3141868563885059367.pr-tracker-bot@kernel.org>
Date: Fri, 07 Aug 2026 14:27:19 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 07 Aug 2026 10:39:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e73882ecff98cacbd1a5e1bffa2661a19cf85a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
