Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FFC393DD9;
	Fri, 27 Mar 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644002; cv=none; b=rbKZLtmDRxxnV/SIXC5NNLZ6Zu3JPAlChaEkf2aDvLvL+a3/p7KSYrTirJ54I32uzltGvh/+qpUK7NeYZzY1tKaNjyTKVhBcMJ7Qy4I5nVpKN14SKBWY5d3rXootMYnVGw6NpZ/M3LLHh1a6UMrsZytcPGhjo6F5exNDkdN9PWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644002; c=relaxed/simple;
	bh=JLeRIFvPvYzrGEYbBZ7soEP3Z45FDq9d8oxZnVGCX5g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GTKJMx+B2kQI/qPhWRRzy9wuDVnyGHjA9Cco7lKI+DgYhEEVfe4yE/n8FnJz/4ZNYoO8DOVOxGrIoNfpSB8yY9B2LWz0ndhtAtSEWlcE3seOkOu/R62jiyjoiR3uUMCRJS6ZChMGzLXDv5uV5sKzdHxSTBxmo3kaf3bC+yzqn18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPZBcT/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPZBcT/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8BFC19423;
	Fri, 27 Mar 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644002;
	bh=JLeRIFvPvYzrGEYbBZ7soEP3Z45FDq9d8oxZnVGCX5g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iPZBcT/SjeFPTlR9T9fGjGR97fAdYvCKvq771/ryMbYIZdhyn2Sq0XAChmSkfeJxX
	 eNyHfMKn3xhQ5YEa/6CqvkEiATzCkVLHRJR+23Bnm0zsmXHmGURWRafauuHWu4+qgh
	 w+/WbEYKGD+9sQlu+NSKO46CVpDi0JuUOKoCxGMusnY1Gxc94KzJ3F6XO2ZS+vMjtc
	 lWidC41J/abQ9HwF/LcLCc08b9MmNhssOLQPYDNRolhF6YWAldyiVH17+4oHbOwn0/
	 b7ecwr0976L02iY4/aXbkxlkAHEyg/scHENS6ul7NEi8MwSpUWsldef6waOq7kUIq9
	 br5+cx8Hjap6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0643806928;
	Fri, 27 Mar 2026 20:39:49 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zf3tr2dh.wl-tiwai@suse.de>
References: <87zf3tr2dh.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zf3tr2dh.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc6
X-PR-Tracked-Commit-Id: ed4da361bf943b9041fc63e5cb6af01b3c0de978
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83ce1c753f5789167f52df59d3ea64f01b3f77ba
Message-Id: <177464398811.3654421.1528043726343712761.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2026 20:39:48 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Mar 2026 11:30:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83ce1c753f5789167f52df59d3ea64f01b3f77ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
