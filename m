Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22F1946C8;
	Fri, 17 Oct 2025 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715075; cv=none; b=JeJ0XxSI7pu/c68WvYCJmrsOLXaqyaaHZ29Qx263wWBqcvh0KMgCDdta1Lzrb9G5HXxdP9ehYHUclIn1EVaOt25DOTuXnkbHFB+7MD/H9OgCCzQzfcu5HrjsvImzuqNMeAp3XPPSQI6G+Ms0kzl0Sh5Vhj9dXv4YQnEnQhh1+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715075; c=relaxed/simple;
	bh=LTkDNHaQ/jmxgU5fMe/ssd+JUgAQiQs37x3P5Ma5Tk0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ju8ExfJgqaiE9BRKEDluIQBp2xVGZDlJb1SAFMQOWgfKWwY47n5VJ6AWXueoLXUJ6NCoWN9CtuRgNCiJBna9A4y6mjP1uenQS84blTrFr0pLv77bBYX+a6qfxW7JFO/If/iPkuyoAalTzuKdFyeJftSTbQ0FM6LRusRlrWAn/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qs8Zeo+b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qs8Zeo+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE29C116B1;
	Fri, 17 Oct 2025 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760715075;
	bh=LTkDNHaQ/jmxgU5fMe/ssd+JUgAQiQs37x3P5Ma5Tk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qs8Zeo+bxqK0ndWsTUrBN3db+UR8sokHyHMYNSFw9gWKVJZnMSMdvweCvKTFVxPRK
	 tpot5sh7ye6Xzd9w6lGFTjMjJZJ8Q23wwIlUAjcRHtSJgzcPGn/C7nqQUH+Xop7eHe
	 Zg9I9lKgnSpV1r0mEocB98RGdS7AT49cdZ25l8+JijgY4kcdSy5V74ABoRiCie6Fv9
	 2rpSGQi7E9IuVSAlnlPerzFXJEYTzNUMzgUDe8WYHdsOLllVnyTkWLhCivQsQj8anT
	 CdkuCnIDc/i8skVkbdziHEyBYjMLvFPFhdon9ghO5NLp+U9UFFi65naz9DxxqlM/8B
	 cnvUfudnMaeKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E4839EF978;
	Fri, 17 Oct 2025 15:31:00 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a51p60fz.wl-tiwai@suse.de>
References: <87a51p60fz.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a51p60fz.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18-rc2
X-PR-Tracked-Commit-Id: 2a786348004b34c5f61235d51c40c1c718b1f8f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1422424187a548c24825645410fb7f691c2df47f
Message-Id: <176071505946.2669258.14636742343060777290.pr-tracker-bot@kernel.org>
Date: Fri, 17 Oct 2025 15:30:59 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Oct 2025 16:57:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1422424187a548c24825645410fb7f691c2df47f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
