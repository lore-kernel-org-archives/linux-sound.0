Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A12EBB81;
	Fri, 16 Jan 2026 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595110; cv=none; b=WvwB5Q/QObglpmg70h0iq96Zkr4d/6DbhVjjb34n5V0aCvfLCwedZKgyic/sAGluRAcAQ3pJcR7igSbHALaWTE/ep7JA3wV2VZUs8G6xFt9xR1HuFhnisUMYcgWpM11d0lZdUhIKtA/W/5STM9l4QPGeGC6lcJ4IwlZN1oa6KBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595110; c=relaxed/simple;
	bh=ktSX3ZydDz+iFkhSGlFAztNOa8g10UR+rHnDocpW4Ko=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uPU8dS2xz96LJarNPPKkAN4eYKXuI/ttx2aHSiRSAN51a5w+eTjrUyGBDS468UGQoeoOHBkTp/T3Izzbrz8DCutOd8/jflh+7Nx+bLL6ia+aQJYUIJ6TO2EUHRF5D1SXyNXLOoT3Jbz5SzMBuMdvDdQzmeIBsgI6CyLsQGxWgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svouxWPA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svouxWPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19D8C19422;
	Fri, 16 Jan 2026 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768595109;
	bh=ktSX3ZydDz+iFkhSGlFAztNOa8g10UR+rHnDocpW4Ko=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=svouxWPAq7ZzDPGrvnjzOPDDq+Dw7E7GQRe0T4/TwEMLwV21D39V48mh6AOTRJv79
	 LznDRwxXteu4KkYq5xQW0ek0AhSBl0M5gkXDvG1CpmLhOHkEPD41xROlnHkYujh7cf
	 uW6kqpp1B4sfgucVeyzAa7XDcD8QqeRpEPS4rgJo90gCinj46RplKT/LRdEoUWcWMV
	 g3vfDTTcP8gtnJA15d5/7c9Ui94PuhOo02N4tF5wVwh61z2l5nDKx9sFJ/ATr6tJBM
	 sqPgVt92tV5rcEoEQ6T4a7iyemyIZ2zHw0CXFx+Vfp5Yjo4BoYP32NWpd7uR2jC8s1
	 k1zPYF4LTwxAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 792A3380CED1;
	Fri, 16 Jan 2026 20:21:42 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zf6ddarv.wl-tiwai@suse.de>
References: <87zf6ddarv.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zf6ddarv.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc6
X-PR-Tracked-Commit-Id: 46b8d0888f01f250fbd24d00ff80b755c3c42cd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 711673f8dd19cfb907913cb762d4c6c1b9d2a332
Message-Id: <176859490102.789588.10083037980864138539.pr-tracker-bot@kernel.org>
Date: Fri, 16 Jan 2026 20:21:41 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Jan 2026 13:04:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/711673f8dd19cfb907913cb762d4c6c1b9d2a332

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
