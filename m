Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355EC33E1;
	Thu, 26 Dec 2024 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735248243; cv=none; b=BKo74/gDzM53cEMLb03SwFAD9gBNTWZzlZ7HTNgtqkFnRbAF+Djyl9iuoMiUMzefp6gDa5Jr3ZT1IPPjIhVgnnyQEtrM2iGJUxHQD1qHBEBdcTyGYiynI2WQCuFyRvnl9S/R2wElIa67l3Snonk73FpTDrrGbndC16mW7HC9zP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735248243; c=relaxed/simple;
	bh=f6dMI6v9vsnb4htjAaQMaSoBPwvpLSPYMpZFq1OmYGw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rRSbzxfuxVrtzcsPpe6OVH6WKY3F0yEF3lrQYmC5LLjjbmRJ8pdy1Uv7M7EyJ/kIdNJSBvEgTLDCvHTV+FsEnAbNoLQUMF+8FKaGGAcC8lmwdwsn8qH3H9EYktEwc7KtF3HR/pmTvAppMtnSCh/J9dgbsHOjGNcYcaWLgq5T1G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQRvhTya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQRvhTya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082B6C4CED1;
	Thu, 26 Dec 2024 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735248243;
	bh=f6dMI6v9vsnb4htjAaQMaSoBPwvpLSPYMpZFq1OmYGw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eQRvhTya6D/D7EM4dsdO8I5pPXDZohahmoN7iWv+CvuhEFOM23Wwd7aNt+cyNDXuG
	 DRGX0IVFUOuVct/NUdMMnnH/mxrXllHuVnH6kB0kdKytNFtDlLWWEmkUnvs/xESnDr
	 f6Vhq3rVW+osDxEmNp1mpJGYSbDrRIWKBdXnDlQTZAhbTaklVNJRmf6Ak0C24uSB7s
	 ilAjyn8hVEZlBNmIXjA7LjXdBsn/nG7ezOWQhMcR08BzpxENBmfteEwibUQbfZer6e
	 JN/zRrjesEiA71JwLekyXNHzmlPNZkdhRsND6+DW1HERTCELZENmL5BO/7UQw6utAd
	 S/gJyd7IudbPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4B035380A955;
	Thu, 26 Dec 2024 21:24:23 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfki5sia.wl-tiwai@suse.de>
References: <87zfki5sia.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zfki5sia.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc5
X-PR-Tracked-Commit-Id: 8cbd01ba9c38eb16f3a572300da486ac544519b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d6ef8b40d075c425f548002d2f35ae3f06e9cf96
Message-Id: <173524826202.378045.10310109015382354951.pr-tracker-bot@kernel.org>
Date: Thu, 26 Dec 2024 21:24:22 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 26 Dec 2024 17:16:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.13-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d6ef8b40d075c425f548002d2f35ae3f06e9cf96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
