Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97A1E3DCD;
	Sat, 13 Dec 2025 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765601211; cv=none; b=dx4OpgeXvSjupyxllI732z27/Yh7QhF+1Qfj2ukUozCBgwL7ToekRRf+w0gWJNFMi+Gg3Q4TLJbwV6zBvbXsK3SBKsD0rOra3TbB1bocoPlv+aFLqKS13pO/dqBsZLoiRKao3RlumDWVBQAkP3y4K/SK8XiPAGlHllWR3hpkOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765601211; c=relaxed/simple;
	bh=5nGm4Cc38ViBo4wKFzcBUKE+wAtV0SymPvkjvIvKC4I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cCRduKFnqQe/W4bAzN/wf8uVdmSDoBSb74UEWUq9b+df9VwjRGZo56EW0cscyihpzeTwyJtcOQLTFi7VuzYHvxztDmncKpA5E4gA1ykipxjL/Mob2n+8bFehDdZ7n8jiVweId7A4sf1lM0yNXAUjm6M3i+PyyEpDagdWs3sIcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rhmmq/Ve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rhmmq/Ve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A64DC4CEF7;
	Sat, 13 Dec 2025 04:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765601211;
	bh=5nGm4Cc38ViBo4wKFzcBUKE+wAtV0SymPvkjvIvKC4I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rhmmq/VeyefVoGlhlvhswFT9gx3+J/xv7JhOdu2oIwV7zRQ5THKU3Z29OQxzCqYWR
	 eWfKHByRwMfZZBXk713OSiEUB2uXe+jSVU3AbZXYd0pFUS1EwistU+aO1QFMW8KwzX
	 cTNyoyOcvAwH1fdPMvuZ/j18JtFx86/u2w7MQT7XyNgakfYa6GQahY19qTm+vcMvjE
	 V5Gh8wxMcVS+0vdnmjdxC2XC5itQpfBWzE97Po1KtBIo1oltD/vFYz3rnm4x1e3+eK
	 5rk3USBdgycDrVP632CD3Qbm+IjmP+QvVS/kQg9LA2DTW0fi/Tdr/MgYkTJPEASkeO
	 jWXpgEX0V/CkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B583C380A954;
	Sat, 13 Dec 2025 04:43:45 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zf7p9ccr.wl-tiwai@suse.de>
References: <87zf7p9ccr.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zf7p9ccr.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.19-rc1
X-PR-Tracked-Commit-Id: fd324768eb2c132bb111ba76675b4c72406251d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f3c8f9191254654e6a88cd757ff079dafbd2f0b
Message-Id: <176560102436.2405448.9338020658767402835.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 04:43:44 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 11 Dec 2025 18:07:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f3c8f9191254654e6a88cd757ff079dafbd2f0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
