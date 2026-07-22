Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090523D75A6;
	Wed, 22 Jul 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753650; cv=none; b=BCqH5yAfr5xTdBltsBhMJN8jXPILVAyJbqY2b9TVtfUCgaC2jEFXacRmyY+VWoVugpHzbNAfQFATiOvqKvvZc6H0nKOKcNZfEq+yWl2Bu7lGRjEc85ep+OzBuF/O7rEFoqxz+mRAp8lIt2CptyBhAJ+IftBctLgfweUaFI0iI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753650; c=relaxed/simple;
	bh=eDzLmZPUJYcMkhHbKwDWIRPa6/B2fzaIoqe2DB08l1w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Yknq5jvPQKT6JgjdAC4t7t2XnK4rsM+S6WaiImojZMGawl+LUL1rnAWAn6PyPV2liM+h4ls+CW0hAIedy1xzf/0185u9/TpQ5n9TQdtCRQflQcspuWYVoNPp3B13xm1lFIiijneQDs0N1jcEv0LQR0YwbzLX8yQxfB5tA2k5z7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLH66ytQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLH66ytQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38EA1F00A3A;
	Wed, 22 Jul 2026 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753648;
	bh=95PiDa3iundxBjCdVDGSxq/iFZXpzDhPiZ4CSCi76z0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HLH66ytQRWoaMi3kt6A0Ycmefr9e+tofYWHSyCyXyQw4scQoZWMR9gwGII0jcfdX+
	 mTXpV/+VQwt/25Vgn9GC7oHdirdeyW1x6XqshlP5UCxepacpuRI+SMQo2nyzAcRPl7
	 /Cp+VaCfOJqI/WZmwPDXEtk5IA+KOgROhirDKMMta30Rr//uzV/qoa/8wmyZaoFXX7
	 R3PWl7Gr4glz7y+haUUS/47TqCP4YG44dAr2+obt1dcD1J9wc9QodCQJx1JbRJYfpi
	 veTejZH6QSE8n4vTGUo1NazTtZrOlYiZcjKjf5HmQwWwnRvuq4FrJ7JYMq2fV7zgnR
	 vYHnsWRipdRqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AA0380CED4;
	Wed, 22 Jul 2026 20:53:38 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ldb3gzb9.wl-tiwai@suse.de>
References: <87ldb3gzb9.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ldb3gzb9.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc5
X-PR-Tracked-Commit-Id: 9573818cc1b7ac22176d0a2b60bfbc440e94f7d5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57a92aaba9089601bbe8f520fbc3c8d858498c21
Message-Id: <178475361739.2020310.15657760701967671703.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jul 2026 20:53:37 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 22 Jul 2026 11:15:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57a92aaba9089601bbe8f520fbc3c8d858498c21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
