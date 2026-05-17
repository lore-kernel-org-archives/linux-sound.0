Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF12EC571;
	Sun, 17 May 2026 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046093; cv=none; b=IKggs95wV94zy5FaEUHfzT31D4EF1tbfiRrcjU+dDw5mOyiSQb3yUgGwv59KkvS56iauOKwEAv9eLauVQtyfb+2EK7aQE5GGeCV6xvnusoJRTr0thHAOUk9u4gSzChj0ReWpq0E484iAxMX+Q1I/8fPRY9whS7MaRUYN0013e54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046093; c=relaxed/simple;
	bh=dtYOYJTx1TOUGMXuyX3K6AWV8TeVpvCD988L/DP27hs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jbL5PGGfOWUhlm9fiUDVAX3gjjBIRnzN7/lwk69XRglZv528eGdsjETiQNrX/MnC6VBibyb7CrpjAmeILxACij5bl6bmsEpHyWtbBYKm+cezYQk3oMuqawWN/Jqb48PjFm4hRVwN/QIfdcOjsHPcuY0kF80h+YRSETyVkkbatVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3m4ACjA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3m4ACjA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BF5C2BCB0;
	Sun, 17 May 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779046093;
	bh=dtYOYJTx1TOUGMXuyX3K6AWV8TeVpvCD988L/DP27hs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N3m4ACjAdm+ZAB++nIVlObcqe/Cmgxf4z0dfG+scd68lJs6niCKoiS0LCGf7+QKBV
	 zfSVkvfDQITlQ/B/9jNEP3oJKocd3ZraPAfKaVhdrXeipPtkZvamJCgJq2T1n3e4Gy
	 9sQgzUVwGaAiGBtjyF9lWCA4WCsLHHjjJvoaQ5um4iCrdRXbT75KGYHM4mHlLYf9mP
	 amqVuQ7CbBY9zzTe2LOICrtxshsg4yEryZ6fSR320BRMtbi9hB/1pqIfhEeUuL3NXT
	 5hJkXWZtyI4s+4SBQSr//QEn9j+4klcj1C2b9ZFDe24z9p4/W7Cn/F8i7BN/W+dfR2
	 z6NryV/aze/Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939B23930B89;
	Sun, 17 May 2026 19:28:26 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <874ik7zh58.wl-tiwai@suse.de>
References: <874ik7zh58.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <874ik7zh58.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc4
X-PR-Tracked-Commit-Id: 6fd9f6e870ea285f05102e8e00e6a7f4495a9a02
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b6a08b017f8c7723c7e4c3fc460a3a7bf5870b2c
Message-Id: <177904610527.673362.3847410345103216985.pr-tracker-bot@kernel.org>
Date: Sun, 17 May 2026 19:28:25 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 16 May 2026 14:13:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b6a08b017f8c7723c7e4c3fc460a3a7bf5870b2c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
