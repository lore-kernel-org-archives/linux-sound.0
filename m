Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417994657D6;
	Thu,  7 May 2026 16:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170012; cv=none; b=MLTA93nGslHiy/+T19HhCP3/TX9GK2Vu3ijOY8Nbm2K8ear0lu5porbiuk4SeqkgpveJfLbsRFuVy5jB0ek1HtKlHs1iFNrF11wmCJ5DgeV9kJhpZTp6Q2kBWDHCLl79yGoCDIleoOU1L/2K2fpmDDd0SFNRpvQ+VPiBYriZ1Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170012; c=relaxed/simple;
	bh=qB3KY79Pufkw0l1QK117mR5YIxqUm4xFfi232/NQcS8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fPTtLkuqhWTeWKaiZC1t1WQAIWrXqz0LJLU85Xu8NQaOV7wETRmJYOnFvOxr1ZiM54QSfOMICkQH50tbS5CFFh6JOMSlCnLMR/WT2MuuLPE7+tBD+QCDLKanx54vVYS8Pt3LeDpw8ph32eSUvyf/HRAhc27ULrd2vBmkCkOqLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBO5BE+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBO5BE+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26E9C2BCB2;
	Thu,  7 May 2026 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170011;
	bh=qB3KY79Pufkw0l1QK117mR5YIxqUm4xFfi232/NQcS8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mBO5BE+czLazMiFst5+wuZLVv7J1xZ9sBpOJ4JY0yEJ9l8rnA/amzv5hYvfiEnlyN
	 Pqhe1XEOybsWXN8GQuXRRahlqZAAOFuzmqm2DnMSdEF7uDxrzCntfKeZpf0Z1xSUD6
	 Im51ZrQj2NkK4+8IUBRihw4yraCp7qc/nHg4tAafZbFUroGzfSYJGj8OBUiQHOHS1D
	 rGvoX60EqnuuahgJFpJOI/Tn3iJGlaJyuKKt5atBUVbd/q5ZbFpmfi8g6fMDcdimxR
	 XlQanagasgPQugN4CQvCkq4hLDKdXZi4zm0Il5qmQufxPhGsuusPP6iTCHExPFmS1X
	 z4uIbEM6pw8PA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF273930909;
	Thu,  7 May 2026 16:06:02 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjerqzr3.wl-tiwai@suse.de>
References: <87bjerqzr3.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjerqzr3.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc3
X-PR-Tracked-Commit-Id: 06bc7ff0a1e0f2b0102e1314e3527a7ec0997851
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 19cbc75c56c0ed4fa3f637e3c41a98895a68dfae
Message-Id: <177816996073.4057089.5660900230788087843.pr-tracker-bot@kernel.org>
Date: Thu, 07 May 2026 16:06:00 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 07 May 2026 12:29:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/19cbc75c56c0ed4fa3f637e3c41a98895a68dfae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
