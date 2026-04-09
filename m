Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316BA3446BC;
	Thu,  9 Apr 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768280; cv=none; b=WgP8kInKzTcHzQEZ2qJHkPwb9vYVoRchTD+swgGLlcp+B2IJOllbHuzbc8hf5WhNWRg+DCSV3iVmUlBKIypNZulPkZ5XJwLyVFK2lF2rkDd/f1jEg5RS6EgaNgpt7w2Qkhg48OATMTLdMV7mx68Gpt5gOHWhthkN9+KXcIfIEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768280; c=relaxed/simple;
	bh=mlWrLe5JuyaWrCe4ejkBys0LIaSb7/KtYHrm2fTfs8w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ip8wGyHHGtdsrKFf9re/x32OIomPxpelKr7xYPNHxulOHM2VVbZ+0PPKCiqLStQ4aLcEnSSFfW2DpBjU2HrpuORezgseqjKDNf2o3/0sS2bZIhPlPgrSV9wjOdHGLykPlKhq3bKXr1mLV6RVh2dMD1tzbGENYoS0TYVYyA47Sg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owop9FG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owop9FG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3758C4CEF7;
	Thu,  9 Apr 2026 20:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775768279;
	bh=mlWrLe5JuyaWrCe4ejkBys0LIaSb7/KtYHrm2fTfs8w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=owop9FG8UN6HHAYc01B8i/aZs9Ko5NsfDaY3pldgXpXR/bImSv81FgIfs+I9AENaX
	 4F9+bIxxKM0mUTm2FdbsYTOnTU7pVN61AkCeUGtamzcVDm/+jEgsBAjJHawTLdoNpA
	 ougAzQwHdjXahy6Y31hMVem4UB56YawCS2sWMHu5YU2prOcn72JiNmt7TvTDTZ/WB5
	 RQ1W1L93pXFD67fGTyjaiCGD69QmzOER0vKdJNm0qD1eX4aMfMOsl3slJcUFt1DWim
	 61TUejvqZd6YECMwvez7YyH1PSTCLpc2xBopjW4ihGIv8I12I76z5A7SP7b4vk7+w4
	 aNaRT75ngokhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF3939308B7;
	Thu,  9 Apr 2026 20:57:36 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a4vci2fo.wl-tiwai@suse.de>
References: <87a4vci2fo.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a4vci2fo.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0
X-PR-Tracked-Commit-Id: 00afb1811fa638dacf125dd1c343b7a181624dfd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb2ea74eeb6735eed29bd74695f90f0e5af09f5c
Message-Id: <177576825505.1737704.16098174463752743861.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2026 20:57:35 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 09 Apr 2026 17:22:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb2ea74eeb6735eed29bd74695f90f0e5af09f5c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
